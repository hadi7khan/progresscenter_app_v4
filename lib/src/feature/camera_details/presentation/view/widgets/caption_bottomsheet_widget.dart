import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

class CaptionBottomSheetWidget extends ConsumerStatefulWidget {
  final Function onNext;
  const CaptionBottomSheetWidget({super.key, required this.onNext});

  @override
  ConsumerState<CaptionBottomSheetWidget> createState() =>
      _CaptionBottomSheetWidgetState();
}

class _CaptionBottomSheetWidgetState
    extends BaseConsumerState<CaptionBottomSheetWidget> {
  TextEditingController _captionController = TextEditingController();
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  List<UserLeanModel> _myCustomList = [];

  @override
  void initState() {
    super.initState();

    Service().fetchUserList().then((users) {
      // setState(() {
      _myCustomList = users;
      // });
    });
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

  String getCommentData() {
    final commentText = key.currentState!.controller!.text;

    // Replace mentions in the text
    final replacedText = replaceMentionsInText(_myCustomList, commentText);
    return replacedText;
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
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      height: 238.h,
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Write a caption',
                  style: TextStyle(
                      letterSpacing: -0.3,
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
                CustomInputWidget(
                  title: "Caption",
                  formField: FlutterMentions(
                    key: key,
                    suggestionPosition: SuggestionPosition.Top,
                    maxLines: 5,
                    minLines: 1,
                    textInputAction: TextInputAction.done,
                    suggestionListDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                        border: Border.all(color: Helper.textColor300)),
                    mentions: [
                      Mention(
                        trigger: "@",
                        suggestionBuilder: (data) {
                          return Container(
                            // margin: EdgeInsets.all(10),
                            width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.all(10.0),
                            child: ListTile(
                              horizontalTitleGap: 8.w,
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              leading: AvatarWidget(
                                dpUrl:
                                    data['dpUrl'] != null ? data['dpUrl'] : "",
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      hintText: "Add comment",
                      hintStyle: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      // suffixIcon: Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                      //   child: IconButton(
                      //     icon: SvgPicture.asset(
                      //         'assets/images/send.svg'),
                      //     onPressed: () async {
                      //       setState(() {
                      //         // _controller.clear();
                      //         // _changeState = false;
                      //       });
                      //       Map<String, dynamic> data =
                      //           getCommentData();

                      //     },
                      //   ),
                      // ),
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
                SizedBox(height: 20.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () async {
                          context.pop();
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            backgroundColor: Colors.white,
                            fixedSize: Size.infinite),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.neutral500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          widget.onNext(getCommentData());
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            backgroundColor: ref.watch(primaryColorProvider),
                            side: BorderSide(color: Helper.textColor300),
                            fixedSize: Size.infinite),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
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
}
