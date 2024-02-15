import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/upload_bottom_sheet.dart';

class EditProjectScreen extends ConsumerStatefulWidget {
  final ProjectModel data;
  const EditProjectScreen({super.key, required this.data});

  @override
  ConsumerState<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends BaseConsumerState<EditProjectScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _changeState = false;
  bool _changeStateLocation = false;
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool _validate = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  var color;
  bool _isSelected = false;
  double _progress = 0.0;
  PersistentBottomSheetController? _bottomSheetController;
  List<Map<String, String>> imageUrls = [];

  double calculateProgress(double sentBytes) {
    print("sentBytes--------------" + sentBytes.toString());
    setState(() {
      _progress = sentBytes;
    });
    log("ppppp" + _progress.toString());
    return sentBytes;
  }

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

  @override
  void initState() {
    super.initState();
    _locationController.text = widget.data.location!.name!;
    _controller.text = widget.data.name!;
    for (int i = 0; i < widget.data.images!.length; i++) {
      imageUrls.add({
        "id": widget.data.images![i].imageId!,
        "url": widget.data.images![i].url!
      });
    }
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          _validate = true;
        });
      }
    });
    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        setState(() {
          _validate = true;
        });
      }
    });
  }

// method to get background color of avatar
  _getColor(
    String color,
  ) {
    color = "0xFF" + color.replaceAll("#", "");
    return Color(int.parse(color));
  }

