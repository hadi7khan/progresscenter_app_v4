import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/image_comments_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/all_image_comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/image_comments_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/camera_comments_widget.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/process_mention_widget.dart';
import 'dart:developer' as dev;

class ImageCommentsScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String imageName;
  final int imageHeight;
  final int imageWidth;
  const ImageCommentsScreen({
    super.key,
    required this.projectId,
    required this.cameraId,
    required this.imageName,
    required this.imageHeight,
    required this.imageWidth,
  });

  @override
  ConsumerState<ImageCommentsScreen> createState() =>
      _ImageCommentsScreenState();
}

class _ImageCommentsScreenState extends BaseConsumerState<ImageCommentsScreen> {
  TextEditingController _commentController = TextEditingController();
  var aspectRatio;
  var imageHeight;
  int page = 0;
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
          .getAllImageComments(widget.projectId, widget.cameraId, page);
    });
    fetchUser();
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  buildCommentsHead(List<model.Comment> comments) {
    return comments.map((e) {
      var x = (e.position!.x! / 100) * MediaQuery.of(context).size.width;
      aspectRatio = widget.imageWidth / widget.imageHeight;
      imageHeight = MediaQuery.of(context).size.width / aspectRatio;
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
              size: 20,
              fontSize: 12,
            ),
          ));
    }).toList();
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
                      widget.projectId, widget.cameraId, widget.imageName);
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
                                    data.url!,
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
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 16.h);
                                    },
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    // controller: _commentController,
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
                                              title: Text(
                                                allComments.comments![index]
                                                    .user!.name!,
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.textColor600,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              subtitle: ProcessMention(
                                                text: allComments
                                                    .comments![index].message!,
                                              ),
                                            ),
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
                                      widget.cameraId, widget.imageName);
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
                          widget.projectId, widget.cameraId, widget.imageName);
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
