import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_comments_widget.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_progressline_details.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/post_comment_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/progressline_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/process_mention_widget.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/viewed_by_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'dart:developer';

import 'package:timezone/timezone.dart';

class ProgresslineDetailsScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String progressLinePostId;
  final String commentId;
  const ProgresslineDetailsScreen({
    super.key,
    required this.projectId,
    required this.progressLinePostId,
    required this.commentId,
  });

  @override
  ConsumerState<ProgresslineDetailsScreen> createState() =>
      _TimelineDetailsScreenState();
}

class _TimelineDetailsScreenState
    extends BaseConsumerState<ProgresslineDetailsScreen> {
  TextEditingController _controller = TextEditingController();
  List<UserLeanModel> _myCustomList = [];
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  final RegExp mentionRegex = RegExp(r"@\[([\w\s]+)\]\(user:(\d+)\)");
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;
  ScrollController _commentController = ScrollController();
  @override
  void initState() {
    super.initState();
    callApi();
    fetchUser();
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  callApi() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(progresslineByIdControllerProvider.notifier)
          .getProgresslineById(widget.progressLinePostId, widget.projectId);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(commentsControllerProvider.notifier)
          .getComments(widget.progressLinePostId)
          .then((value) {
        if (widget.commentId != "") {
          log("comment id passed" + widget.commentId.toString());
          int index =
              value.indexWhere((comment) => comment.id == widget.commentId);
          log("index" + index.toString());

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Timer(Duration(seconds: 1), () {
              _commentController.animateTo(
                index * 40,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            });
          });
        }
      });
    });
    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
  }

  // method for fetching mention list
  List<Map<String, dynamic>> getMentionsList() {
    return _myCustomList.map((user) {
      return {
        'id': user.id.toString(),
        'display': user.name,
        'dpUrl': user.dpUrl != null ? user.dpUrl : "",
        'dp': user.dp != null ? user.dp : "",
        'color': user.preset!.color,
        'trigger': '@', // or any other trigger character you want
      };
    }).toList();
  }

