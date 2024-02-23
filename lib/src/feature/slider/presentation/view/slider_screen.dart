import 'dart:async';
import 'dart:typed_data';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_slider.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/provider/progress_slider_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class SliderScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const SliderScreen(
      {super.key,
      required this.cameraId,
      required this.projectId,
      required this.projectName});

  @override
  ConsumerState<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends BaseConsumerState<SliderScreen> {
  int currentslider = 0;
  List<dynamic> imageUrls = [];
  bool loading = false;
  double progress = 0.0;

  // New list to hold preloaded image bytes
  List<Uint8List> imageBytesList = [];

  // Function to preload and cache images
  Future preloadImages(List<dynamic> imageUrls) async {
    loading = true;
    final client = http.Client();

    try {
      await Future.wait(imageUrls.map((url) async {
        final request = http.Request('GET', Uri.parse(url));
        await client.send(request).then((response) async {
// Create a buffer to hold the image data
          List<int> imageBytes = [];

          // Track the progress of the download
          int receivedBytes = 0;
          int totalBytes = response.contentLength ?? 0;

          await response.stream.forEach((List<int> chunk) {
            imageBytes.addAll(chunk);
            receivedBytes += chunk.length;
            setState(() {
              progress = receivedBytes / totalBytes;
            });
            log("recieve" + response.contentLength.toString());
            log('Progress for $url: ${(progress * 100).toStringAsFixed(2)}%');
          });

          // Convert the List<int> to Uint8List
          Uint8List uint8List = Uint8List.fromList(imageBytes);

          // Add the Uint8List to the list
          imageBytesList.add(uint8List);
        });
      }).toList());
    } finally {
      // Close the client after all requests are completed
      client.close();
    }
  }

  // Function to load the error image
  Future<Uint8List> _loadErrorImage() async {
    final response =
        await http.get(Uri.parse('assets/images/error_image.jpeg'));
    return response.bodyBytes;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(progressSliderControllerProvider.notifier)
          .getProgressSlider(
            widget.projectId,
            widget.cameraId,
          )
          .then((data) {
        List<dynamic> imageUrls = data.map((item) => item.urlPreview!).toList();

        preloadImages(imageUrls).then((value) {
          setState(() {
            loading = false;
          });
        });
      });
    });

// {
//   '1212':20,
//   '1222':30
// }

// 50/2

    // Timer? timer;
    // timer = Timer.periodic(Duration(milliseconds: 300), (_) {
    //   setState(() {
    //     progress = progress + 10;
    //     if (progress >= 100) {
    //       timer!.cancel();
    //       // percent=0;
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final progressSliderData = ref.watch(progressSliderControllerProvider
        .select((value) => value.progressSlider));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: Transform.rotate(
                angle: 180 * (3.1415926535 / 180),
                child: SvgPicture.asset('assets/images/chevron-right.svg',
                    color: Helper.iconColor, fit: BoxFit.contain),
              ),
            ),
            leadingWidth: 24,
            title: Text(
              "Progress Slider",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              SvgPicture.asset('assets/images/dots-vertical.svg'),
            ],
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 164.h),
            child: progressSliderData.when(
              data: (data) {
                if (data.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.88.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/illustration.svg'),
                        SizedBox(height: 16.h),
                        Text(
                          "No Images yet",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor900,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                }
                ;

                return Column(
                  children: [
                    imageBytesList.isNotEmpty
                        ? Stack(
                            children: [
                              AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: PinchZoom(
                                    maxScale: 10,
                                    child: Image.memory(
                                      imageBytesList[currentslider],
                                      gaplessPlayback: true,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: InkWell(
                                  onTap: () {
                                    context.push('/fullviewSlider', extra: {
                                      "projectId": widget.projectId,
                                      "projectName": widget.projectName,
                                      "cameraId": widget.cameraId,
                                      "sliderData": data,
                                      "imagesBytes": imageBytesList,
                                    });
                                  },
                                  child: BlurryContainer(
                                    blur: 3,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.h, horizontal: 8.w),
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Colors.white.withOpacity(0.1),
                                    child: SvgPicture.asset(
                                      'assets/images/expand.svg',
                                      height: 16.h,
                                      width: 16.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: CircularPercentIndicator(
                            radius: 20.0,
                            lineWidth: 3.0,
                            animation: true,
                            percent: progress,
                            center: Text(
                              "${(progress * 100).toStringAsFixed(2)}%",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            backgroundColor: Colors.grey,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Helper.primary,
                          )),
                    imageBytesList.isNotEmpty
                        ? SliderTheme(
                            data: SliderThemeData(
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              disabledInactiveTickMarkColor: Colors.grey,
                              activeTrackColor: ref.watch(primaryColorProvider),
                              thumbColor: Colors.white,
                            ),
                            child: Slider.adaptive(
                              min: 0,
                              max: data.length.toDouble() - 1,
                              divisions: data.length - 1,
                              value: currentslider.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  currentslider = value.round();
                                });
                              },
                            ),
                          )
                        : SizedBox(),
                  ],
                );
              },
              error: (err, _) {
                return const Text("Failed to fetch slider data",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => LoadingSlider(),
            ),
          ),
        ),
      ),
    );
  }
}
