import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_progressline_details.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/all_image_comments_model.dart'
    as allComments;
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/all_image_comments_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/image_comments_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/all_image_comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/image_comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/camera_comments_widget.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/process_mention_widget.dart';
import 'dart:developer' as dev;

import 'package:timezone/timezone.dart';

class ImageCommentsScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String imageName;
  final int imageHeight;
  final int imageWidth;
  final bool fromNotifications;
  final String cameraImageCommentId;
  // final String cameraImageCommentReplyId;
  final String imageUrl;

  const ImageCommentsScreen({
    super.key,
    required this.projectId,
    required this.cameraId,
    required this.imageName,
    required this.imageHeight,
    required this.imageWidth,
    required this.fromNotifications,
    required this.cameraImageCommentId,
    // required this.cameraImageCommentReplyId,
    required this.imageUrl,
  });

  @override
  ConsumerState<ImageCommentsScreen> createState() =>
      _ImageCommentsScreenState();
}

class _ImageCommentsScreenState extends BaseConsumerState<ImageCommentsScreen> {
  TextEditingController _commentController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<allComments.Comment> commentsList = [];
  var aspectRatio;
  var imageHeight;
  int page = 0;
  int count = 0;
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(imageCommentsControllerProvider.notifier).getImageComments(
          widget.projectId, widget.cameraId, widget.imageName);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(allImageCommentsControllerProvider.notifier)
          .getAllImageComments(widget.projectId, widget.cameraId, page)
          .then((value) {
        commentsList = value.comments.toList();
        count = value.count;

        // for scrolling to given index if routed from notifications
        if (widget.fromNotifications) {
          int index = value.comments.indexWhere(
              (comment) => comment.id == widget.cameraImageCommentId);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Timer(Duration(seconds: 1), () {
              _scrollController.animateTo(
                index * 40,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            });
          });
        }
      });
    });
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      final bottom = 16.h;
      if (_scrollController.position.pixels == maxScrollExtent) {
        if (commentsList.length <= count) {
          page++;
          ref
              .read(allImageCommentsControllerProvider.notifier)
              .getAllImageComments(widget.projectId, widget.cameraId, page)
              .then((value) {
            commentsList.addAll(value.comments);
          });
        }
      }
    });
    fetchUser();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    aspectRatio = widget.imageWidth / widget.imageHeight;
    imageHeight = MediaQuery.of(context).size.width / aspectRatio;
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  buildCommentsHead(List<allComments.Comment> comments) {
    return comments.map((e) {
      var x = (e.position!.x! / 100) * MediaQuery.of(context).size.width;
      var y = (e.position!.y! / 100) * imageHeight;
      return Positioned(
          left: x,
          top: y,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  useRootNavigator: true,
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: CameraCommentsWidget(
                            comment: e,
                            projectId: widget.projectId,
                            cameraId: widget.cameraId,
                            imageName: widget.imageName),
                      ));
            },
            child: AvatarWidget(
              dpUrl: e.user!.dpUrl != null ? e.user!.dpUrl! : "",
              name: e.user!.name!,
              backgroundColor: e.user!.preset!.color!,
              size: 16,
              fontSize: 10,
            ),
          ));
    }).toList();
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
    final imageCommentsData = ref.watch(
        imageCommentsControllerProvider.select((value) => value.imageComments));
    final allImageCommentsData = ref.watch(allImageCommentsControllerProvider
        .select((value) => value.allImageComments));
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
                "Comments",
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
          child: imageCommentsData.when(
        data: (data) {
          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            color: ref.watch(primaryColorProvider),
            displacement: 40,
            onRefresh: () async {
              HapticFeedback.mediumImpact();
              return await ref
                  .refresh(imageCommentsControllerProvider.notifier)
                  .getImageComments(
                      widget.projectId, widget.cameraId, widget.imageName)
                  .then((value) {
                ref
                    .refresh(allImageCommentsControllerProvider.notifier)
                    .getAllImageComments(
                        widget.projectId, widget.cameraId, page);
              });
            },
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          var x = details.localPosition.dx;
                          var y = details.localPosition.dy;
                          var x_image =
                              (x / MediaQuery.of(context).size.width) * 100;
                          var y_image = (y / imageHeight) * 100;
                          _showAddCommentBottomSheet(context, x_image, y_image);
                        },
                        child: Container(
                          color: Helper.widgetBackground,
                          child: data.url != null
                              ? AspectRatio(
                                  aspectRatio:
                                      widget.imageWidth / widget.imageHeight,
                                  child: Image.network(
                                    widget.imageUrl,
                                    gaplessPlayback: true,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
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
                      ),
                      // method to render avatar heads on image
                      ...buildCommentsHead(data.comments!),
                    ],
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
                    // height: MediaQuery.of(context).size.height * 0.7.h,
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
                              'All comments',
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.baseBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.5.h,
                              child: allImageCommentsData.when(
                                data: (allComments) {
                                  if (allComments.comments!.isEmpty) {
                                    return Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16.h);
                                    },
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    controller: _scrollController,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemCount: allComments.comments!.length,
                                    itemBuilder: ((context, index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onLongPress: () {
                                              HapticFeedback.mediumImpact();
                                              user!['role'] == "ADMIN" ||
                                                      user!['_id'] ==
                                                          allComments
                                                              .comments![index]
                                                              .user!
                                                              .userId!
                                                  ? _showImageDeleteBottomSheet(
                                                      context,
                                                      allComments
                                                          .comments![index].id!)
                                                  : null;
                                            },
                                            onTap: () {
                                              ref
                                                  .watch(
                                                      imageCommentsControllerProvider
                                                          .notifier)
                                                  .getImageComments(
                                                      widget.projectId,
                                                      widget.cameraId,
                                                      allComments
                                                          .comments![index]
                                                          .imageName!)
                                                  .then((value) {
                                                setState(() {});
                                              });
                                            },
                                            child: ListTile(
                                              horizontalTitleGap: 8.w,
                                              dense: true,
                                              visualDensity: VisualDensity(
                                                  horizontal: 0, vertical: 0),
                                              contentPadding: EdgeInsets.zero,
                                              leading: AvatarWidget(
                                                dpUrl: allComments
                                                            .comments![index]
                                                            .user!
                                                            .dpUrl !=
                                                        null
                                                    ? allComments
                                                        .comments![index]
                                                        .user!
                                                        .dpUrl!
                                                    : "",
                                                name: allComments
                                                    .comments![index]
                                                    .user!
                                                    .name!,
                                                backgroundColor: allComments
                                                    .comments![index]
                                                    .user!
                                                    .preset!
                                                    .color!,
                                                size: 32,
                                                fontSize: 14,
                                              ),
                                              title: Row(
                                                children: [
                                                  Text(
                                                    allComments.comments![index]
                                                        .user!.name!,
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor600,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "·",
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor600,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    formatTimeDifference(
                                                      allComments
                                                          .comments![index]
                                                          .createdAt!,
                                                      timezone:
                                                          user!['preferences']
                                                              ['timezone'],
                                                    ),
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor600,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              subtitle: ProcessMention(
                                                text: allComments
                                                    .comments![index].message!,
                                              ),
                                            ),
                                          ),
                                          if (index ==
                                              allComments.comments!.length - 1)
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                                error: (err, _) {
                                  return const Text("Failed to load Comments",
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.errorColor));
                                },
                                loading: () => SizedBox(),
                              ),
                            ),
                          ],
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
          return const Text("Failed to load Image Comments",
              style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
        },
        loading: () => LoadingProgresslineDetails(),
      )),
    );
  }

  _showImageDeleteBottomSheet(context, commentId) {
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
                                .deleteImageComment(widget.projectId,
                                    widget.cameraId, commentId)
                                .then((value) {
                              ref
                                  .watch(
                                      imageCommentsControllerProvider.notifier)
                                  .getImageComments(widget.projectId,
                                      widget.cameraId, widget.imageName)
                                  .then((value) {
                                ref
                                    .watch(allImageCommentsControllerProvider
                                        .notifier)
                                    .getAllImageComments(widget.projectId,
                                        widget.cameraId, page);
                              });
                              context.pop();
                              Utils.flushBarErrorMessage(
                                  "Comment Deleted", context);
                            });
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
                Service()
                    .deleteImageComment(
                        widget.projectId, widget.cameraId, commentId)
                    .then((value) {
                  ref
                      .watch(imageCommentsControllerProvider.notifier)
                      .getImageComments(
                          widget.projectId, widget.cameraId, widget.imageName)
                      .then((value) {
                    ref
                        .watch(allImageCommentsControllerProvider.notifier)
                        .getAllImageComments(
                            widget.projectId, widget.cameraId, page);
                  });
                  context.pop();
                  Utils.flushBarErrorMessage("Comment Deleted", context);
                });
              }),
        ],
      ),
    );
  }

  _showAddCommentBottomSheet(context, double x, double y) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 238.h,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Add new comment',
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
                      title: "Comment",
                      formField: FormBuilderTextField(
                        name: '_comment',
                        controller: _commentController,
                        // focusNode: focusNode,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Category is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 14.w),
                          hintText: "Enter comment",
                          hintStyle: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor500,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          // hintText: widget.control.label,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Helper.textColor300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                                color: ref.watch(primaryColorProvider)),
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
                              Map<String, dynamic> data = {
                                "message": _commentController.text,
                                "position": {"x": x, "y": y}
                              };
                              Service()
                                  .addCommentOnImage(widget.projectId,
                                      widget.cameraId, widget.imageName, data)
                                  .then((value) {
                                _commentController.clear();
                                ref
                                    .watch(imageCommentsControllerProvider
                                        .notifier)
                                    .getImageComments(widget.projectId,
                                        widget.cameraId, widget.imageName);
                                ref
                                    .watch(allImageCommentsControllerProvider
                                        .notifier)
                                    .getAllImageComments(widget.projectId,
                                        widget.cameraId, page);

                                context.pop();
                                Utils.toastSuccessMessage(
                                    "Comment Posted", context);
                              });
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                backgroundColor:
                                    ref.watch(primaryColorProvider),
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
        ),
      ),
    );
  }
}
