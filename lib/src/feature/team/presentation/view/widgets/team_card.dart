import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_controller.dart';

class TeamCard extends ConsumerStatefulWidget {
  final teamData;
  const TeamCard({super.key, required this.teamData});

  @override
  ConsumerState<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends BaseConsumerState<TeamCard> {
  final GlobalKey<FormBuilderState> _dialogKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    print("teamData" + widget.teamData.toString());
    return Container(
      decoration: BoxDecoration(
        color: Helper.widgetBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: AvatarWidget(
          dpUrl: widget.teamData.dp != null ? widget.teamData.dpUrl : "",
          name: widget.teamData.name,
          backgroundColor: widget.teamData.preset.color,
          size: 32,
        ),
        title: Text(
          widget.teamData.name,
          style: TextStyle(
              color: Helper.textColor700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          widget.teamData.designation != null
              ? widget.teamData.designation
              : "N/A",
          style: TextStyle(
              color: Helper.textColor600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
        trailing: PopupMenuButton(
          icon: SvgPicture.asset('assets/images/dots-vertical.svg'),
          position: PopupMenuPosition.under,
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'password',
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            PopupMenuItem<String>(
              value: 'delete',
              child: Text(
                'Delete',
                style: TextStyle(
                    color: Helper.errorColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
          onSelected: (value) {
            print(value.toString());
            if (value == 'delete') {
              showDialog(
                context: context,
                builder: ((context) {
                  return FormBuilder(
                    key: _dialogKey,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      content: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "We will remove all of ",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Helper.textColor500),
                                  children: [
                                    TextSpan(
                                      text: '\"' + widget.teamData.name! + '\"',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Helper.baseBlack),
                                    ),
                                    TextSpan(
                                      text: ' personal details.',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Helper.textColor500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '\"' + widget.teamData.name! + '\"',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Helper.baseBlack),
                                  children: [
                                    TextSpan(
                                      text:
                                          "updates and generated content will remain available anonymously.",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Helper.textColor500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Attention:",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Helper.baseBlack),
                                  children: [
                                    TextSpan(
                                      text:
                                          "This action is irreversible! You might prefer to disable the user instead.",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Helper.textColor500),
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
                            Service()
                                .deleteUser(widget.teamData.id)
                                .then((value) {
                              context.pop();
                              Utils.flushBarErrorMessage(
                                  "User deleted", context);
                              ref
                                  .watch(teamControllerProvider.notifier)
                                  .getUser();
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
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    ),
                  );
                }),
              );
            } else if (value == 'password') {}
          },
        ),
      ),
    );
  }
}
