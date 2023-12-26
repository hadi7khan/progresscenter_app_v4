import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/add_member_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/add_member_widget.dart';

class ViewedByWidget extends StatefulWidget {
  final data;
  final showText;
  final projectId;
  final showExtra;
  const ViewedByWidget(
      {super.key, this.data, this.showText, this.projectId, this.showExtra});

  @override
  State<ViewedByWidget> createState() => _ViewedByWidgetState();
}

class _ViewedByWidgetState extends State<ViewedByWidget> {
  bool showAddMember = false;

  @override
  Widget build(BuildContext context) {
    print("project user data " + widget.data.toString());
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      showAddMember
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  showAddMember = false;
                                });
                              },
                              child: Transform.rotate(
                                angle: 180 * (3.1415926535 / 180),
                                child: SvgPicture.asset(
                                    'assets/images/chevron-right.svg',
                                    color: Helper.iconColor,
                                    fit: BoxFit.contain),
                              ),
                            )
                          : SizedBox(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              showAddMember ? "Add Member" : widget.showText,
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.baseBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (!showAddMember)
                    InkWell(
                      onTap: () {
                        setState(() {
                          showAddMember = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset('assets/images/plus.svg',
                                  // width: 44.w,
                                  // height: 44.h,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Helper.primary, BlendMode.srcIn))),
                          title: Text(
                            "Add member",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 5.w, vertical: 22.h),
                      //   child:
                      // Row(children: [
                      //   SvgPicture.asset('assets/images/plus.svg',
                      //       color: Helper.primary),
                      //   SizedBox(width: 5.h),
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 5.w,
                      //     ),
                      //     child: Text(
                      //       "Add member",
                      //       style: TextStyle(
                      //           letterSpacing: -0.3,
                      //           color: Helper.baseBlack,
                      //           fontSize: 18.sp,
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ),
                      // ]),
                      // ),
                    )
                  else
                    AddMemberWidget(),
                  if (!showAddMember)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                          horizontalTitleGap: 12.w,
                          // dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.only(bottom: 10.h),
                          leading: AvatarWidget(
                            dpUrl: widget.data[index].dp != null
                                ? widget.data[index].dpUrl!
                                : "",
                            name: widget.data[index].name!,
                            backgroundColor: widget.data[index].preset!.color!,
                            size: 35.h,
                          ),
                          title: Text(
                            widget.data[index].name!,
                            style: TextStyle(
                                color: Helper.textColor700,
                                letterSpacing: -0.3,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: widget.showExtra
                              ? Text(
                                  widget.data[index].email!,
                                  style: TextStyle(
                                      color: Helper.textColor600,
                                      letterSpacing: -0.3,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              : SizedBox(),
                          trailing: widget.showExtra
                              ? InkWell(
                                  radius: 40,
                                  excludeFromSemantics: true,
                                  onTap: () {
                                    Platform.isIOS
                                        ? showCupertinoDialog(
                                            context: context,
                                            builder: (context) =>
                                                CupertinoAlertDialog(
                                              title: Text(
                                                "Are you sure you want to remove " +
                                                    '\"' +
                                                    widget.data[index].name! +
                                                    '\"',
                                              ),
                                              content: Text(
                                                "You cannot undo this action ",
                                              ),
                                              actions: <Widget>[
                                                // if (cancelActionText != null)

                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                ),
                                                CupertinoDialogAction(
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        color:
                                                            Helper.errorColor,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Service()
                                                          .revokeMember(
                                                        widget.projectId,
                                                        widget.data.userId,
                                                      )
                                                          .then((value) {
                                                        context.pop();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(const SnackBar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                content: Text(
                                                                    "Member Revoked")));
                                                      });
                                                      setState(() {});
                                                    }),
                                              ],
                                            ),
                                          )
                                        : showDialog(
                                            context: context,
                                            builder: ((context) {
                                              return FormBuilder(
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.r),
                                                  ),
                                                  content: StatefulBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              StateSetter
                                                                  setState) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  "Are you sure you want to remove ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Helper
                                                                      .textColor500),
                                                              children: [
                                                                TextSpan(
                                                                  text: '\"' +
                                                                      widget
                                                                          .data[
                                                                              index]
                                                                          .name! +
                                                                      '\"',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Helper
                                                                          .baseBlack),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' from this project?',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Helper
                                                                          .textColor500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                  actionsPadding:
                                                      const EdgeInsets.only(
                                                          left: 32,
                                                          bottom: 32,
                                                          right: 32),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        print(
                                                            "project user data " +
                                                                widget.data.id
                                                                    .toString());
                                                        Service()
                                                            .revokeMember(
                                                                widget
                                                                    .projectId,
                                                                widget.data
                                                                    .userId)
                                                            .then((value) {
                                                          context.pop();
                                                          ScaffoldMessenger
                                                                  .of(context)
                                                              .showSnackBar(const SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  content: Text(
                                                                      "Access Revoked")));
                                                        });
                                                        setState(() {});
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          11),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.r),
                                                              ),
                                                              backgroundColor:
                                                                  Helper
                                                                      .errorColor,
                                                              fixedSize: Size
                                                                  .infinite),
                                                      child: const Text(
                                                        "Remove",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.r),
                                                              ),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          11),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              side: BorderSide(
                                                                  color: Helper
                                                                      .textColor300),
                                                              fixedSize: Size
                                                                  .infinite),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Helper
                                                                .textColor500,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ],
                                                  actionsAlignment:
                                                      MainAxisAlignment.center,
                                                ),
                                              );
                                            }),
                                          );
                                  },
                                  child: SvgPicture.asset(
                                      width: 15,
                                      height: 15,
                                      'assets/images/close-x.svg',
                                      color: Helper.errorColor))
                              : SizedBox(),
                        );
                      },
                    ),
                ]),
          ),
        ),
        if (showAddMember)
          Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    showAddMember = true;
                  });
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 22.h),
                  child: Row(children: [
                    SvgPicture.asset('assets/images/plus.svg',
                        color: Helper.primary),
                    SizedBox(width: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: Text(
                        "Send Invite",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.primary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                ),
              )),
      ],
    );
  }
}