//method to get initials of name passed
  _getNameInitials(String name) {
    var buffer = StringBuffer();
    var split = name.split(' ');
    for (var i = 0; i < 1; i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

//method to show carousels
  _getChildren(images) {
    List<Widget> carouselChildren = imageUrls.map((e) {
      var index = imageUrls.indexOf(e);
      return InkWell(
          onLongPress: () {
            _showDeleteBottomSheet(
                context, widget.data.id, images[index]["id"]);
          },
          child: Stack(children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Helper.widgetBackground,
                    borderRadius: BorderRadius.circular(12.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(images[index]["url"],
                      gaplessPlayback: true, fit: BoxFit.fill),
                )),
            Container(
              decoration: BoxDecoration(
                  color: Helper.baseBlack.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r)),
            ),
            Center(
              child: SvgPicture.asset('assets/images/image-x.svg'),
            ),
          ]));
    }).toList();
    if (carouselChildren.length < 4) {
      carouselChildren.add(InkWell(
        onTap: () {
          // _showBottomSheet(context, widget.data.id!, _progress);
          if (Platform.isIOS) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return UploadBottomSheet(
                    data: widget.data,
                    onChange: (value) {
                      imageUrls = [];
                      setState(() {
                        imageUrls.addAll(value);
                      });
                    },
                    projectId: widget.data.id,
                  );
                });
          }
          if (Platform.isAndroid) {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return UploadBottomSheet(
                    data: widget.data,
                    onChange: (value) {
                      imageUrls = [];
                      setState(() {
                        imageUrls.addAll(value);
                      });
                    },
                    projectId: widget.data.id,
                  );
                });
          }
        },
        child: DottedBorder(
          color: Helper.baseBlack.withOpacity(0.15), //color of dotted/dash line
          strokeWidth: 3, //thickness of dash/dots
          padding: EdgeInsets.zero,
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          dashPattern: [6, 6],
          child: Container(
              // height: 90.h,
              // width: double.infinity,
              decoration: BoxDecoration(
                  color: Helper.widgetBackground,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Center(
                child: SvgPicture.asset('assets/images/image-plus.svg'),
              )),
        ),
      ));
    }
    return carouselChildren;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: AppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                centerTitle: false,
                automaticallyImplyLeading: false,
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
                  "Edit project",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Map<String, dynamic> data = {
                        "name": _controller.text,
                        "location": {"name": _locationController.text}
                      };
                      Service().editProject(widget.data.id, data).then((value) {
                        ref
                            .read(projectControllerProvider.notifier)
                            .getProjects();
                        ref
                            .read(projectByIdControllerProvider.notifier)
                            .getProjectById(widget.data.id, false);
                        context.pop();
                        Utils.toastSuccessMessage(
                            "Your project details have been saved", context);
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
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: FormBuilder(
              key: _fbKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Name",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6.h),
                    FormBuilderTextField(
                      name: 'project_name',
                      controller: _controller,
                      // initialValue: widget.data.projectName,
                      focusNode: focusNode,
                      onChanged: (text) {
                        setState(() {});
                        _changeState = true;
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _changeState = true;
                        });
                      },
                      validator: (val) {
                        if (_validate && val == null || val!.isEmpty) {
                          return 'Project name is required';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Project name",
                        hintStyle: TextStyle(
                          color: Helper.textColor500,
                          letterSpacing: -0.3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: _controller.text.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                      _changeState = false;
                                    });
                                  },
                                ),
                              )
                            : SizedBox(),
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
                    SizedBox(height: 28.h),
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6.h),
                    FormBuilderTextField(
                      name: 'location',
                      controller: _locationController,
                      focusNode: focusNode1,
                      // initialValue: widget.data.location!.name,
                      onChanged: (text) {
                        setState(() {});
                        _changeStateLocation = true;
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _changeStateLocation = true;
                        });
                      },
                      validator: (val) {
                        if (_validate && val == null || val!.isEmpty) {
                          return 'Location is required';
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
                        hintText: "Location",
                        hintStyle: TextStyle(
                          color: Helper.textColor500,
                          letterSpacing: -0.3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: _controller.text.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _locationController.clear();
                                      _changeStateLocation = false;
                                    });
                                  },
                                ),
                              )
                            : SizedBox(),
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
                    SizedBox(height: 28.h),
                    Text(
                      "Carousel",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12.h),
                    GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing: 15.w,
                        childAspectRatio: 16 / 9,
                        padding: const EdgeInsets.all(4),
                        children: _getChildren(imageUrls)),
                    SizedBox(height: 28.h),
                  ]),
            ),
          ),
        )),
      ),
    );
  }

  _showBottomSheet(context, id, progress) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return CupertinoActionSheet(
              title: const Text('Upload Media'),
              // message: const Text('Message'),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  child: Row(children: [
                    Icon(
                      CupertinoIcons.camera,
                      color: Helper.primary,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(color: Helper.primary),
                    ),
                  ]),
                  onPressed: () {
                    _pickImage(ImageSource.camera).then((value) async {
                      await Service()
                          .uploadPhoto(
                              widget.data.id!, _image!.path, calculateProgress)
                          .then((value) {
                        setState(() {
                          _progress = progress;
                          print("progress" + _progress.toString());
                        });
                        log("value" + value.toString());
                        context.pop();
                        Utils.toastSuccessMessage("Image Uploaded", context);
                      });
                    });
                  },
                ),
                CupertinoActionSheetAction(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        color: Helper.primary,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Choose Photo',
                        style: TextStyle(color: Helper.primary),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _pickImage(ImageSource.gallery).then((value) async {
                      await Service()
                          .uploadPhoto(
                              widget.data.id!, _image!.path, calculateProgress)
                          .then((value) {
                        log("imageUrls before" + imageUrls.toString());
                        imageUrls = [];
                        log("value" + value.toString());
                        setState(() {
                          imageUrls.addAll(value);
                        });

                        log("imageUrls after" + imageUrls.toString());
                        context.pop();
                        Utils.toastSuccessMessage("Image Uploaded", context);
                      });

                      // setState(() {
                      //   _progress = progress;
                      //   print("progress" + _progress.toString());
                      // });
                    });
                  },
                ),
                CupertinoActionSheetAction(
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.doc,
                        color: Helper.primary,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Browse from files',
                        style: TextStyle(color: Helper.primary),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _pickImage(ImageSource.gallery).then((value) async {
                      await Service()
                          .uploadPhoto(
                              widget.data.id!, _image!.path, calculateProgress)
                          .then((value) {
                        setState(() {
                          _progress = progress;
                          print("progress" + _progress.toString());
                        });
                        print("progress" + _progress.toString());
                        context.pop();
                        Utils.toastSuccessMessage("Image Uploaded", context);
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
            );
          },
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
                        // calculateProgress(0);
                        _pickImage(ImageSource.camera).then((value) async {
                          await Service()
                              .uploadPhoto(widget.data.id!, _image!.path,
                                  calculateProgress)
                              .then((value) {
                            setState(() {
                              _progress = progress;
                              log("progress" + _progress.toString());
                            });
                            log("progress" + _progress.toString());
                            context.pop();
                            _showProgressBottomSheet(context);
                            Utils.toastSuccessMessage(
                                "Image Uploaded", context);
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
                              .uploadPhoto(widget.data.id!, _image!.path,
                                  calculateProgress)
                              .then((value) {
                            setState(() {
                              _progress = progress;
                              print("progress" + _progress.toString());
                            });
                            print("progress" + _progress.toString());
                            // _showProgressBottomSheet(cntx);

                            // context.pop();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         backgroundColor: Colors.green,
                            //         content: Text("Image Uploaded")));
                          });
                          _showDeleteBottomSheet(
                              context, "projectId", "imageId");
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
                              .uploadPhoto(widget.data.id!, _image!.path,
                                  calculateProgress)
                              .then((value) {
                            setState(() {
                              _progress = progress;
                              print("progress" + _progress.toString());
                            });
                            context.pop();
                            _showProgressBottomSheet(context);
                            Utils.toastSuccessMessage(
                                "Image Uploaded", context);
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
                            backgroundColor: MaterialStatePropertyAll(
                                _changeState
                                    ? ref.watch(primaryColorProvider)
                                    : Helper.baseBlack),
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

  _showProgressBottomSheet(cntx) async {
    _bottomSheetController =
        await Scaffold.of(cntx).showBottomSheet((BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 270.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Uploading Image',
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    isThreeLine: true,
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 240, 255, 1),
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(
                              color: Color.fromRGBO(245, 249, 255, 1),
                              width: 4.w)),
                      child: SvgPicture.asset(
                        'assets/images/film.svg',
                      ),
                    ),
                    title: Text(
                      "Image",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Uploading",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: LinearPercentIndicator(
                                      width: 210.w,
                                      fillColor: Helper.textColor300,
                                      backgroundColor: Helper.textColor300,
                                      progressColor:
                                          ref.watch(primaryColorProvider),
                                      padding: EdgeInsets.zero,
                                      curve: Curves.easeInOut,
                                      barRadius: Radius.circular(4.r),
                                      lineHeight: 8.h,
                                      percent: _progress),
                                ),
                                //             Text(
                                //               "${(_progressBar).toInt()}%",
                                //               style: TextStyle(
                                // letterSpacing: -0.3,
                                //                   color: Helper.textColor700,
                                //                   fontSize: 14,
                                //                   fontWeight: FontWeight.w500),
                                //             )
                              ])
                        ]),
                    trailing: calculateProgress == 100.0
                        ? SvgPicture.asset(
                            'assets/images/checkbox_base.svg',
                          )
                        : SizedBox(),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 52.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Close",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
        ),
      );
    });
  }

  _showDeleteBottomSheet(context, projectId, imageId) {
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
                              Service()
                                  .deleteImage(projectId, imageId)
                                  .then((value) {
                                context.pop();
                                Utils.flushBarErrorMessage(
                                    "Image Deleted", context);
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
                Service().deleteImage(projectId, imageId).then((value) {
                  context.pop();
                  Utils.flushBarErrorMessage("Image Deleted", context);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }
}
