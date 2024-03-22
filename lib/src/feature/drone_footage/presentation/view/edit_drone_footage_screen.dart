import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/drone_footage_controller.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/edit_drone_footage_controller.dart';

class EditDroneFootageScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String droneId;
  final String name;
  final String location;
  const EditDroneFootageScreen({
    super.key,
    required this.projectId,
    required this.droneId,
    required this.name,
    required this.location,
  });

  @override
  ConsumerState<EditDroneFootageScreen> createState() =>
      _EditDroneFootageScreenState();
}

class _EditDroneFootageScreenState
    extends BaseConsumerState<EditDroneFootageScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool _validate = false;
  bool _changeState = false;
  bool _changeStateLocation = false;

  @override
  void initState() {
    super.initState();
    _locationController.text = widget.location;
    _controller.text = widget.name;

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
                  "Edit Drone Footage",
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
                      ref
                          .read(editDroneFootageControllerProvider.notifier)
                          .editDroneFootage(
                              widget.projectId, widget.droneId, data)
                          .then((value) {
                        ref
                            .watch(droneFootageControllerProvider.notifier)
                            .getDroneFootage(widget.projectId);
                        context.pop();
                        context.pop();
                        Utils.toastSuccessMessage(
                            "Drone Footage updated successfully", context);
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
                    name: 'drone_name',
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
                        return 'This field is required';
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
                      hintText: "Drone name",
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Helper.textColor300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: ref.watch(primaryColorProvider)),
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
                      _changeStateLocation = true;
                    },
                    onSubmitted: (text) {
                      setState(() {
                        _changeStateLocation = true;
                      });
                    },
                    validator: (val) {
                      if (_validate && val == null || val!.isEmpty) {
                        return 'This field is required';
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Helper.textColor300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide:
                            BorderSide(color: ref.watch(primaryColorProvider)),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
