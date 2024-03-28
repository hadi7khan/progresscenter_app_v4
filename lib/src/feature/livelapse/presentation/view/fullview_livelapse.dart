import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_livelapse_by_id.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/provider/livelapse_by_id_controller.dart';
import 'package:video_player/video_player.dart';
import 'dart:developer';

class FullviewLivelapse extends ConsumerStatefulWidget {
  final projectId;
  final cameraId;
  final livelapseId;
  const FullviewLivelapse({
    super.key,
    this.livelapseId,
    this.projectId,
    this.cameraId,
  });

  @override
  ConsumerState<FullviewLivelapse> createState() => _FullviewLivelapseState();
}

class _FullviewLivelapseState extends BaseConsumerState<FullviewLivelapse> {
  VideoPlayerController? controller;
  ChewieController? chewieController;
  BetterPlayerController? betterController;
  String url = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(livelapseByIdControllerProvider.notifier)
          .getLivelapseById(
              widget.projectId, widget.cameraId, widget.livelapseId)
          .then((value) {
        log("valueeeee" + value.toString());
        setState(() {
          url = value.url;
          name = value.name;
        });
        _initPlayer();
      });
    });
  }

  Future _initPlayer() async {
    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, url);
    betterController = BetterPlayerController(
        BetterPlayerConfiguration(
          autoPlay: true,
          fullScreenByDefault: false,
          // fullScreenAspectRatio: 16 / 9,
          fit: BoxFit.fitHeight,
          looping: false,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
    betterController!.addEventsListener((BetterPlayerEvent event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        betterController!.setOverriddenAspectRatio(
            betterController!.videoPlayerController!.value.aspectRatio);
        setState(() {});
      }
    });
    // controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    // await controller!.initialize().then((value) {
    //   chewieController = ChewieController(
    //     videoPlayerController: controller!,
    //     autoPlay: true,
    //     looping: true,
    //     additionalOptions: (context) {
    //       return <OptionItem>[
    //         OptionItem(
    //           onTap: () => debugPrint('Option 1 pressed!'),
    //           iconData: Icons.chat,
    //           title: 'Option 1',
    //         ),
    //         OptionItem(
    //           onTap: () => debugPrint('Option 2 pressed!'),
    //           iconData: Icons.share,
    //           title: 'Option 2',
    //         ),
    //       ];
    //     },
    //   );
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    controller!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final livelapseData = ref.watch(
        livelapseByIdControllerProvider.select((value) => value.livelapseById));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: livelapseData.when(
          data: (data) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: Container(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w, left: 16.w),
                    child: AppBar(
                      backgroundColor: Colors.black,
                      surfaceTintColor: Colors.black,
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                      automaticallyImplyLeading: false,
                      titleSpacing: 12.0.w,
                      leading: InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context.pop();
                        },
                        child: Transform.rotate(
                          angle: 180 * (3.1415926535 / 180),
                          child: SvgPicture.asset(
                              'assets/images/chevron-right.svg',
                              color: Colors.white,
                              fit: BoxFit.contain),
                        ),
                      ),
                      leadingWidth: 24,
                      title: Text(
                        name,
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      // actions: [

                      //   SizedBox(width: 5.w),
                      //   InkWell(
                      //     child: SvgPicture.asset('assets/images/plus.svg'),
                      //     onTap: () {
                      //       _showDroneFootageBottomSheet(context);
                      //     },
                      //   ),
                      // ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: betterController!
                        .videoPlayerController!.value.aspectRatio,
                    child:
                        // chewieController == null
                        //     ? Center(
                        //         child: CircularProgressIndicator(
                        //         color: ref.watch(primaryColorProvider),
                        //       ))
                        //     :
                        BetterPlayer(
                      controller: betterController!,
                    ),
                    //  Chewie(
                    //     controller: chewieController!,
                    //   )
                  ),
                ),
              ),
            );
          },
          error: (err, _) {
            return const Text("Failed to load Livelapse",
                style:
                    TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
          },
          loading: () => LoadingLivelapseById(),
        ));
  }
}
