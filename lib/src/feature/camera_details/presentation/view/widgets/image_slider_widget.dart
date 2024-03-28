import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart'
    as model;
import 'dart:developer' as dev;

class ImageSliderWidget extends ConsumerStatefulWidget {
  final model.ImagesByCameraIdModel imagesByCameraIdInter;
  final model.Image currentImage;
  final Function onChange;

  const ImageSliderWidget({
    super.key,
    required this.imagesByCameraIdInter,
    required this.currentImage,
    required this.onChange,
  });

  @override
  ConsumerState<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends BaseConsumerState<ImageSliderWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 2), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  parseDateTimeString(String time) {
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, builder) {
          return SizedBox(
            width: 2.w,
          );
        },
        itemCount: widget.imagesByCameraIdInter.images!.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemBuilder: ((context, index) {
          final reversedIndex =
              widget.imagesByCameraIdInter.images!.length - 1 - index;
          dev.log("reversedIndex:" + reversedIndex.toString());
          dev.log("index:" + index.toString());
          dev.log("length:" +
              widget.imagesByCameraIdInter.images!.length.toString());

          return InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              final image = model.Image(
                id: widget.imagesByCameraIdInter.images![reversedIndex].id,
                name: widget.imagesByCameraIdInter.images![reversedIndex].name,
                datetime: widget
                    .imagesByCameraIdInter.images![reversedIndex].datetime,
                date: widget.imagesByCameraIdInter.images![reversedIndex].date,
                time: widget.imagesByCameraIdInter.images![reversedIndex].time,
                urlPreview: widget
                    .imagesByCameraIdInter.images![reversedIndex].urlPreview,
                urlThumb: widget
                    .imagesByCameraIdInter.images![reversedIndex].urlThumb,
                url4K:
                    widget.imagesByCameraIdInter.images![reversedIndex].url4K,
                resolution: widget
                    .imagesByCameraIdInter.images![reversedIndex].resolution,
              );
              widget.onChange(image);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: Column(
                  key: GlobalObjectKey(
                      widget.imagesByCameraIdInter.images![reversedIndex].id!),
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: widget.currentImage.id ==
                                widget.imagesByCameraIdInter
                                    .images![reversedIndex].id!
                            ? Border.all(
                                color: ref.watch(primaryColorProvider),
                                width: 2.w,
                              )
                            : Border.all(width: 2.w, color: Colors.transparent),
                      ),
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: widget.currentImage.id ==
                                  widget.imagesByCameraIdInter
                                      .images![reversedIndex].id!
                              ? Border.all(
                                  color: Colors.white,
                                  width: 0.7.w,
                                )
                              : Border.all(
                                  width: 0.6.w, color: Colors.transparent),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: Image.network(
                            widget.imagesByCameraIdInter.images![reversedIndex]
                                .urlThumb!,
                            gaplessPlayback: true,
                            width: 44.w,
                            height: 44.h,
                            fit: BoxFit.fill,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  width: 44.w,
                                  height: 44.h,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      parseDateTimeString(widget.imagesByCameraIdInter
                          .images![reversedIndex].datetime!),
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
            ),
          );
        }));
  }
}
