import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class FullviewSliderScreen extends StatefulWidget {
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
  State<FullviewSliderScreen> createState() => _FullviewSliderScreenState();
}

class _FullviewSliderScreenState extends State<FullviewSliderScreen> {
  int currentslider = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            widget.imagesBytes.isNotEmpty
                ? Stack(
                    fit: StackFit.loose,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: InteractiveViewer(
                              maxScale: 10,
                              child: Image.memory(
                                // imageBytesList.isNotEmpty ?
                                // currentBytes!,
                                widget.imagesBytes[currentslider],
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
                      ),
                      Positioned(
                        bottom: 16,
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
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
            widget.imagesBytes.isNotEmpty
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
                  )
                : SizedBox(),
          ],
        ),
      )),
    );
  }
}
