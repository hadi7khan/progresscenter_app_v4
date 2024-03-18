import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/add_vimeo_video_controller.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/drone_footage_controller.dart';

class AddVimeoVideoScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const AddVimeoVideoScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<AddVimeoVideoScreen> createState() =>
      _AddVimeoVideoScreenState();
}

class _AddVimeoVideoScreenState extends BaseConsumerState<AddVimeoVideoScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  // Regular expression for a Vimeo link
  RegExp regExp = RegExp(
    r'^https?:\/\/(www\.|player\.)?vimeo\.com\/(?:channels\/(?:\w+\/)?|groups\/([^/]*)\/videos\/|video\/|)(\d+)(?:|\/\?)',
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Add Drone Footage",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You can add one drone video at a time from here",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Helper.textColor600),
                      ),
                      SizedBox(height: 20.h),
                      CustomInputWidget(
                        title: "Name",
                        formField: FormBuilderTextField(
                          name: '_name',
                          controller: _nameController,
                          // focusNode: focusNode,

                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Name is required';
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
                            hintText: "Enter name",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: widget.control.label,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
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
                      SizedBox(height: 12.h),
                      CustomInputWidget(
                        title: "Location",
                        formField: FormBuilderTextField(
                          name: '_location',
                          controller: _locationController,
                          // focusNode: focusNode,

                          validator: (val) {
                            if (val == null || val.isEmpty) {
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
                            hintText: "Enter location",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: widget.control.label,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
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
                      SizedBox(height: 12.h),
                      CustomInputWidget(
                        title: "Vimeo Url",
                        formField: FormBuilderTextField(
                          name: '_url',
                          controller: _urlController,
                          // focusNode: focusNode,

                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Url is required';
                            }
                            if (!regExp.hasMatch(val)) {
                              return 'Enter a valid Vimeo URL';
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
                            hintText: "Enter url",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            // hintText: widget.control.label,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
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
                      SizedBox(height: 12.h),
                    ]),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: Colors.white,
          alignment: Alignment.center,
          height: 76.h,
          child: Container(
            height: 52.h,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.pop();
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
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
                        "name": _nameController.text,
                        "details": {
                          "provider": "VIMEO",
                        },
                        "location": {
                          "name": _locationController.text,
                        },
                        "url": _urlController.text
                      };
                      if (_fbKey.currentState!.saveAndValidate()) {
                        await ref
                            .watch(addVimeoVideoControllerProvider.notifier)
                            .addVimeoVideo(widget.projectId, data)
                            .then((value) async {
                          value.fold((failure) {}, (res) {});
                          context.pop();
                          Utils.toastSuccessMessage(
                              "Drone Footage added", context);
                          ref
                              .watch(droneFootageControllerProvider.notifier)
                              .getDroneFootage(widget.projectId);
                          context.pop();
                          // setState(() {
                          //   _isLoading = false;
                          // });
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        backgroundColor: ref.watch(primaryColorProvider),
                        side: BorderSide(color: Helper.textColor300),
                        fixedSize: Size.infinite),
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
