// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

// class RequestCardWidget extends StatefulWidget {
//   final data;
//   const RequestCardWidget({super.key, this.data});

//   @override
//   State<RequestCardWidget> createState() => _RequestCardWidgetState();
// }

// class _RequestCardWidgetState extends State<RequestCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12.r),
//                       color: Colors.white,
//                     ),
//                     child: Text(
//                       "By " + data[index].requestedBy!.name!,
//                       style: TextStyle(
//                           letterSpacing: -0.3,
//                           color: Helper.baseBlack,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   )
//   }
// }