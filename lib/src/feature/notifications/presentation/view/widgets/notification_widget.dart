import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/models/notifications_model.dart'
    as model;
import 'package:http/http.dart' as http;
import 'dart:developer';

class NotificationWidget extends ConsumerStatefulWidget {
  final model.Notification? notificationsData;
  const NotificationWidget({super.key, this.notificationsData});

  @override
  ConsumerState<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends BaseConsumerState<NotificationWidget> {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  bool showDownloadIndicator = false;
  TextSpan _buildTextSpan(String message) {
    List<TextSpan> children = [];

    while (message.isNotEmpty) {
      RegExpMatch? linkMatch =
          RegExp(r'<link>(.*?)<\/link>').firstMatch(message);
      RegExpMatch? boldMatch =
          RegExp(r'<bold>(.*?)<\/bold>').firstMatch(message);

      if (linkMatch != null &&
          (boldMatch == null || linkMatch.start < boldMatch.start)) {
        // Handle <link> tag
        String beforeMatch = message.substring(0, linkMatch.start);
        String linkContent = linkMatch.group(1)!;

        if (beforeMatch.isNotEmpty) {
          children.add(TextSpan(text: beforeMatch));
        }

        children.add(TextSpan(
          text: linkContent,
          style: TextStyle(
            height: 1,
            color: ref.watch(
                primaryColorProvider), // Change color according to your design
            decoration: TextDecoration.underline,
          ),
        ));

        message = message.substring(linkMatch.end);
      } else if (boldMatch != null) {
        // Handle <bold> tag
        String beforeMatch = message.substring(0, boldMatch.start);
        String boldContent = boldMatch.group(1)!;

        if (beforeMatch.isNotEmpty) {
          children.add(TextSpan(
              text: beforeMatch,
              style: TextStyle(height: 1.2, color: Helper.textColor700)));
        }

        children.add(TextSpan(
          text: boldContent,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Helper.baseBlack),
        ));

        message = message.substring(boldMatch.end);
      } else {
        // No more tags found, add the remaining text
        children.add(TextSpan(
            text: message,
            style: TextStyle(height: 1.2, color: Helper.textColor700)));
        break;
      }
    }

    return TextSpan(
        children: children, style: TextStyle(color: Helper.textColor700));
  }