// method for formatting comment data
  Map<String, dynamic> getCommentData() {
    final commentText = key.currentState!.controller!.text;

    // Replace mentions in the text
    final replacedText = replaceMentionsInText(_myCustomList, commentText);
    return {
      "comment": replacedText,
    };
  }

  String replaceMentionsInText(List<UserLeanModel> users, String text) {
    String replacedText = text;

    // Sort users by the length of their names in descending order
    users.sort((a, b) => b.name!.length.compareTo(a.name!.length));
    for (final user in users) {
      final mention = "@${user.name}";

      // Replace mentions with user id
      replacedText =
          replacedText.replaceAll(mention, "@[${user.name}](user:${user.id})");
    }
    return replacedText;
  }

  String formatTimeDifference(DateTime date,
      {String? timezone, bool showSuffix = true}) {
    Duration difference = DateTime.now().toUtc().difference(date.toUtc());

    if (timezone != null) {
      DateTime convertedDate = TZDateTime.from(date, getLocation(timezone));
      difference = DateTime.now().toUtc().difference(convertedDate.toUtc());
    }

    String timeAgo = DateFormat().add_yMMMMd().add_jm().format(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    final progresslineBytIdData = ref.watch(progresslineByIdControllerProvider
        .select((value) => value.progresslineById));
    final commentsData =
        ref.watch(commentsControllerProvider.select((value) => value.comments));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.0.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Transform.rotate(
                  angle: 180 * (3.1415926535 / 180),
                  child: SvgPicture.asset('assets/images/chevron-right.svg',
                      color: Helper.iconColor, fit: BoxFit.contain),
                ),
              ),
              leadingWidth: 24,
              title: Text(
                "ProgressLine",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    user!['role'] == "ADMIN"
                        ? _showProgresslineDeleteBottomSheet(
                            context, widget.progressLinePostId)
                        : null;
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        color: Helper.errorColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: progresslineBytIdData.when(
        data: (data) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: FormBuilder(
              key: _fbKey,
              child: Column(
                children: [
                  Container(
                    color: Helper.widgetBackground,
                    child: data.url != null
                        ? PinchZoom(
                            maxScale: 10,
                            child: Image.network(
                              data.url!,
                              gaplessPlayback: true,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return ClipRRect(
                                  child: Image.asset(
                                    'assets/images/error_image.jpeg',
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/error_image.jpeg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.6,
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
                                  'Comments',
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            commentsData.when(
                              data: (data) {
                                if (data.isEmpty) {
                                  return Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.3.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/illustration.svg'),
                                        SizedBox(height: 16.h),
                                        Text(
                                          "No Comments",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.textColor900,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "This space is empty. ",
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.textColor600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                ;
                                return Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4.h,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 16.h);
                                        },
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        controller: _commentController,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        itemCount: data.length,
                                        itemBuilder: ((context, index) {
                                          final reversedIndex =
                                              data.length - 1 - index;
                                          return Column(
                                            children: [
                                              InkWell(
                                                onLongPress: () {
                                                  HapticFeedback.mediumImpact();
                                                  user!['role'] == "ADMIN" ||
                                                          user!['_id'] ==
                                                              data[reversedIndex]
                                                                  .user!
                                                                  .id!
                                                      ? _showCommentDeleteBottomSheet(
                                                          context,
                                                          widget
                                                              .progressLinePostId,
                                                          data[reversedIndex]
                                                              .id)
                                                      : null;
                                                },
                                                child: ListTile(
                                                  horizontalTitleGap: 8.w,
                                                  dense: true,
                                                  visualDensity: VisualDensity(
                                                      horizontal: 0,
                                                      vertical: 0),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  leading: AvatarWidget(
                                                    dpUrl: data[reversedIndex]
                                                                .user!
                                                                .dpUrl !=
                                                            null
                                                        ? data[reversedIndex]
                                                            .user!
                                                            .dpUrl!
                                                        : "",
                                                    name: data[reversedIndex]
                                                        .user!
                                                        .name!,
                                                    backgroundColor:
                                                        data[reversedIndex]
                                                            .user!
                                                            .preset!
                                                            .color!,
                                                    size: 32,
                                                    fontSize: 14,
                                                  ),
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                        data[reversedIndex]
                                                            .user!
                                                            .name!,
                                                        style: TextStyle(
                                                            letterSpacing: -0.3,
                                                            color: Helper
                                                                .textColor600,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        "·",
                                                        style: TextStyle(
                                                            letterSpacing: -0.3,
                                                            color: Helper
                                                                .textColor600,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        formatTimeDifference(
                                                          data[reversedIndex]
                                                              .createdAt!,
                                                          timezone: user![
                                                                  'preferences']
                                                              ['timezone'],
                                                        ),
                                                        style: TextStyle(
                                                            letterSpacing: -0.3,
                                                            color: Helper
                                                                .textColor600,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: ProcessMention(
                                                    text: data[reversedIndex]
                                                        .body!,
                                                  ),
                                                ),
                                              ),
                                              if (index == data.length - 1)
                                                SizedBox(
                                                  height: 80.h,
                                                ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              error: (err, _) {
                                return const Text("Failed to load Comments",
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.errorColor));
                              },
                              loading: () => LoadCommentsWidget(),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                useRootNavigator: true,
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => ViewedByWidget(
                                      data: data.viewedBy,
                                      showText: "Viewed By",
                                      projectId: "",
                                      showExtra: false,
                                    ));
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/eye.svg',
                                width: 24.w,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                data.viewedBy!.length.toString(),
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: Helper.textColor600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        error: (err, _) {
          return const Text("Failed to load Progressline Details",
              style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
        },
        loading: () => LoadingProgresslineDetails(),
      )),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: ListTile(
              horizontalTitleGap: 8.w,
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: 0),
              leading: AvatarWidget(
                dpUrl: user!['dpUrl'] != null ? user!['dpUrl'] : "",
                name: user!['name'],
                backgroundColor: user!['preset']['color'],
                size: 32,
                fontSize: 14,
              ),
              title: FlutterMentions(
                key: key,
                suggestionListDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                    border: Border.all(color: Helper.textColor300)),
                suggestionPosition: SuggestionPosition.Top,
                maxLines: 5,
                minLines: 1,
                textInputAction: TextInputAction.done,
                mentions: [
                  Mention(
                    trigger: "@",
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: ref.watch(primaryColorProvider),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                    data: getMentionsList(),
                    suggestionBuilder: (data) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: AvatarWidget(
                            dpUrl: data['dpUrl'] != null ? data['dpUrl'] : "",
                            name: data['display'],
                            backgroundColor: data['color'],
                            size: 24,
                            fontSize: 14,
                          ),
                          title: Text(
                            data['display'],
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  )
                ],
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor600,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  hintText: "Add comment",
                  hintStyle: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor500,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: IconButton(
                      icon: SvgPicture.asset('assets/images/send.svg'),
                      onPressed: () async {
                        setState(() {
                          // _controller.clear();
                          // _changeState = false;
                        });
                        Map<String, dynamic> data = getCommentData();
                        if (_fbKey.currentState!.saveAndValidate()) {
                          await ref
                              .watch(postCommentProvider.notifier)
                              .postComment(widget.progressLinePostId, data)
                              .then((value) async {
                            value.fold((failure) {}, (res) {
                              ref
                                  .watch(commentsControllerProvider.notifier)
                                  .getComments(widget.progressLinePostId);
                              key.currentState!.controller!.clear();
                            });
                            Utils.toastSuccessMessage(
                                "Comment Posted", context);
                          });
                        }
                      },
                    ),
                  ),
                  // hintText: widget.control.label,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Helper.textColor300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(color: ref.watch(primaryColorProvider)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showProgresslineDeleteBottomSheet(context, progresslineId) {
    if (!Platform.isIOS) {
      return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 200.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Delete',
                    style: TextStyle(
                        color: Helper.errorColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure you want to delete this post? ",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Helper.textColor500),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Service()
                                .deleteProgresslinePost(progresslineId)
                                .then((value) {
                              context.pop();
                              context.pop();
                              Utils.flushBarErrorMessage(
                                  "Post Deleted", context);
                            });
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 11),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              backgroundColor: Helper.errorColor,
                              fixedSize: Size.infinite),
                          child: const Text(
                            "Delete",
                            style: TextStyle(
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
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 11),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Helper.textColor300),
                              fixedSize: Size.infinite),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Do you want to delete this post?',
        ),
        content: Text(
          "You cannot undo this action ",
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
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
              onPressed: () {
                Service().deleteProgresslinePost(progresslineId).then((value) {
                  context.pop();
                  context.pop();
                  Utils.flushBarErrorMessage("Post Deleted", context);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }

  _showCommentDeleteBottomSheet(context, progresslineId, commentId) {
    if (!Platform.isIOS) {
      return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 200.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Delete',
                    style: TextStyle(
                        color: Helper.errorColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure you want to delete this comment? ",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Helper.textColor500),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            Service()
                                .deleteProgresslineComment(
                                    progresslineId, commentId)
                                .then((value) {
                              ref
                                  .watch(commentsControllerProvider.notifier)
                                  .getComments(widget.progressLinePostId);
                              context.pop();
                              Utils.flushBarErrorMessage(
                                  "Comment Deleted", context);
                            });
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 11),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              backgroundColor: Helper.errorColor,
                              fixedSize: Size.infinite),
                          child: const Text(
                            "Delete",
                            style: TextStyle(
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
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 11),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Helper.textColor300),
                              fixedSize: Size.infinite),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Do you want to delete this comment?',
        ),
        content: Text(
          "You cannot undo this action ",
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
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
              onPressed: () {
                Service()
                    .deleteProgresslineComment(progresslineId, commentId)
                    .then((value) {
                  ref
                      .watch(commentsControllerProvider.notifier)
                      .getComments(widget.progressLinePostId);
                  context.pop();
                  Utils.flushBarErrorMessage("Comment Deleted", context);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }
}
