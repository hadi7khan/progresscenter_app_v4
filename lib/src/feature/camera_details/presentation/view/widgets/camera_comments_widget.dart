import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/image_comments_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/image_comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/process_mention_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'dart:developer' as dev;

class CameraCommentsWidget extends ConsumerStatefulWidget {
  final model.Comment comment;
  final String projectId;
  final String cameraId;
  final String imageName;
  const CameraCommentsWidget(
      {super.key,
      required this.comment,
      required this.projectId,
      required this.cameraId,
      required this.imageName});

  @override
  ConsumerState<CameraCommentsWidget> createState() =>
      _CameraCommentsWidgetState();
}

class _CameraCommentsWidgetState
    extends BaseConsumerState<CameraCommentsWidget> {
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
      Service().fetchUserList().then((users) {
        setState(() {
          _myCustomList = users;
        });
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
      "message": replacedText,
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

// method for showing mentioned user n additional text
  TextSpan _buildTextSpan(String text) {
    RegExp regex = RegExp(r"@\[([^\]]+)\]\(user:(\d+)\)");

    List<TextSpan> textSpans = [];

    List<String> matches =
        regex.allMatches(text).map((m) => m.group(0)!).toList();
    List<String> segments = text.split(regex);

    for (int i = 0; i < segments.length; i++) {
      textSpans.add(TextSpan(text: segments[i]));

      if (i < matches.length) {
        String match = matches[i];
        RegExpMatch userMatch = RegExp(r"\[([^\]]+)\]").firstMatch(match)!;
        RegExpMatch idMatch = RegExp(r":(\d+)").firstMatch(match)!;

        String username = userMatch.group(1)!;
        String userId = idMatch.group(1)!;

        textSpans.add(
          TextSpan(
            text: '@$username',
            style: TextStyle(
              letterSpacing: -0.3,
              color: Colors.blue, // Set your desired text style here
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer() // Add a tap gesture recognizer if needed
                  ..onTap = () {
                    // Handle tap on mention
                    print('Tapped on mention: $userId');
                  },
          ),
        );
      }
    }

    return TextSpan(children: textSpans);
  }

  @override
  Widget build(BuildContext context) {
    dev.log("replies" + widget.comment.replies!.length.toString());
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
              ListTile(
                horizontalTitleGap: 8.w,
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                contentPadding: EdgeInsets.zero,
                leading: AvatarWidget(
                  dpUrl: widget.comment.user!.dpUrl != null
                      ? widget.comment.user!.dpUrl!
                      : "",
                  name: widget.comment.user!.name!,
                  backgroundColor: widget.comment.user!.preset!.color!,
                  size: 32,
                  fontSize: 14,
                ),
                title: Text(
                  widget.comment.user!.name!,
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor600,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: ProcessMention(
                  text: widget.comment.message!,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.h);
                  },
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: widget.comment.replies!.length,
                  itemBuilder: ((context, index) {
                    // final reversedIndex = widget.replies.length - 1 - index;
                    if (index == 0) {
                      ListTile(
                        horizontalTitleGap: 8.w,
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 0),
                        contentPadding: EdgeInsets.zero,
                        leading: AvatarWidget(
                          dpUrl: widget.comment.user!.dpUrl != null
                              ? widget.comment.user!.dpUrl!
                              : "",
                          name: widget.comment.user!.name!,
                          backgroundColor: widget.comment.user!.preset!.color!,
                          size: 32,
                          fontSize: 14,
                        ),
                        title: Text(
                          widget.comment.user!.name!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor600,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: ProcessMention(
                          text: widget.comment.message!,
                        ),
                      );
                    }
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onLongPress: () {
                        HapticFeedback.mediumImpact();
                      },
                      child: ListTile(
                        horizontalTitleGap: 8.w,
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 0),
                        contentPadding: EdgeInsets.only(left: 20.w),
                        leading: AvatarWidget(
                          dpUrl:
                              widget.comment.replies![index].user!.dpUrl != null
                                  ? widget.comment.replies![index].user!.dpUrl!
                                  : "",
                          name: widget.comment.replies![index].user!.name!,
                          backgroundColor: widget
                              .comment.replies![index].user!.preset!.color!,
                          size: 32,
                          fontSize: 14,
                        ),
                        title: Text(
                          widget.comment.replies![index].user!.name!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor600,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: ProcessMention(
                          text: widget.comment.replies![index].message!,
                        ),
                      ),
                    );
                  }),
                ),
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
                          Map<String, dynamic> data = getCommentData();
                          if (_fbKey.currentState!.saveAndValidate()) {
                            await Service()
                                .addReplyOnImageComment(widget.projectId,
                                    widget.cameraId, widget.comment.id!, data)
                                .then((value) {
                              ref
                                  .watch(
                                      imageCommentsControllerProvider.notifier)
                                  .getImageComments(widget.projectId,
                                      widget.cameraId, widget.imageName);
                              context.pop();
                              Utils.toastSuccessMessage("Reply sent", context);
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
            ],
          ),
        ),
      ]),
    );
  }
}
