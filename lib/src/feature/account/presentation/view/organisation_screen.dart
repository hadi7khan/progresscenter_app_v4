import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/provider/organisation_controller.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/camera_view_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/full_screen_preview.dart';
import 'dart:developer';

import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class OrganisationScreen extends ConsumerStatefulWidget {
  const OrganisationScreen({super.key});

  @override
  ConsumerState<OrganisationScreen> createState() => _OrganisationScreenState();
}

class _OrganisationScreenState extends BaseConsumerState<OrganisationScreen> {
  TextEditingController _organisationNameController = TextEditingController();
  bool _isOrganisationNameEditing = false;
  FocusNode _organisationNameNode = FocusNode();
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isRecording = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> initCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    // Initialize the first camera in the list (you can choose based on your requirements)
    CameraController controller =
        CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
    // Set the controller to your state
    setState(() {
      _controller = controller;
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(organisationControllerProvider.notifier)
          .getOrganisation()
          .then((value) {
        _organisationNameController.text = value.name;
      });
    });
  }

  Future<void> _takePhoto() async {
    try {
      XFile photo = await _controller!.takePicture();
      // Handle the captured photo (e.g., display it, save it, etc.)
      _showFullScreenPhotoPreview(photo);
    } catch (e) {
      print("Error taking photo: $e");
    }
  }

  void _showFullScreenPhotoPreview(XFile photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenPreview(
          file: File(photo.path),
          onSave: () {
            // Implement save logic or any other action you want to perform
            Navigator.pop(context);
            log("path" + photo.path.toString()); // Close the preview screen
          },
        ),
      ),
    );
  }

  Future<void> _toggleVideoRecording() async {
    if (_isRecording) {
      // Stop recording
      await _controller!.stopVideoRecording();
      // Handle the captured video (e.g., display it, save it, etc.)
    } else {
      // Start recording
      await _controller!.startVideoRecording();
    }
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _image = file;
      });
      print("image path" + _image!.path.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final organisationData = ref.watch(
        organisationControllerProvider.select((value) => value.organisation));
    return GestureDetector(
        onTap: () {
          setState(() {
            _isOrganisationNameEditing = false;
          });
        },
        child: organisationData.when(
          data: (data) {
            return Scaffold(
              backgroundColor: Helper.widgetBackground,
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
                          child: SvgPicture.asset(
                              'assets/images/chevron-right.svg',
                              color: Helper.iconColor,
                              fit: BoxFit.contain),
                        ),
                      ),
                      leadingWidth: 24,
                      title: Text(
                        "Organisation",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isOrganisationNameEditing = false;
                            });
                            Map<String, dynamic> org = {
                              "name": _organisationNameController.text,
                              "domain": data.domain,
                            };

                            Service().organisationChange(org).then((val) {
                              ref
                                  .watch(
                                      organisationControllerProvider.notifier)
                                  .getOrganisation();
                              Utils.toastSuccessMessage("Organisation updated");
                            });
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: ref.watch(primaryColorProvider),
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                  child: RefreshIndicator(
                displacement: 10.0,
                color: ref.watch(primaryColorProvider),
                onRefresh: () async {
                  HapticFeedback.mediumImpact();
                  return await ref
                      .refresh(organisationControllerProvider.notifier)
                      .getOrganisation();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              _showBottomSheet(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CameraViewScreen(
                              //       takePhoto: _takePhoto,
                              //       toggleVideoRecording: _toggleVideoRecording,
                              //       cameraController: _controller,
                              //       isRecording: _isRecording,
                              //     ),
                              //   ),
                              // );
                            },
                            onLongPress: () {
                              _showDeleteBottomSheet(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AvatarWidget(
                                    dpUrl: data.logoUrl != null
                                        ? data.logoUrl!
                                        : "",
                                    name: data.name!,
                                    backgroundColor:
                                        data.preferences!.primaryColor!,
                                    size: 50,
                                    fontSize: 24,
                                  ),
                                  SizedBox(width: 10.h),
                                  Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      Text(
                                        data.name!,
                                        style: TextStyle(
                                            height: 1.1,
                                            letterSpacing: -0.3,
                                            color: Helper.baseBlack,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 20.h),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   padding: EdgeInsets.all(16.w),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(16.r),
                          //     color: Colors.white,
                          //   ),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       AvatarWidget(
                          //         dpUrl: data.emailHeaderLogoUrl != null
                          //             ? data.emailHeaderLogoUrl!
                          //             : "",
                          //         name: data.name!,
                          //         backgroundColor: data.preferences!.primaryColor!,
                          //         size: 50,
                          //         fontSize: 24,
                          //       ),
                          //       SizedBox(width: 10.h),
                          //       Wrap(
                          //         direction: Axis.vertical,
                          //         children: [
                          //           Text(
                          //             "Email Header",
                          //             style: TextStyle(
                          //                 height: 1.1,
                          //                 letterSpacing: -0.3,
                          //                 color: Helper.baseBlack,
                          //                 fontSize: 18.sp,
                          //                 fontWeight: FontWeight.w600),
                          //           ),

                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "INFORMATION",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor500,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 16.w, top: 12.h, bottom: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isOrganisationNameEditing = true;
                                          _organisationNameNode.requestFocus();
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Organisation Name",
                                            style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.3,
                                                color: Helper.textColor700,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          !_isOrganisationNameEditing
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 16.w,
                                                  ),
                                                  child: Text(
                                                    _organisationNameController
                                                            .text.isNotEmpty
                                                        ? _organisationNameController
                                                            .text
                                                        : data.name!,
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor900,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: 35.h,
                                                  child: FormBuilderTextField(
                                                    name: 'nameEdit',
                                                    controller:
                                                        _organisationNameController,
                                                    textAlign: TextAlign.end,
                                                    focusNode:
                                                        _organisationNameNode,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.h,
                                                              horizontal: 14.w),
                                                      hintText: "",
                                                      hintStyle: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor500,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ),
                                        ],
                                      )),
                                  Divider(
                                    thickness: 0.1,
                                    color: Helper.textColor700,
                                  ),
                                  // SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      context.push("/organisationUrl");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Organisation URL",
                                          style: TextStyle(
                                              fontSize: 14,
                                              letterSpacing: -0.3,
                                              color: Helper.textColor700,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: 16.w,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                data.domain != null
                                                    ? data.domain!
                                                    : "-",
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.textColor900,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(width: 5.w),
                                              SvgPicture.asset(
                                                'assets/images/chevron-right.svg',
                                                color: Helper.iconColor,
                                                fit: BoxFit.contain,
                                                height: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "COLOR CONFIGURATION",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor500,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: 16.w, top: 12.h, bottom: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Current Theme",
                                            style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.3,
                                                color: Helper.textColor700,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 16.w,
                                            ),
                                            child: Text(
                                              data.preferences!.primaryColor!,
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor900,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            );
          },
          error: (err, _) {
            return const Text("Failed to load organisation",
                style:
                    TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
          },
          loading: () => LoadingUserProfile(),
        ));
  }

  _showDeleteBottomSheet(context) {
    // todo : showDialog for ios

    if (!Platform.isIOS) {
      return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
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
                      "Are you sure you want to delete this image? ",
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
                              Service().deleteOrganisationLogo().then((value) {
                                ref
                                    .read(
                                        organisationControllerProvider.notifier)
                                    .getOrganisation();
                                context.pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text("Image Deleted")));
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
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Do you want to delete this image?',
        ),
        content: Text(
          "You cannot undo this action ",
        ),
        actions: <Widget>[
          // if (cancelActionText != null)

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
                Service().deleteOrganisationLogo().then((value) {
                  ref
                      .read(organisationControllerProvider.notifier)
                      .getOrganisation();
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Image Deleted")));
                });
                setState(() {});
              }),
        ],
      ),
    );
  }

  _showBottomSheet(context) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text('Upload Media'),
          // message: const Text('Message'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Take Photo'),
              onPressed: () {
                _pickImage(ImageSource.camera).then((value) async {
                  await Service()
                      .uploadOrganisationLogo(_image!.path)
                      .then((value) {
                    ref
                        .read(organisationControllerProvider.notifier)
                        .getOrganisation();
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Image Uploaded")));
                  });
                });
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                'Choose Photo',
              ),
              onPressed: () {
                _pickImage(ImageSource.gallery).then((value) async {
                  await await Service()
                      .uploadOrganisationLogo(_image!.path)
                      .then((value) {
                    ref
                        .read(organisationControllerProvider.notifier)
                        .getOrganisation();
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Image Uploaded")));
                  });
                });
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                'Browse from files',
              ),
              onPressed: () {
                _pickImage(ImageSource.gallery).then((value) async {
                  await Service()
                      .uploadOrganisationLogo(_image!.path)
                      .then((value) {
                    ref
                        .read(organisationControllerProvider.notifier)
                        .getOrganisation();
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Image Uploaded")));
                  });
                });
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            height: 340.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Media',
                      style: TextStyle(
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
                    InkWell(
                      onTap: () async {
                        _pickImage(ImageSource.camera).then((value) async {
                          await Service()
                              .uploadOrganisationLogo(_image!.path)
                              .then((value) {
                            ref
                                .read(organisationControllerProvider.notifier)
                                .getOrganisation();
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Image Uploaded")));
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Take Photo',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pop();
                        _pickImage(ImageSource.gallery).then((value) async {
                          await await Service()
                              .uploadOrganisationLogo(_image!.path)
                              .then((value) {
                            ref
                                .read(organisationControllerProvider.notifier)
                                .getOrganisation();
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Image Uploaded")));
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Choose Photo',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _pickImage(ImageSource.gallery).then((value) async {
                          await Service()
                              .uploadOrganisationLogo(
                            _image!.path,
                          )
                              .then((value) {
                            ref
                                .read(organisationControllerProvider.notifier)
                                .getOrganisation();
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Image Uploaded")));
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Browse from files',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          // currentIndex == contents.length - 1 ? "Continue" : "Next"
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Helper.baseBlack),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            )),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
