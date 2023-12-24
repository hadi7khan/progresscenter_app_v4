import 'dart:typed_data';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_slider.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/provider/progress_slider_controller.dart';
import 'package:http/http.dart' as http;

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
  double _currentSliderValue = 0.0;
  List<dynamic> imageUrls = [];
  bool loading = false;
  // Uint8List? currentBytes;

  // New list to hold preloaded image bytes
  List<Uint8List> imageBytesList = [];

  // Function to preload and cache images
  Future preloadImages(List<dynamic> imageUrls) async {
    loading = true;
    print(imageUrls.toString());
    final client = http.Client();
    DateTime starttime = DateTime.now();
    await Future.wait(imageUrls.map((url) async {
      final index = imageUrls.indexOf(url);

      final response = await client.get(
        Uri.parse(url),
        headers: {"Content-Type": "'application/octet-stream'"},
      );
      print(index.toString());
      print("response" + response.bodyBytes.toString());
      if (response.statusCode == 200) {
        imageBytesList.add(response.bodyBytes);

        print("image list length" + imageBytesList.length.toString());
      } else {
        return ServerException();
        // Handle the case if the image couldn't be loaded
        // For example, you can use a default image or show an error image
        // imageBytesList.add(await _loadErrorImage());
      }
    }).toList());
    DateTime endtime = DateTime.now();
    print(starttime.toString() + endtime.toString());
    print("all done");
    // for (String url in imageUrls) {
    //   final client = http.Client();
    //   final response = await client.get(
    //     Uri.parse(url),
    //     headers: {"Content-Type": "'application/octet-stream'"},
    //   );
    //   print("response" + response.bodyBytes.toString());
    //   if (response.statusCode == 200) {
    //     imageBytesList.add(response.bodyBytes);

    //     print("image list length" + imageBytesList.length.toString());
    //   } else {
    //     return ServerException();
    //     // Handle the case if the image couldn't be loaded
    //     // For example, you can use a default image or show an error image
    //     // imageBytesList.add(await _loadErrorImage());
    //   }
    // }
    // DateTime endtime = DateTime.now();
    // print(starttime.toString() + endtime.toString());
    // print("all done");

    setState(() {
      loading = false;
    });
    // currentBytes = imageBytesList[0];
    print("bytes list" + imageBytesList.toString());
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
        print("data passed by controller" + data.toString());
        List<dynamic> imageUrls = data.map((item) => item.urlPreview!).toList();
        preloadImages(imageUrls).then((value) {
          setState(() {
            loading = false;
          });
        });
      });
    });
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
            centerTitle: true,
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
                                  child: InteractiveViewer(
                                    maxScale: 10,
                                    child: Image.memory(
                                      // imageBytesList.isNotEmpty ?
                                      // currentBytes!,
                                      imageBytesList[currentslider],
                                      // Uint8List.fromList(currentBytes!),
                                      gaplessPlayback: true,
                                      // : imageBytesList.first,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                      // errorBuilder: (BuildContext context,
                                      //     Object exception, StackTrace? stackTrace) {
                                      //   return ClipRRect(
                                      //     child: Image.asset(
                                      //       'assets/images/error_image.jpeg',
                                      //       fit: BoxFit.cover,
                                      //     ),
                                      //   );
                                      // },
                                    ),
                                  )
                                  // : ClipRRect(
                                  //     child: Image.asset(
                                  //       'assets/images/error_image.jpeg',
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: InkWell(
                                  onTap: () {
                                    // SystemChrome.setPreferredOrientations(
                                    //     [DeviceOrientation.landscapeRight]);
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
                        : Center(child: CircularProgressIndicator()),
                    imageBytesList.isNotEmpty
                        ? SliderTheme(
                            data: SliderThemeData(
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              disabledInactiveTickMarkColor: Colors.grey,
                              activeTrackColor: Helper.primary,
                              thumbColor: Colors.white,
                            ),
                            child: Slider.adaptive(
                              min: 0,
                              max: data.length.toDouble() - 1,
                              divisions: data.length - 1,
                              value: currentslider.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  // _currentSliderValue = value;
                                  // currentBytes = imageBytesList[value.round()];
                                  currentslider = value.round();
                                  print(value.toString());
                                });
                                // setState(() {});
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
