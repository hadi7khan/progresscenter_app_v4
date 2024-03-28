import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_ticket_by_id.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_replies_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/post_ticket_reply_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/ticket_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/ticket_replies_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/chat_input_widget.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/chat_message_widget.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/ticket_details_widget.dart';

class TicketByIdScreen extends ConsumerStatefulWidget {
  final ticketId;
  const TicketByIdScreen({super.key, this.ticketId});

  @override
  ConsumerState<TicketByIdScreen> createState() => _TicketByIdScreenState();
}

class _TicketByIdScreenState extends BaseConsumerState<TicketByIdScreen> {
  List<TicketRepliesModel> groupedReplies = [];
  ScrollController _scrollController = ScrollController();

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
      });
    });
  }

  List<Map<String, dynamic>> getGroupedReplies() {
    Map<String, List<TicketRepliesModel>> repliesMap = {};

    for (var reply in groupedReplies) {
      final dateKey = formatDate(reply.createdAt);
      if (!repliesMap.containsKey(dateKey)) {
        repliesMap[dateKey] = [];
      }
      repliesMap[dateKey]!.add(reply);
    }

    return repliesMap.entries
        .map((entry) => {'date': entry.key, 'replies': entry.value})
        .toList();
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
      return DateFormat('dd MMM, yy ').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final repliesData = getGroupedReplies();
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
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  centerTitle: false,
                  titleSpacing: 12.0.w,
                  leading: InkWell(
                    highlightColor: Colors.transparent,
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
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 8.h),
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
                              letterSpacing: -0.3,
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
          ),
          body: SafeArea(
            top: true,
            child: RefreshIndicator(
              displacement: 10.0,
              color: ref.watch(primaryColorProvider),
              onRefresh: () async {
                HapticFeedback.mediumImpact();
                return await ref
                    .refresh(ticketControllerProvider.notifier)
                    .getTicketById(widget.ticketId);
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DETAILS",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack.withOpacity(0.5),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.h),
                      TicketDetailsWidget(ticketData: ticketData),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        "RESOLUTION",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
                              itemCount: repliesData.length,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                final date = repliesData[index]['date'];
                                final replies = repliesData[index]['replies'];
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.h, horizontal: 16.w),
                                      decoration: BoxDecoration(
                                          color: Helper.widgetBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            fontSize: 12,
                                            color: Helper.textColor500,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    for (var reply in replies)
                                      ChatMessageWidget(
                                          message: reply.message,
                                          userType: reply.userType,
                                          userName: reply.user.name,
                                          dpUrl: reply.userType == 'User'
                                              ? ""
                                              : reply.user.dpUrl,
                                          createdAt: reply.createdAt),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                        error: (err, _) {
                          return const Text("Failed to load Projects",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.errorColor));
                        },
                        loading: () => SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: ChatInputWidget(
            onChange: (data) async {
              await ref
                  .watch(postTicketReplyProvider.notifier)
                  .postTicketReply(widget.ticketId, data)
                  .then((value) async {
                value.fold((failure) {}, (res) {
                  TicketRepliesModel ticketReply =
                      TicketRepliesModel.fromJson(res);

                  groupedReplies.add(ticketReply);
                  setState(() {});

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                });
              });
            },
          ),
        );
      },
      error: (err, _) {
        return const Text("Failed to load Ticket Info",
            style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
      },
      loading: () => LoadingTicketById(),
    );
  }
}
