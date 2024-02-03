import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/post_comment_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/progressline_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/comments_widget.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/viewed_by_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:developer';

class FeedCard extends ConsumerStatefulWidget {
  final progresslineData;
  const FeedCard({super.key, required this.progresslineData});

  @override
  ConsumerState<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends BaseConsumerState<FeedCard> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<UserLeanModel> _myCustomList = [];
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  String timezone = 'Asia/Kolkata';
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();

    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
    fetchUser();
    // Service().fetchUser().then((value) {
    //   setState(() {
    //     timezone = value.preferences!.timezone!;
    //   });
    // });
  }

  fetchUser() {
    user = _prefsLocator.getUser();
    log("saved user" + user.toString());
  }

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

  // String formatRelativeTime(DateTime createdAt, String timeZone) {
  //   // Get the desired time zone
  //   Location location = getLocation(timeZone);

  //   // Convert the input DateTime to the specified time zone
  //   TZDateTime localDateTime = TZDateTime.from(createdAt, location);

  //   // Calculate the relative time
  //   Duration difference = DateTime.now().difference(localDateTime);
  //   return timeago.format(DateTime.now().subtract(difference),
  //       locale: 'en_short');
  // }

  // String formatCustomRelativeTime(DateTime createdAt, String timeZone) {
  //   // Get the desired time zone
  //   Location location = getLocation(timeZone);

  //   // Convert the input DateTime to the specified time zone
  //   TZDateTime localDateTime = TZDateTime.from(createdAt, location);

  //   // Calculate the difference in days
  //   int daysDifference = DateTime.now().difference(localDateTime).inDays;

  //   if (daysDifference == 0) {
  //     return 'just now';
  //   } else if (daysDifference < 7) {
  //     return '$daysDifference ${daysDifference == 1 ? 'day' : 'days'} ago';
  //   } else {
  //     // Calculate the difference in months and years
  //     int monthsDifference =
  //         DateTime.now().difference(localDateTime).inDays ~/ 30;
  //     int yearsDifference =
  //         DateTime.now().difference(localDateTime).inDays ~/ 365;

  //     if (monthsDifference == 0) {
  //       return '$yearsDifference ${yearsDifference == 1 ? 'year' : 'years'} ago';
  //     } else if (yearsDifference == 0) {
  //       return '$monthsDifference ${monthsDifference == 1 ? 'month' : 'months'} ago';
  //     } else {
  //       // If more than a week, format the date using intl package
  //       return DateFormat('dd MMM, yyyy').format(localDateTime);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.width - (2 * 20)) / 1.5;
    print("id " + widget.progresslineData.id.toString());
    return FormBuilder(
      key: _fbKey,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        // height: 336.h,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Helper.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Wrap(
          // direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              horizontalTitleGap: 8.w,
              leading: AvatarWidget(
                dpUrl: widget.progresslineData.user.dpUrl != null
                    ? widget.progresslineData.user.dpUrl
                    : "",
                name: widget.progresslineData.user.name,
                backgroundColor: widget.progresslineData.user.preset.color,
                size: 24,
                fontSize: 14,
              ),
              title: Text(
                widget.progresslineData.user.name,
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor900,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                widget.progresslineData.user.lastActive != null
                    ?
                    // formatCustomRelativeTime(
                    //     widget.progresslineData.createdAt!,
                    //     'Asia/Kolkata',
                    //   )
                    // formatRelativeTime(
                    //     widget.progresslineData.createdAt!,
                    //     'Asia/Kolkata',
                    //   )
                    formatTimeDifference(
                        widget.progresslineData.createdAt!,
                        timezone: user!['preferences']
                            ['timezone'], // Replace with the actual time zone
                      )
                    : "-",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.textColor600,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Stack(
                fit: StackFit.loose,
                // alignment: Alignment.bottomCenter,
                children: [
                  // widget.data.latestImage != null
                  //     ?
                  Positioned(
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Image.network(
                            widget.progresslineData.url,
                            // height: 284.h,
                            fit: BoxFit.fill,
                            gaplessPlayback: true,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                  // : ClipRRect(
                  //     borderRadius: BorderRadius.circular(16.r),
                  //     child: Image.asset(
                  //       'assets/images/error_image.jpeg',
                  //       fit: BoxFit.fill,
                  //       height: 264.h,
                  //     ),
                  //   ),
                  Container(
                      margin: EdgeInsets.only(top: height - 15),
                      // height: 88.h,
                      width: double.infinity,
                      // margin: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color.fromRGBO(246, 246, 246, 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            horizontalTitleGap: 8.w,
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            leading: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => ViewedByWidget(
                                          data:
                                              widget.progresslineData.viewedBy,
                                          showText: "Viewed By",
                                          projectId: "",
                                          showExtra: false,
                                        ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.w),
                                child: SvgPicture.asset(
                                  'assets/images/eye.svg',
                                  width: 24.w,
                                ),
                              ),
                            ),
                            title: Text(
                              widget.progresslineData.viewedBy.length
                                  .toString(),
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor600,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: CommentsWidget(
                                              progresslineId:
                                                  widget.progresslineData.id),
                                        ));
                              },
                              child: Text(
                                widget.progresslineData.comments.length
                                        .toString() +
                                    " comments",
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: ref.watch(primaryColorProvider),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 8.w,
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: 0),
                            leading: AvatarWidget(
                              dpUrl:
                                  user!['dpUrl'] != null ? user!['dpUrl'] : "",
                              name: user!['name'],
                              backgroundColor: user!['preset']['color'],
                              size: 32,
                              fontSize: 14,
                            ),
                            title: FlutterMentions(
                              key: key,
                              suggestionPosition: SuggestionPosition.Top,
                              maxLines: 5,
                              minLines: 1,
                              suggestionListDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Helper.textColor300)),
                              mentions: [
                                Mention(
                                  trigger: "@",
                                  suggestionBuilder: (data) {
                                    print("builder data" + data.toString());
                                    return Container(
                                      // margin: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10.0),
                                      child: ListTile(
                                        horizontalTitleGap: 8.w,
                                        dense: true,
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        contentPadding: EdgeInsets.zero,
                                        leading: AvatarWidget(
                                          dpUrl: data['dpUrl'] != null
                                              ? data['dpUrl']
                                              : "",
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
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: ref.watch(primaryColorProvider),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                  data: getMentionsList(),
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
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 12.w),
                                hintText: "Add comment",
                                hintStyle: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/images/send.svg'),
                                    onPressed: () async {
                                      setState(() {
                                        // _controller.clear();
                                        // _changeState = false;
                                      });
                                      Map<String, dynamic> data =
                                          getCommentData();
                                      if (_fbKey.currentState!
                                          .saveAndValidate()) {
                                        print("id passed" +
                                            widget.progresslineData.id
                                                .toString());
                                        await ref
                                            .watch(postCommentProvider.notifier)
                                            .postComment(
                                                widget.progresslineData.id,
                                                data)
                                            .then((value) async {
                                          value.fold((failure) {
                                            print("errorrrrrr");
                                          }, (res) {
                                            ref
                                                .watch(
                                                    progresslineControllerProvider
                                                        .notifier)
                                                .getProgressline(widget
                                                    .progresslineData
                                                    .project
                                                    .projectId);
                                            print("response data" +
                                                res.toString());
                                            key.currentState!.controller!
                                                .clear();
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
                                  borderSide:
                                      BorderSide(color: Helper.textColor300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                      color: ref.watch(primaryColorProvider)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
          ],
        ),
      ),
    );
  }
}
