import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_comments_widget.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/post_comment_controller.dart';

class CommentsWidget extends ConsumerStatefulWidget {
  final progresslineId;
  const CommentsWidget({super.key, required this.progresslineId});

  @override
  ConsumerState<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends BaseConsumerState<CommentsWidget> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(commentsControllerProvider.notifier)
          .getComments(widget.progresslineId);
    });
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
          // height: MediaQuery.of(context).size.height * 0.6,
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
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              commentsData.when(
                data: (data) {
                  return SizedBox(
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
                        // Reverse the order of the list
                        final reversedIndex = data.length - 1 - index;
                        return ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: AvatarWidget(
                            dpUrl: data[reversedIndex].user!.dpUrl != null
                                ? data[reversedIndex].user!.dpUrl!
                                : "",
                            name: data[reversedIndex].user!.name!,
                            backgroundColor: data[reversedIndex].user!.preset!.color!,
                            size: 32,
                          ),
                          title: Text(
                            data[reversedIndex].user!.name!,
                            style: TextStyle(
                                color: Helper.textColor600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            data[reversedIndex].body!,
                            style: TextStyle(
                                color: Helper.textColor600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }),
                    ),
                  );
                },
                error: (err, _) {
                  return const Text("Failed to load Comments",
                      style: TextStyle(color: Helper.errorColor));
                },
                loading: () => LoadCommentsWidget(),
              ),
              SizedBox(
                height: 64.h,
                child: ListTile(
                  horizontalTitleGap: 8.w,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: AvatarWidget(
                    dpUrl: "",
                    name: "HADI",
                    backgroundColor: "#0F9555",
                    size: 32,
                  ),
                  title: FormBuilderTextField(
                    name: 'comment',
                    controller: _controller,
                    onChanged: (text) {
                      // setState(() {});
                      // _changeState = true;
                    },
                    onSubmitted: (text) {
                      setState(() {
                        // _changeState = true;
                      });
                    },
                    validator: (val) {
                      // if (_validate && val == null || val!.isEmpty) {
                      //   return 'Project name is required';
                      // }
                      // return null;
                    },
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      hintText: "Add comment",
                      hintStyle: TextStyle(
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
                            Map<String, dynamic> data = {
                              "comment": _controller.text,
                            };
                            if (_fbKey.currentState!.saveAndValidate()) {
                              print("id passed" +
                                  widget.progresslineId.toString());
                              await ref
                                  .watch(postCommentProvider.notifier)
                                  .postComment(widget.progresslineId, data)
                                  .then((value) async {
                                value.fold((failure) {
                                  print("errorrrrrr");
                                }, (res) {
                                  ref
                                      .watch(
                                          commentsControllerProvider.notifier)
                                      .getComments(widget.progresslineId);
                                  print("response data" + res.toString());
                                  _controller.clear();
                                  // _showProgressBottomSheet(context, ref);
                                });
                                Utils.toastSuccessMessage("Comment Posted");
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
                        borderSide: BorderSide(color: Helper.primary),
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
                    onTap: () {},
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
