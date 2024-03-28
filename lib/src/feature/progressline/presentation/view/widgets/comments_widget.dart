import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_comments_widget.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/post_comment_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/process_mention_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

import 'package:timezone/timezone.dart';

class CommentsWidget extends ConsumerStatefulWidget {
  final progresslineId;
  final String role;
  final String userId;
  const CommentsWidget(
      {super.key,
      required this.progresslineId,
      required this.role,
      required this.userId});

  @override
  ConsumerState<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends BaseConsumerState<CommentsWidget> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<UserLeanModel> _myCustomList = [];
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  final RegExp mentionRegex = RegExp(r"@\[([\w\s]+)\]\(user:(\d+)\)");
  Map<String, dynamic>? user;
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  @override
  void initState() {
    super.initState();
    fetchUser();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(commentsControllerProvider.notifier)
          .getComments(widget.progresslineId);
    });
    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
  }

  fetchUser() {
    user = _prefsLocator.getUser();
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
    final commentsData =
        ref.watch(commentsControllerProvider.select((value) => value.comments));
    return FormBuilder(
      key: _fbKey,
      child: Wrap(children: [
        Container(
          padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
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
                      height: MediaQuery.of(context).size.height * 0.4.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/illustration.svg'),
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
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.h);
                          },
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: ((context, index) {
                            final reversedIndex = data.length - 1 - index;
                            return InkWell(
                              highlightColor: Colors.transparent,
                              onLongPress: () {
                                HapticFeedback.mediumImpact();
                                widget.role == "ADMIN" ||
                                        widget.userId ==
                                            data[reversedIndex].user!.id!
                                    ? _showDeleteBottomSheet(
                                        context,
                                        widget.progresslineId,
                                        data[reversedIndex].id)
                                    : null;
                              },
                              child: ListTile(
                                horizontalTitleGap: 8.w,
                                dense: true,
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: 0),
                                contentPadding: EdgeInsets.zero,
                                leading: AvatarWidget(
                                  dpUrl: data[reversedIndex].user!.dpUrl != null
                                      ? data[reversedIndex].user!.dpUrl!
                                      : "",
                                  name: data[reversedIndex].user!.name!,
                                  backgroundColor:
                                      data[reversedIndex].user!.preset!.color!,
                                  size: 32,
                                  fontSize: 14,
                                ),
                                title: Row(children: [
                                  Text(
                                    data[reversedIndex].user!.name!,
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "·",
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor600,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    formatTimeDifference(
                                      data[reversedIndex].createdAt!,
                                      timezone: user!['preferences']
                                          ['timezone'],
                                    ),
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor600,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ]),
                                subtitle: ProcessMention(
                                  text: data[reversedIndex].body!,
                                ),
                              ),
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
                          letterSpacing: -0.3, color: Helper.errorColor));
                },
                loading: () => LoadCommentsWidget(),
              ),
              ListTile(
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
                  textInputAction: TextInputAction.done,
                  suggestionListDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white,
                      border: Border.all(color: Helper.textColor300)),
                  suggestionPosition: SuggestionPosition.Top,
                  maxLines: 5,
                  minLines: 1,
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
                                VisualDensity(horizontal: 0, vertical: 0),
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
                          setState(() {});
                          Map<String, dynamic> data = getCommentData();
                          if (_fbKey.currentState!.saveAndValidate()) {
                            await ref
                                .watch(postCommentProvider.notifier)
                                .postComment(widget.progresslineId, data)
                                .then((value) async {
                              value.fold((failure) {}, (res) {
                                ref
                                    .watch(commentsControllerProvider.notifier)
                                    .getComments(widget.progresslineId);

                                key.currentState!.controller!.clear();
                              });
                              Utils.toastSuccessMessage(
                                  "Comment Posted", context);
                            });
                          }
                        },
                      ),
                    ),
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
            ],
          ),
        ),
      ]),
    );
  }

  _showDeleteBottomSheet(context, progresslineId, commentId) {
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
                                  .getComments(widget.progresslineId);
                              context.pop();
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
                      .getComments(widget.progresslineId);
                  context.pop();
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
