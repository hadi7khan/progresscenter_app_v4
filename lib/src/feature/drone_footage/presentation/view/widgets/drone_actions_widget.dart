import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/drone_footage_controller.dart';

class DroneActionsWidget extends ConsumerStatefulWidget {
  final String name;
  final String projectId;
  final String droneFootageId;
  final String location;
  const DroneActionsWidget({
    super.key,
    required this.name,
    required this.projectId,
    required this.droneFootageId,
    required this.location,
  });

  @override
  ConsumerState<DroneActionsWidget> createState() => _DroneActionsWidgetState();
}

class _DroneActionsWidgetState extends BaseConsumerState<DroneActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionSheet(
            title: const Text('Drone Footage Actions'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.pencil,
                              color: Helper.primary,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(color: Helper.primary),
                            ),
                          ],
                        ),
                      ]),
                ),
                onPressed: () {
                  context.push('/editDronefootage', extra: {
                    "projectId": widget.projectId,
                    "droneId": widget.droneFootageId,
                    "name": widget.name,
                    "location": widget.location,
                  });
                },
              ),
              CupertinoActionSheetAction(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.delete,
                      color: Helper.primary,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Helper.primary),
                    ),
                  ],
                ),
                onPressed: () async {
                  context.pop();
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text(
                        "The following file " +
                            '\"' +
                            widget.name +
                            '\"' +
                            ' will be deleted.',
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
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                        CupertinoDialogAction(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: Helper.errorColor,
                              ),
                            ),
                            onPressed: () async {
                              await Service()
                                  .deleteDroneFootage(
                                      widget.projectId, widget.droneFootageId)
                                  .then((value) {
                                context.pop();
                                Utils.flushBarErrorMessage(
                                    "Drone Footage deleted", context);
                                ref
                                    .watch(
                                        droneFootageControllerProvider.notifier)
                                    .getDroneFootage(widget.projectId);
                              });
                            }),
                      ],
                    ),
                  );
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                'Cancel',
                style: TextStyle(color: Helper.errorColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        : StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                color: Colors.white,
              ),
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Drone Footage Action',
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
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.push('/editDronefootage', extra: {
                            "projectId": widget.projectId,
                            "droneId": widget.droneFootageId,
                            "name": widget.name,
                            "location": widget.location,
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Edit',
                                style: TextStyle(
                                    color: Helper.baseBlack,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context.pop();
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return FormBuilder(
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  content: StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: "The following file ",
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Helper.textColor500),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '\"' + widget.name + '\"',
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Helper.baseBlack),
                                                ),
                                                TextSpan(
                                                  text: ' will be deleted.',
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Helper.textColor500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  actionsPadding: const EdgeInsets.only(
                                      left: 32, bottom: 32, right: 32),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        await Service()
                                            .deleteDroneFootage(
                                                widget.projectId,
                                                widget.droneFootageId)
                                            .then((value) {
                                          context.pop();
                                          Utils.flushBarErrorMessage(
                                              "Drone Footage deleted", context);
                                          ref
                                              .watch(
                                                  droneFootageControllerProvider
                                                      .notifier)
                                              .getDroneFootage(
                                                  widget.projectId);
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 11),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          backgroundColor: Helper.errorColor,
                                          fixedSize: Size.infinite),
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 11),
                                          backgroundColor: Colors.white,
                                          side: BorderSide(
                                              color: Helper.textColor300),
                                          fixedSize: Size.infinite),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.textColor500,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                  actionsAlignment: MainAxisAlignment.center,
                                ),
                              );
                            }),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white),
                          child: Text(
                            'Delete',
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
                                fontSize: 16.sp,
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
            );
          });
  }
}
