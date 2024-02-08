import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_comments_widget.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
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
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'dart:developer';

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
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: progresslineBytIdData.when(
        data: (data) {
          return SingleChildScrollView(
            child: FormBuilder(
              key: _fbKey,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: data.url != null
                        ? Image.network(
                            data.url,
                            gaplessPlayback: true,
                            fit: BoxFit.fitHeight,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
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
                                height:
                                    MediaQuery.of(context).size.height * 0.3.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  height: MediaQuery.of(context).size.height *
                                      0.4.h,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16.h);
                                    },
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    controller: _commentController,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: ((context, index) {
                                      // Reverse the order of the list
                                      final reversedIndex =
                                          data.length - 1 - index;
                                      return Column(
                                        children: [
                                          ListTile(
                                            horizontalTitleGap: 8.w,
                                            dense: true,
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: 0),
                                            contentPadding: EdgeInsets.zero,
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
                                            title: Text(
                                              data[reversedIndex].user!.name!,
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor600,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: ProcessMention(
                                              text: data[reversedIndex].body!,
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
                ],
              ),
            ),
          );
        },
        error: (err, _) {
          return const Text("Failed to load Progressline Details",
              style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
        },
        loading: () => LoadingAppBar(),
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
}
