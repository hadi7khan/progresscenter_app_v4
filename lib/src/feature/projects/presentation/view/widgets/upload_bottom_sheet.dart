import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';

class UploadBottomSheet extends ConsumerStatefulWidget {
  final ProjectModel data;
  final Function onChange;
  final String projectId;
  const UploadBottomSheet(
      {super.key,
      required this.data,
      required this.onChange,
      required this.projectId});

  @override
  ConsumerState<UploadBottomSheet> createState() => _UploadBottomSheetState();
}

class _UploadBottomSheetState extends BaseConsumerState<UploadBottomSheet> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  double _progress = 0.0;

  Future _pickImage(ImageSource source) async {
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
    }
  }

  double calculateProgress(double sentBytes) {
    print("sentBytes--------------" + sentBytes.toString());
    setState(() {
      _progress = sentBytes;
    });
    log("ppppp" + _progress.toString());
    return sentBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionSheet(
            title: const Text('Upload Media'),
            // message: const Text('Message'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                child: Text(
                  'Take Photo',
                  style: TextStyle(color: Helper.primary),
                ),
                onPressed: () {
                  _pickImage(ImageSource.camera).then((value) async {
                    await Service()
                        .uploadPhoto(
                            widget.data.id, _image!.path, calculateProgress)
                        .then((value) {
                      widget.onChange(value);
                      ref
                          .read(projectByIdControllerProvider.notifier)
                          .getProjectById(widget.projectId, false);
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Image Uploaded")));
                    });
                  });
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  'Choose Photo',
                  style: TextStyle(color: Helper.primary),
                ),
                onPressed: () {
                  _pickImage(ImageSource.gallery).then((value) async {
                    await Service()
                        .uploadPhoto(
                            widget.data.id, _image!.path, calculateProgress)
                        .then((value) {
                      widget.onChange(value);
                      ref
                          .read(projectByIdControllerProvider.notifier)
                          .getProjectById(widget.projectId, false);
                      context.pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Image Uploaded")));
                    });
                  });
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  'Browse from files',
                  style: TextStyle(color: Helper.primary),
                ),
                onPressed: () {
                  _pickImage(ImageSource.gallery).then((value) async {
                    await Service()
                        .uploadPhoto(
                            widget.data.id, _image!.path, calculateProgress)
                        .then((value) {
                      widget.onChange(value);
                      ref
                          .read(projectByIdControllerProvider.notifier)
                          .getProjectById(widget.projectId, false);
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
              child: Text(
                'Cancel',
                style: TextStyle(color: Helper.errorColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        : BackdropFilter(
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
                                  .uploadPhoto(widget.data.id!, _image!.path,
                                      calculateProgress)
                                  .then((value) {
                                widget.onChange(value);
                                ref
                                    .read(
                                        projectByIdControllerProvider.notifier)
                                    .getProjectById(widget.projectId, false);
                                ref
                                    .read(projectControllerProvider.notifier)
                                    .getProjects()
                                    .then((value) {});
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
                                  .uploadPhoto(widget.data.id, _image!.path,
                                      calculateProgress)
                                  .then((value) {
                                widget.onChange(value);
                                ref
                                    .read(
                                        projectByIdControllerProvider.notifier)
                                    .getProjectById(widget.projectId, false);
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
                                  .uploadPhoto(widget.data.id, _image!.path,
                                      calculateProgress)
                                  .then((value) {
                                widget.onChange(value);
                                ref
                                    .read(
                                        projectByIdControllerProvider.notifier)
                                    .getProjectById(widget.projectId, false);
                                ref
                                    .read(projectControllerProvider.notifier)
                                    .getProjects()
                                    .then((value) {});
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
                                  fontSize: 16.sp,
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
          );
  }
}
