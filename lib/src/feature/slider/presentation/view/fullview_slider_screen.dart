import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'dart:developer';

class FullviewSliderScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  final sliderData;
  final imagesBytes;
  const FullviewSliderScreen(
      {super.key,
      required this.cameraId,
      required this.projectId,
      required this.projectName,
      required this.sliderData,
      required this.imagesBytes});

  @override
  ConsumerState<FullviewSliderScreen> createState() =>
      _FullviewSliderScreenState();
}

class _FullviewSliderScreenState
    extends BaseConsumerState<FullviewSliderScreen> {
  int currentslider = 0;

  @override
  void initState() {
    super.initState();

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
  }

  // void dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: widget.imagesBytes.isNotEmpty
              ? RotatedBox(
                  quarterTurns: 1,
                  child: Center(
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.memory(
                              widget.imagesBytes[currentslider],
                              gaplessPlayback: true,
                              width: double.infinity,
                              height: double.infinity,
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
                              context.pop();
                            },
                            child: BlurryContainer(
                              blur: 3,
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 8.w),
                              borderRadius: BorderRadius.circular(30.r),
                              color: Colors.white.withOpacity(0.1),
                              child: SvgPicture.asset(
                                'assets/images/minimize.svg',
                                height: 16.h,
                                width: 16.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).size.height * 0.2,
                            child: SliderTheme(
                              data: SliderThemeData(
                                activeTickMarkColor: Colors.transparent,
                                inactiveTickMarkColor: Colors.transparent,
                                disabledInactiveTickMarkColor: Colors.grey,
                                activeTrackColor:
                                    ref.watch(primaryColorProvider),
                                thumbColor: Colors.white,
                              ),
                              child: Slider.adaptive(
                                min: 0,
                                max: widget.sliderData.length.toDouble() - 1,
                                divisions: widget.sliderData.length - 1,
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
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
