import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'dart:developer' as developer;

class DocsCard extends ConsumerStatefulWidget {
  final docsData;
  final index;
  const DocsCard({super.key, required this.docsData, this.index});

  @override
  ConsumerState<DocsCard> createState() => _DocsCardState();
}

class _DocsCardState extends BaseConsumerState<DocsCard> {
  @override
  Widget build(BuildContext context) {
    print("data passed to docs card" + widget.docsData.toString());
    return widget.docsData != null
        ? Container(
            decoration: BoxDecoration(
              color: Helper.widgetBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Text(
                  widget.docsData['path'].split('.').last.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor600,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              title: Text(
                widget.docsData['fileName'],
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "uploaded by " + widget.docsData["uploadedBy"],
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor600,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              // trailing: PopupMenuButton(
              //   icon: SvgPicture.asset('assets/images/dots-vertical.svg'),
              //   position: PopupMenuPosition.under,
              //   itemBuilder: (BuildContext context) => [
              //     PopupMenuItem<String>(
              //       value: 'download',
              //       child: Text(
              //         'Download',
              //         style: TextStyle(
              //             letterSpacing: -0.3,
              //             color: Helper.baseBlack,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w500),
              //       ),
              //     ),
              //     PopupMenuItem<String>(
              //       value: 'delete',
              //       child: Text(
              //         'Delete',
              //         style: TextStyle(
              //             letterSpacing: -0.3,
              //             color: Helper.errorColor,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w500),
              //       ),
              //     ),
              //   ],
              //   onSelected: (value) {
              //     print(value.toString());
              //     if (value == 'delete') {
              //       Platform.isIOS
              //           ? showCupertinoDialog(
              //               context: context,
              //               builder: (context) => CupertinoAlertDialog(
              //                 title: Text(
              //                   "The following file " +
              //                       '\"' +
              //                       widget.docsData['fileName'] +
              //                       '\"' +
              //                       ' will be deleted.',
              //                 ),
              //                 content: Text(
              //                   "You cannot undo this action ",
              //                 ),
              //                 actions: <Widget>[
              //                   // if (cancelActionText != null)

              //                   CupertinoDialogAction(
              //                     child: Text(
              //                       "Cancel",
              //                       style: TextStyle(
              //                           color: Colors.blue,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     onPressed: () =>
              //                         Navigator.of(context).pop(true),
              //                   ),
              //                   CupertinoDialogAction(
              //                       child: Text(
              //                         "Delete",
              //                         style: TextStyle(
              //                           color: Helper.errorColor,
              //                         ),
              //                       ),
              //                       onPressed: () async {
              //                         await Service()
              //                             .deleteFile(
              //                                 widget.docsData['folderId'],
              //                                 widget.docsData['fileId'])
              //                             .then((value) {
              //                           context.pop();
              //                           Utils.flushBarErrorMessage(
              //                               "File deleted", context);
              //                           ref
              //                               .watch(
              //                                   docsControllerProvider.notifier)
              //                               .getDocs();
              //                         });

              //                         setState(() {});
              //                       }),
              //                 ],
              //               ),
              //             )
              //           : showDialog(
              //               context: context,
              //               builder: ((context) {
              //                 return FormBuilder(
              //                   child: AlertDialog(
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(14.r),
              //                     ),
              //                     content: StatefulBuilder(builder:
              //                         (BuildContext context,
              //                             StateSetter setState) {
              //                       return SingleChildScrollView(
              //                         child: Column(
              //                           mainAxisSize: MainAxisSize.min,
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             RichText(
              //                               text: TextSpan(
              //                                 text: "The following file ",
              //                                 style: TextStyle(
              //                                     letterSpacing: -0.3,
              //                                     fontSize: 14.sp,
              //                                     fontWeight: FontWeight.w500,
              //                                     color: Helper.textColor500),
              //                                 children: [
              //                                   TextSpan(
              //                                     text: '\"' +
              //                                         widget.docsData[
              //                                             'fileName'] +
              //                                         '\"',
              //                                     style: TextStyle(
              //                                         letterSpacing: -0.3,
              //                                         fontSize: 14.sp,
              //                                         fontWeight:
              //                                             FontWeight.w500,
              //                                         color: Helper.baseBlack),
              //                                   ),
              //                                   TextSpan(
              //                                     text: ' will be deleted.',
              //                                     style: TextStyle(
              //                                         letterSpacing: -0.3,
              //                                         fontSize: 14.sp,
              //                                         fontWeight:
              //                                             FontWeight.w500,
              //                                         color:
              //                                             Helper.textColor500),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       );
              //                     }),
              //                     actionsPadding: const EdgeInsets.only(
              //                         left: 32, bottom: 32, right: 32),
              //                     actions: [
              //                       TextButton(
              //                         onPressed: () {
              //                           developer.log('log me' +
              //                               widget.docsData.toString());
              //                           Service()
              //                               .deleteFile(
              //                                   widget.docsData['folderId'],
              //                                   widget.docsData['fileId'])
              //                               .then((value) {
              //                             context.pop();
              //                             Utils.flushBarErrorMessage(
              //                                 "File deleted", context);
              //                             ref
              //                                 .watch(docsControllerProvider
              //                                     .notifier)
              //                                 .getDocs();
              //                           });

              //                           setState(() {});
              //                         },
              //                         style: TextButton.styleFrom(
              //                             padding: const EdgeInsets.symmetric(
              //                                 horizontal: 16, vertical: 11),
              //                             shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(8.r),
              //                             ),
              //                             backgroundColor: Helper.errorColor,
              //                             fixedSize: Size.infinite),
              //                         child: const Text(
              //                           "Delete",
              //                           style: TextStyle(
              //                               letterSpacing: -0.3,
              //                               color: Colors.white,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600),
              //                         ),
              //                       ),
              //                       TextButton(
              //                         onPressed: () {
              //                           context.pop();
              //                         },
              //                         style: TextButton.styleFrom(
              //                             shape: RoundedRectangleBorder(
              //                               borderRadius:
              //                                   BorderRadius.circular(8.r),
              //                             ),
              //                             padding: const EdgeInsets.symmetric(
              //                                 horizontal: 16, vertical: 11),
              //                             backgroundColor: Colors.white,
              //                             side: BorderSide(
              //                                 color: Helper.textColor300),
              //                             fixedSize: Size.infinite),
              //                         child: Text(
              //                           "Cancel",
              //                           style: TextStyle(
              //                               letterSpacing: -0.3,
              //                               color: Helper.textColor500,
              //                               fontSize: 14,
              //                               fontWeight: FontWeight.w600),
              //                         ),
              //                       ),
              //                     ],
              //                     actionsAlignment: MainAxisAlignment.center,
              //                   ),
              //                 );
              //               }),
              //             );
              //     } else if (value == 'download') {
              //       // Handle download action
              //       print('Download option selected');
              //     }
              //   },
              // ),
            ),
          )
        : Text("No docs present");
  }
}
