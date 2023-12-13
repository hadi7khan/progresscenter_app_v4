import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart'
    as model;

class EditProjectScreen extends StatefulWidget {
  final model.ProjectModel data;
  const EditProjectScreen({super.key, required this.data});

  @override
  State<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends State<EditProjectScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _dialogKey = GlobalKey<FormBuilderState>();
  bool _changeState = false;
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool _validate = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  var color;
  bool _isSelected = false;
  double _progress = 0.0;

  calculateProgress(double sentBytes) {
    print("sentBytes--------------" + sentBytes.toString());
    return sentBytes;
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
  void initState() {
    super.initState();

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
  _getChildren() {
    List<Widget> carouselChildren = widget.data.images!.map((e) {
      var index = widget.data.images!.indexOf(e);
      print("image id" + widget.data.images![index].id.toString());
      return InkWell(
          onLongPress: () {
            _showDeleteBottomSheet(
                context, widget.data.id!, widget.data.images![index].id);
          },
          child: Stack(children: [
            Container(
                // height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: NetworkImage(
                    //         widget.data.images![index].url!),
                    //     fit: BoxFit.cover),
                    color: Helper.widgetBackground,
                    borderRadius: BorderRadius.circular(12.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(widget.data.images![index].url!,
                      fit: BoxFit.fill),
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
          _showBottomSheet(context, widget.data.id!, _progress);
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
    print(widget.data.toString());
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
                automaticallyImplyLeading: false,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/images/arrow-left.svg',
                  ),
                ),
                leadingWidth: 24,
                title: Text(
                  "Edit project",
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Container(
                    //       height: 24.h,
                    //       child: IconButton(
                    //         padding: EdgeInsets.zero,
                    //         alignment: Alignment.centerLeft,
                    //         icon: Icon(
                    //           Icons.arrow_back,
                    //         ),
                    //         onPressed: () => context.pop(),
                    //       ),
                    //     ),
                    //     SizedBox(width: 8.w),
                    //     Center(
                    //       child: Text(
                    //         "Edit project",
                    //         style: TextStyle(
                    //             color: Helper.baseBlack,
                    //             fontSize: 18.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(height: 24.h),
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
                          return 'Location is required';
                        }
                        return null;
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Location",
                        hintStyle: TextStyle(
                          color: Helper.textColor500,
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
                        children: _getChildren()),
                    SizedBox(height: 28.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Members · " + widget.data.users!.length.toString(),
                            style: TextStyle(
                                color: Helper.textColor700,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            onTap: () {
                              context.push('/addmember',
                                  extra: {"projectId": widget.data.id});
                            },
                            child: Text(
                              "Add members",
                              style: TextStyle(
                                  color: Helper.blueDark,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                    SizedBox(height: 12.h),
                    ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.h);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.data.users!.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Helper.widgetBackground,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: ListTile(
                            leading: AvatarWidget(
                              dpUrl: widget.data.users![index].dp != null
                                  ? widget.data.users![index].dpUrl
                                  : "",
                              name: widget.data.users![index].name!,
                              size: 32.h,
                              backgroundColor:
                                  widget.data.users![index].preset!.color!,
                            ),
                            title: Text(
                              widget.data.users![index].name!,
                              style: TextStyle(
                                  color: Helper.textColor700,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              widget.data.users![index].email!,
                              style: TextStyle(
                                  color: Helper.textColor600,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: InkWell(
                                radius: 20,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return FormBuilder(
                                        key: _dialogKey,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.r),
                                          ),
                                          content: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text:
                                                          "Are you sure you want to remove ",
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Helper
                                                              .textColor500),
                                                      children: [
                                                        TextSpan(
                                                          text: '\"' +
                                                              widget
                                                                  .data
                                                                  .users![index]
                                                                  .name! +
                                                              '\"',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Helper
                                                                  .baseBlack),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' from this project?',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Helper
                                                                  .textColor500),
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
                                                    .revokeMember(
                                                        widget.data.id,
                                                        widget.data
                                                            .users![index].id)
                                                    .then((value) {
                                                  context.pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              "Member Revoked")));
                                                });
                                                setState(() {});
                                              },
                                              style: TextButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 11),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  backgroundColor:
                                                      Helper.errorColor,
                                                  fixedSize: Size.infinite),
                                              child: const Text(
                                                "Remove",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 11),
                                                  backgroundColor: Colors.white,
                                                  side: BorderSide(
                                                      color:
                                                          Helper.textColor300),
                                                  fixedSize: Size.infinite),
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Helper.textColor500,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                        ),
                                      );
                                    }),
                                  );
                                },
                                child: SvgPicture.asset(
                                    width: 15,
                                    height: 15,
                                    'assets/images/close-x.svg')),
                          ),
                        );
                      }),
                    ),
                  ]),
            ),
          ),
        )),
      ),
    );
  }

  _showBottomSheet(context, id, progress) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
                                print("progress" + _progress.toString());
                              });
                              print("progress" + _progress.toString());
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
                                .uploadPhoto(widget.data.id!, _image!.path,
                                    calculateProgress)
                                .then((value) {
                              setState(() {
                                _progress = progress;
                                print("progress" + _progress.toString());
                              });
                              print("progress" + _progress.toString());
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
                              backgroundColor: MaterialStatePropertyAll(
                                  _changeState
                                      ? Helper.primary
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
            )
          ],
        ),
      ),
    );
  }

  _showDeleteBottomSheet(context, projectId, imageId) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
