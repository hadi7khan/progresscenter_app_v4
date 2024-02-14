import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'dart:developer' as dev;

class DocsActionWidget extends ConsumerStatefulWidget {
  final String folderId;
  final String fileId;
  final String fileName;
  final String fileUrl;
  final String filePath;
  const DocsActionWidget({
    super.key,
    required this.folderId,
    required this.fileId,
    required this.fileName,
    required this.fileUrl,
    required this.filePath,
  });

  @override
  ConsumerState<DocsActionWidget> createState() => _DocsActionWidgetState();
}

class _DocsActionWidgetState extends BaseConsumerState<DocsActionWidget> {
  bool showDownloadIndicator = false;
  Future downloadDocument(String url, String filePath) async {
    Dio dio = Dio();
    String fileName = extractFileName(filePath);
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
        String newPath = directory?.path.substring(0, 20) ?? "";
        newPath += "Download";
        directory = Directory(newPath);
        if (!directory.existsSync()) {
          await directory.create();
        }
      }
    } catch (err) {
      dev.log("download folder not exist");
    }
    String appDocPath = directory!.path;
    try {
      await dio.download(url, "$appDocPath/$fileName").then((response) {
        if (response.statusCode == 200) {
          setState(() {
            showDownloadIndicator = false;
          });
          context.pop();
          Utils.toastSuccessMessage("Document Downloaded", context);
          dev.log("this is the response" + response.data.toString());

          dev.log("File downloaded successfully. Path: $appDocPath/$fileName");
        } else {
          Utils.flushBarErrorMessage("Something went wrong", context);
          dev.log(
              "Failed to download file. Status code: ${response.statusCode}");
        }
      });
    } catch (e) {
      debugPrint("Got Error  ${e.toString()}");
    }
  }

  String extractFileName(String filePath) {
    List<String> pathSegments = filePath.split('/');
    return pathSegments.last;
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionSheet(
            title: const Text('Document Actions'),
            // message: const Text('Message'),
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
                              CupertinoIcons.down_arrow,
                              color: Helper.primary,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Download',
                              style: TextStyle(color: Helper.primary),
                            ),
                          ],
                        ),
                        showDownloadIndicator
                            ? SizedBox(
                                height: 20.h,
                                width: 20.h,
                                child: Transform.scale(
                                  scale: 0.5,
                                  child: CircularProgressIndicator(
                                    color: Helper.primary,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ]),
                ),
                onPressed: () {
                  setState(() {
                    showDownloadIndicator = true;
                  });
                  downloadDocument(widget.fileUrl, widget.filePath);
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
                            widget.fileName +
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
                                  .deleteFile(widget.folderId, widget.fileId)
                                  .then((value) {
                                context.pop();
                                Utils.flushBarErrorMessage(
                                    "File deleted", context);
                                ref
                                    .watch(docsControllerProvider.notifier)
                                    .getDocs();
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
                        'Document Action',
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
                            showDownloadIndicator = true;
                          });
                          downloadDocument(widget.fileUrl, widget.filePath);
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
                                'Download',
                                style: TextStyle(
                                    color: Helper.baseBlack,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              showDownloadIndicator
                                  ? SizedBox(
                                      height: 20.h,
                                      width: 20.h,
                                      child: Transform.scale(
                                        scale: 0.5,
                                        child: CircularProgressIndicator(
                                          color: Helper.primary,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
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
                                                  text: '\"' +
                                                      widget.fileName +
                                                      '\"',
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
                                            .deleteFile(
                                                widget.folderId, widget.fileId)
                                            .then((value) {
                                          context.pop();
                                          Utils.flushBarErrorMessage(
                                              "File deleted", context);
                                          ref
                                              .watch(docsControllerProvider
                                                  .notifier)
                                              .getDocs();
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
