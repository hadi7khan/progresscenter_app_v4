import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class BasicTabView extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  const BasicTabView(
      {super.key, required this.projectId, required this.cameraId});

  @override
  ConsumerState<BasicTabView> createState() => _BasicTabViewState();
}

class _BasicTabViewState extends BaseConsumerState<BasicTabView> {
  bool _timeStamp = false;
  bool _stability = false;
  bool _dustyImages = false;
  String _duration = "1 Day";
  String _quality = "Select Quality";
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Duration",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showDurationBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('assets/images/clock.svg',
                              color: Helper.textColor500),
                          title: Text(
                            _duration,
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Select Quality",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showQualityBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('assets/images/quality.svg',
                              color: Helper.textColor500),
                          title: Text(
                            _quality,
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Add timestamp",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "Time and Date will be visible",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _timeStamp,
                          onChanged: (value) {
                            setState(() {
                              _timeStamp = value;
                            });
                          }),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Blend and stability",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _stability,
                          onChanged: (value) {
                            setState(() {
                              _stability = value;
                            });
                          }),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Exlude dusty images",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _dustyImages,
                          onChanged: (value) {
                            setState(() {
                              _dustyImages = value;
                            });
                          }),
                    ),
                  ]),
            ),
            SizedBox(height: 59.h),
            Container(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                child:
                    // isLoading
                    //     ? CircularProgressIndicator(
                    //         color: Colors.white,
                    //       )
                    //     :
                    Text(
                  "Create livelapse",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  // currentIndex == contents.length - 1 ? "Continue" : "Next"
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Helper.primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    )),
                onPressed: () async {
                  // if (_fbKey.currentState!.saveAndValidate()) {
                  //   setState(() {
                  //     isLoading = true;
                  //   });
                  //   Map<String, dynamic> data = {
                  //     "email": _verifyemailcontroller.text.toLowerCase(),
                  //   };
                  //   await ref
                  //       .watch(forgotPasswordProvider.notifier)
                  //       .forgotPass(data)
                  //       .then((value) async {
                  //     value.fold((failure) {
                  //       print("errorrrrrr");
                  //     }, (data) {
                  //       final token = data['token'];
                  //       context.push('/verifyEmail',
                  //           extra: {"token": token});
                  //     });

                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   });
                  //   // .onError((error, stackTrace) {
                  //   //   Utils.flushBarErrorMessage(
                  //   //       "Error", context);
                  //   //   setState(() {
                  //   //     isLoading = false;
                  //   //   });
                  //   // });
                  // }
                  // setState(() {
                  //   isLoading = false;
                  // });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDurationBottomSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 560.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Duration',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      _duration = "1 Day";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '1 Day',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "5 Days";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '5 Days',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "15 Days";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '15 Days',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "30 Days";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '30 Days',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "3 Months";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '3 Months',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "6 Months";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '6 Months',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "1 Year";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '1 Year',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      // setState(() {
                      //       _isLoading = true;
                      //     });
                      //     Map<String, dynamic> data = {
                      //       "quality": _quality,
                      //       "days": _duration,
                      //       "hasTimestamp": _timeStamp,
                      //       "hasAiBlending": _stability,
                      //       "filterBlurryImages": _dustyImages
                      //     };
                      //     print(data.toString());
                      //     await ref
                      //         .watch(inviteMembersProvider.notifier)
                      //         .inviteMember(data, widget.projectId)
                      //         .then((value) async {
                      //       value.fold((failure) {
                      //         print("errorrrrrr");
                      //       }, (data) {
                      //         // final token = data['token'];
                      //         // context.push('/verifyEmail',
                      //         //     extra: {"token": token});
                      //         context.pop();
                      //           Utils.toastSuccessMessage(
                      //           "Member Added",);
                      //       });

                      //       setState(() {
                      //         _isLoading = false;
                      //       });
                      //     });
                      // context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showQualityBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 288.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Quality',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      _quality = "Standard definitions";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Standard definition - 1280x720',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _quality = "High Definition";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'High Definition - 1920x1080',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