  String formatDate(DateTime date) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today · ${DateFormat('dd MMM').format(date)}';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday · ${DateFormat('dd MMM').format(date)}';
    } else {
      return DateFormat('h:mma · dd MMM, yyyy ').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        if (widget.notificationsData!.type == "USER_CREATED" ||
            widget.notificationsData!.type == "USER_INVITATION_ACCEPTED") {
          context.push('/userProfile',
              extra: {"userId": widget.notificationsData!.details!.userId});
        } else if (widget.notificationsData!.type == "PROJECT_ACCESS_GRANTED" ||
            widget.notificationsData!.type == "PROJECT_CREATED") {
          context.push(
              '/superProject/${widget.notificationsData!.details!.projectId}',
              extra: {
                "projectId": widget.notificationsData!.details!.projectId,
              });
        } else if (widget.notificationsData!.type == "SUPPORT_TICKET_REPLIED") {
          context.push('/ticketById', extra: {
            "ticketId": widget.notificationsData!.details!.supportTicketId
          });
        } else if (widget.notificationsData!.type == "CAMERA_CREATED") {
          context.push('/cameradetails', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "projectName": widget.notificationsData!.details!.projectName,
            "cameraId": widget.notificationsData!.details!.cameraId,
          });
        } else if (widget.notificationsData!.type == "LIVELAPSE_GENERATED") {
          context.push("/fullViewlivelapse", extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "cameraId": widget.notificationsData!.details!.cameraId,
            "livelapseId": widget.notificationsData!.details!.livelapseId,
          });
        } else if (widget.notificationsData!.type == "LIVELAPSE_FAILED") {
          context.push('/livelapse', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "projectName": widget.notificationsData!.details!.projectName,
            "cameraId": widget.notificationsData!.details!.cameraId,
          });
        } else if (widget.notificationsData!.type == "CAMERA_CREATED") {
          context.push('/cameradetails', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "projectName": widget.notificationsData!.details!.projectName,
            "cameraId": widget.notificationsData!.details!.cameraId,
          });
        } else if (widget.notificationsData!.type ==
                "PROGRESS_LINE_POST_CREATED" ||
            widget.notificationsData!.type == "PROGRESS_LINE_POST_TAGGED") {
          context.push('/progresslineById', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "progressLinePostId":
                widget.notificationsData!.details!.progressLinePostId,
            "commentId": "",
          });
        } else if (widget.notificationsData!.type ==
                "PROGRESS_LINE_INTERACTED_POST_COMMENT_CREATED" ||
            widget.notificationsData!.type ==
                "PROGRESS_LINE_POST_COMMENT_CREATED" ||
            widget.notificationsData!.type == "PROGRESS_LINE_COMMENT_TAGGED") {
          context.push('/progresslineById', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "progressLinePostId":
                widget.notificationsData!.details!.progressLinePostId,
            "commentId":
                widget.notificationsData!.details!.progressLineCommentId,
          });
        } else if (widget.notificationsData!.type ==
            "DOCUMENT_ACCESS_GRANTED") {
          setState(() {
            showDownloadIndicator = true;
          });
          getDownloadUrl(
              widget.notificationsData!.details!.fileId!,
              widget.notificationsData!.details!.folderId!,
              widget.notificationsData!.details!.filePath!);
        } else if (widget.notificationsData!.type ==
                "CAMERA_IMAGE_COMMENT_CREATED" ||
            widget.notificationsData!.type == "CAMERA_IMAGE_COMMENT_TAGGED" ||
            widget.notificationsData!.type == "CAMERA_IMAGE_COMMENT_REPLIED" ||
            widget.notificationsData!.type ==
                "CAMERA_IMAGE_COMMENT_REPLY_TAGGED") {
          context.push('/imageComments', extra: {
            "projectId": widget.notificationsData!.details!.projectId,
            "cameraId": widget.notificationsData!.details!.cameraId,
            "imageName": widget.notificationsData!.details!.cameraImageName,
            "imageHeight":
                // widget.notificationsData!.details!
                //             .cameraImageResolution!.height !=
                //         null
                //     ? widget
                //         .notificationsData!.details!.cameraImageResolution!.height
                //     :
                3000,
            "imageWidth":
                // widget.notificationsData!.details!
                //             .cameraImageResolution!.width !=
                //         null
                //     ? widget
                //         .notificationsData!.details!.cameraImageResolution!.width
                //     :
                4496,
            "fromNotifications": true,
            "cameraImageCommentId":
                widget.notificationsData!.details!.cameraImageCommentId,
            // "cameraImageCommentReplyId":
            //     widget.notificationsData!.details!.cameraImageCommentReplyId,
          });
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatarWidget(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text:
                            _buildTextSpan(widget.notificationsData!.message!),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        formatDate(widget.notificationsData!.createdAt!),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor500,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      _buildFooter(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      showDownloadIndicator &&
                              widget.notificationsData!.type ==
                                  "DOCUMENT_ACCESS_GRANTED"
                          ? Transform.scale(
                              scale: 0.3,
                              child: CircularProgressIndicator(
                                color: ref.watch(primaryColorProvider),
                              ),
                            )
                          : Icon(
                              Icons.circle,
                              color: Helper.successColor,
                              size: 8,
                            )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Helper.baseBlack.withOpacity(0.06),
            )
          ],
        ),
      ),
    );
  }

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
    } catch (err) {}
    String appDocPath = directory!.path;
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    };

    try {
      await dio.download(url, "$appDocPath/$fileName").then((response) {
        if (response.statusCode == 200) {
          setState(() {
            showDownloadIndicator = false;
          });
          Utils.toastSuccessMessage("Document Downloaded", context);
          log("this is the response" + response.data.toString());

          log("File downloaded successfully. Path: $appDocPath/$fileName");
        } else {
          Utils.flushBarErrorMessage("Something went wrong", context);
          log("Failed to download file. Status code: ${response.statusCode}");
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

  getDownloadUrl(String fileId, String folderId, String path) async {
    Dio dio = Dio();
    String url = Endpoints.downloadNotificationDocUrl();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    };
    Map<String, String> body = {
      "fileId": fileId,
      "folderId": folderId,
    };
    var postData = json.encode(body);

    try {
      dio.options.headers = headers;
      await dio.post(url, data: postData).then((response) async {
        if (response.statusCode == 200) {
          log("response" + response.data['url'].toString());
          downloadDocument(response.data['url'].toString(), path);
        } else {
          log("Failed to download file. Status code: ${response.statusCode}");
        }
      });
    } catch (e) {
      log("Error: $e");
    }
  }

  getDay(date) {
    if (date == null) {
      return "";
    }
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat("dd").format(parsedDate);

    return formattedDate;
  }

  getDate(date) {
    if (date == null) {
      return "";
    }
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat("dd MMM, y").format(parsedDate);

    return formattedDate;
  }

  getFileDate(date) {
    DateTime dateTimeObject = DateTime.parse(date);

    // Format the date without the time
    String formattedDate = DateFormat('dd, MMM yyyy').format(dateTimeObject);

    return formattedDate;
  }

  String extractFormattedDateTime(String filename) {
    // Assuming the format is "YYYYMMDDHHmmss.jpg"
    String year = filename.substring(0, 4);
    String month = filename.substring(4, 6);
    String day = filename.substring(6, 8);
    String hour = filename.substring(8, 10);
    String minute = filename.substring(10, 12);
    String second = filename.substring(12, 14);

    // Construct DateTime object
    DateTime dateTime = DateTime(int.parse(year), int.parse(month),
        int.parse(day), int.parse(hour), int.parse(minute), int.parse(second));

    // Format DateTime object
    String formattedDateTime =
        DateFormat('hh:mm a . dd MMM yyyy').format(dateTime);

    return formattedDateTime;
  }

  Widget _buildFooter() {
    switch (widget.notificationsData!.type) {
      case 'CAMERA_IMAGE_COMMENT_CREATED':
      case 'CAMERA_IMAGE_COMMENT_TAGGED':
      case 'CAMERA_IMAGE_COMMENT_DETAILS':
      case 'CAMERA_IMAGE_COMMENT_REPLIED':
      case 'CAMERA_IMAGE_COMMENT_REPLY_DETAILS':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.notificationsData!.details!.cameraName! +
                  "-" +
                  widget.notificationsData!.details!.projectName!,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Helper.baseBlack),
            ),
            Text(
              extractFormattedDateTime(
                  widget.notificationsData!.details!.cameraImageName!),
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor500,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        );
      case 'LIVELAPSE_GENERATED':
      case 'LIVELAPSE_DETAILS':
      case 'LIVELAPSE_FAILED':
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/file.svg', height: 24, width: 24),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.notificationsData!.details!.filename != null
                        ? widget.notificationsData!.details!.filename!
                        : "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Helper.baseBlack),
                  ),
                  Text(
                    widget.notificationsData!.details!.duration!.toString() +
                        " Days · " +
                        getDay(widget.notificationsData!.details!.startDate) +
                        "-" +
                        getDate(widget.notificationsData!.details!.startDate),
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      case 'MULTI_IMAGE_DOWNLOAD_GENERATED':
      case 'MULTI_IMAGE_DOWNLOAD_GENERATED':
      case 'MULTI_IMAGE_DOWNLOAD_DETAILS':
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/file.svg', height: 24, width: 24),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.notificationsData!.details!.filename!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Helper.baseBlack),
                  ),
                  Text(
                    getDate(widget.notificationsData!.details!.startDate) +
                        " to " +
                        getDate(widget.notificationsData!.details!.endDate),
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      // case 'SCHEDULED_CAMERA_PROGRESS_REPORT_GENERATED':
      // case 'SCHEDULED_CAMERA_PROGRESS_REPORT_GENERATED_DETAILS':
      //   return Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       SvgPicture.asset('assets/images/file.svg', height: 24, width: 24),
      //       SizedBox(
      //         width: 5.w,
      //       ),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width * 0.5,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Text(
      //               widget.notificationsData!.details!.filename != null
      //                   ? widget.notificationsData!.details!.filename!
      //                   : "",
      //               overflow: TextOverflow.ellipsis,
      //               style: TextStyle(
      //                   fontWeight: FontWeight.bold, color: Helper.baseBlack),
      //             ),
      //             Text(
      //               widget.notificationsData!.details!.duration!.toString() +
      //                   " Days · " +
      //                   getDay(widget.notificationsData!.details!.startDate) +
      //                   "-" +
      //                   getDate(widget.notificationsData!.details!.startDate),
      //               style: TextStyle(
      //                   letterSpacing: -0.3,
      //                   color: Helper.textColor500,
      //                   fontSize: 12.sp,
      //                   fontWeight: FontWeight.w400),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   );
      case 'DOCUMENT_ACCESS_GRANTED':
      case 'DOCUMENT_ACCESS_REVOKED':
      case 'DOCUMENT_DETAILS':
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/file.svg', height: 24, width: 24),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.notificationsData!.details!.fileName!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Helper.baseBlack),
                  ),
                  Text(
                    getFileDate(widget
                        .notificationsData!.details!.fileCreatedAt!
                        .toIso8601String()),
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      case 'PROJECT_CREATED':
      case 'PROJECT_ACCESS_GRANTED':
      case 'PROJECT_ACCESS_REVOKED':
      case 'PROJECT_DETAILS':
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/file.svg', height: 24, width: 24),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.notificationsData!.details!.projectName!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Helper.baseBlack),
                  ),
                  Text(
                    widget.notificationsData!.details!.projectLocation!.name!,
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        // Return a different widget for other cases
        return SizedBox();
    }
  }

  Widget _buildAvatarWidget() {
    switch (widget.notificationsData!.type) {
      case 'PROGRESS_LINE_POST_CREATED':
      case 'PROGRESS_LINE_POST_TAGGED':
      case 'PROGRESS_LINE_POST_COMMENT_CREATED':
      case 'PROGRESS_LINE_INTERACTED_POST_COMMENT_CREATED':
      case 'PROGRESS_LINE_COMMENT_TAGGED':
      case 'CAMERA_IMAGE_COMMENT_CREATED':
      case 'CAMERA_IMAGE_COMMENT_TAGGED':
      case 'CAMERA_IMAGE_COMMENT_REPLIED':
      case 'PROJECT_ACCESS_GRANTED':
      case 'PROJECT_ACCESS_REVOKED':
      case 'USER_INVITATION_ACCEPTED':
      case 'USER_CREATED':
      case 'DOCUMENT_ACCESS_GRANTED':
      case 'DOCUMENT_ACCESS_REVOKED':
      case 'SUPPORT_TICKET_REPLIED':

        // Add other cases as needed
        return widget.notificationsData!.createdBy != null
            ? AvatarWidget(
                dpUrl: widget.notificationsData!.createdBy!.dp != null
                    ? widget.notificationsData!.createdBy!.dpUrl!
                    : "",
                name: widget.notificationsData!.createdBy!.name!,
                backgroundColor:
                    widget.notificationsData!.createdBy!.preset!.color!,
                size: 32,
                fontSize: 14,
              )
            : CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Helper.textColor500,
                ),
                backgroundColor: Colors.black.withOpacity(0.1),
              );
      case 'LIVELAPSE_GENERATED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/video-recorder.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.successColor.withOpacity(0.1),
        );
      case 'LIVELAPSE_FAILED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/video-recorder.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.errorColor.withOpacity(0.1),
        );
      case 'MULTI_IMAGE_DOWNLOAD_GENERATED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/plus.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.successColor.withOpacity(0.1),
        );
      case 'MULTI_IMAGE_DOWNLOAD_FAILED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/plus.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.errorColor.withOpacity(0.1),
        );
      case 'SCHEDULED_CAMERA_PROGRESS_REPORT_GENERATED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/file.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.successColor.withOpacity(0.1),
        );
      case 'PROJECT_CREATED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/file.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.successColor.withOpacity(0.1),
        );
      case 'CAMERA_CREATED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/camera.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.successColor.withOpacity(0.1),
        );
      case 'USER_INVITATION_EXPIRED':
        return CircleAvatar(
          child: SvgPicture.asset(
            'assets/images/calendar.svg',
            color: Helper.successColor300,
          ),
          backgroundColor: Helper.errorColor.withOpacity(0.1),
        );
      default:
        // Return a different widget for other cases
        return CircleAvatar();
    }
  }
}
