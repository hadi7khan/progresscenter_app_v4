import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_replies_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/ticket_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/ticket_replies_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/chat_message_widget.dart';

class TicketByIdScreen extends ConsumerStatefulWidget {
  final ticketId;
  const TicketByIdScreen({super.key, this.ticketId});

  @override
  ConsumerState<TicketByIdScreen> createState() => _TicketByIdScreenState();
}

class _TicketByIdScreenState extends BaseConsumerState<TicketByIdScreen> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<TicketRepliesModel> groupedReplies = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(ticketControllerProvider.notifier)
          .getTicketById(widget.ticketId);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(ticketRepliesControllerProvider.notifier)
          .getTicketReplies(widget.ticketId)
          .then((value) {
        groupedReplies = value;
        print("groupedReplies-----" + groupedReplies.toString());
      });
    });
  }

  showDateTimeString(date, dateFormat) {
    // Format the DateTime object into the desired format
    String formattedDate = DateFormat(dateFormat).format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final ticketByIdData =
        ref.watch(ticketControllerProvider.select((value) => value.ticketById));
    final ticketRepliesData = ref.watch(
        ticketRepliesControllerProvider.select((value) => value.replies));

    return ticketByIdData.when(
      data: (ticketData) {
        return Scaffold(
          backgroundColor: Helper.screenBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: AppBar(
                surfaceTintColor: Colors.white,
                automaticallyImplyLeading: false,
                centerTitle: true,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/images/close-x.svg',
                  ),
                ),
                leadingWidth: 12,
                title: Row(
                  children: [
                    Text(
                      "ID #" + ticketData.id!,
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: ticketData.status == "OPEN"
                            ? Helper.errorColor.withOpacity(0.1)
                            : Helper.successColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        ticketData.status,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: ticketData.status == "OPEN"
                                ? Helper.errorColor
                                : Helper.successColor),
                      ),
                    ),
                  ],
                ),
                actionsIconTheme: IconThemeData(color: Helper.iconColor),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DETAILS",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.white,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticketData.topic,
                              style: TextStyle(
                                  color: Helper.baseBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              ticketData.subject,
                              style: TextStyle(
                                  color: Helper.baseBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ticketData.detail,
                              style: TextStyle(
                                  color: Helper.baseBlack.withOpacity(0.5),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            ListTile(
                              horizontalTitleGap: 8.w,
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              leading: SvgPicture.asset(
                                'assets/images/user-circle.svg',
                              ),
                              title: Text(
                                ticketData.user.name,
                                style: TextStyle(
                                    color: Helper.baseBlack.withOpacity(0.5),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 8.w,
                              dense: true,
                              visualDensity:
                                  VisualDensity(horizontal: 0, vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              leading: SvgPicture.asset(
                                'assets/images/calendar-check-ticket.svg',
                              ),
                              title: Text(
                                showDateTimeString(ticketData.updatedAt,
                                    'dd MMM, yy · hh:mm a'),
                                style: TextStyle(
                                    color: Helper.baseBlack.withOpacity(0.5),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "RESOLUTION",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    ticketRepliesData.when(
                      data: (data) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                            ),
                            child: ListView.builder(
                              itemCount: groupedReplies.length,
                              itemBuilder: (context, index) {
                                return ChatMessageWidget(
                                  message: groupedReplies[index].message,
                                  userType: groupedReplies[index].userType,
                                  userName: groupedReplies[index].user.name!,
                                  dpUrl:
                                      groupedReplies[index].userType == 'User'
                                          ? ""
                                          : groupedReplies[index].user.dpUrl!,
                                  createdAt: groupedReplies[index].createdAt,
                                );
                              },
                            ));
                      },
                      error: (err, _) {
                        return const Text("Failed to load Projects",
                            style: TextStyle(color: Helper.errorColor));
                      },
                      loading: () => LoadingUserProfile(),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            color: Colors.white,
            alignment: Alignment.center,
            height: 72.h,
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
                name: 'support',
                controller: _controller,
                onChanged: (value) {},
                onSubmitted: (text) {},
                validator: (val) {},
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
                  hintText: "Type message here...",
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
                          "message": _controller.text,
                        };
                        if (_fbKey.currentState!.saveAndValidate()) {
                          // print("id passed" + widget.progresslineId.toString());
                          // await ref
                          //     .watch(postCommentProvider.notifier)
                          //     .postComment(widget.progresslineId, data)
                          //     .then((value) async {
                          //   value.fold((failure) {
                          //     print("errorrrrrr");
                          //   }, (res) {
                          //     ref
                          //         .watch(commentsControllerProvider.notifier)
                          //         .getComments(widget.progresslineId);
                          //     print("response data" + res.toString());
                          //     _controller.clear();
                          //     // _showProgressBottomSheet(context, ref);
                          //   });
                          //   Utils.toastSuccessMessage("Comment Posted");
                          // });
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
        );
      },
      error: (err, _) {
        return const Text("Failed to load Ticket Info",
            style: TextStyle(color: Helper.errorColor));
      },
      loading: () => LoadingUserProfile(),
    );
  }
}
