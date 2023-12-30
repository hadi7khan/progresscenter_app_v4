import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_provider.dart';

class Images2Widget extends StatefulWidget {
  final int selectedImageIndex;
  final data;
  WidgetRef ref;
  final ValueChanged<String> changeTime;
  Images2Widget(
      {super.key,
      required this.selectedImageIndex,
      required this.ref,
      required this.changeTime,
      required this.data});

  @override
  State<Images2Widget> createState() => _Images2WidgetState();
}

class _Images2WidgetState extends State<Images2Widget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        padding:
            EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w, bottom: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        // height: MediaQuery.of(context).size.height * 1.6,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Image 1',
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 73.h,
              child: ListView.separated(
                  separatorBuilder: (context, builder) {
                    return SizedBox(
                      width: 2.w,
                    );
                  },
                  itemCount: widget.data.images!.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    String dateWithT =
                        widget.data.images![index].datetime!.substring(0, 8) +
                            'T' +
                            widget.data.images![index].datetime!.substring(8);
                    DateTime dateTime = DateTime.parse(dateWithT);
                    final String formattedTime =
                        DateFormat('h:mm a').format(dateTime);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        final imageData = ImageData(
                          name: widget.data.images![index].name,
                          dateTime: widget.data.images![index].datetime,
                          camera: widget.data.images![index].camera,
                          id: widget.data.images![index].id,
                          urlPreview: widget.data.images![index].urlPreview,
                        );

                        widget.ref
                            .read(splitView2DataProvider.notifier)
                            .setImageData(imageData);
                        widget.changeTime(widget.data.images![index].datetime);
                        context.pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.h),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: selectedIndex == index
                                      ? Border.all(
                                          color: Helper.primary,
                                          width: 2.w,
                                        )
                                      : Border.all(
                                          width: 2.w,
                                          color: Colors.transparent),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: Image.network(
                                    widget.data.images![index].urlThumb!,
                                    gaplessPlayback: true,
                                    width: 44.w,
                                    height: 44.h,
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
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
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                formattedTime,
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: Helper.textColor700,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    ]);
  }
}
