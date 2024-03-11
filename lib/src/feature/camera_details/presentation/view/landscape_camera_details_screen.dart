import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_controller_watcher.dart';

class LandscapeCameraDetailsScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  final imagesData;
  const LandscapeCameraDetailsScreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
    required this.imagesData,
  });

  @override
  ConsumerState<LandscapeCameraDetailsScreen> createState() =>
      _LandscapeCameraDetailsScreenState();
}

class _LandscapeCameraDetailsScreenState
    extends BaseConsumerState<LandscapeCameraDetailsScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = ref.watch(currentImageProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            return RotatedBox(
              quarterTurns: 1,
              child: Stack(
                children: [
                  Center(
                    child: Stack(children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: InteractiveViewer(
                          clipBehavior: Clip.none,
                          maxScale: 10,
                          child: Image.network(
                            currentImage == null
                                ? widget.imagesData.images![0].urlPreview!
                                : currentImage.urlPreview!,
                            gaplessPlayback: true,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Center(
                                child: CircularProgressIndicator(
                                  color: ref.watch(primaryColorProvider),
                                  value: (loadingProgress != null)
                                      ? (loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!)
                                      : 0,
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 16,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: BlurryContainer(
                        blur: 3,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/close-x.svg',
                          height: 16.h,
                          width: 16.w,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
