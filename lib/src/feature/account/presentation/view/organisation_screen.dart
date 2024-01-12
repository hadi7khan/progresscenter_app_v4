import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/provider/organisation_controller.dart';

class OrganisationScreen extends ConsumerStatefulWidget {
  const OrganisationScreen({super.key});

  @override
  ConsumerState<OrganisationScreen> createState() => _OrganisationScreenState();
}

class _OrganisationScreenState extends BaseConsumerState<OrganisationScreen> {
  TextEditingController _organisationNameController = TextEditingController();
  bool _isOrganisationNameEditing = false;
  FocusNode _organisationNameNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(organisationControllerProvider.notifier)
          .getOrganisation()
          .then((value) {
        _organisationNameController.text = value.name;
      });
    });
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
                                color: Helper.primary,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                              dpUrl: data.logoUrl != null ? data.logoUrl! : "",
                              name: data.name!,
                              backgroundColor: data.preferences!.primaryColor!,
                              size: 50,
                              fontSize: 24,
                            ),
                            SizedBox(width: 10.h),
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  "Organisation Logo",
                                  style: TextStyle(
                                      height: 1.1,
                                      letterSpacing: -0.3,
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Text(
                                //   data.designation != null
                                //       ? data.designation!
                                //       : "-",
                                //   style: TextStyle(
                                //       letterSpacing: -0.3,
                                //       color:
                                //           Helper.baseBlack.withOpacity(0.5),
                                //       fontSize: 14.sp,
                                //       fontWeight: FontWeight.w400),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
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
                              dpUrl: data.emailHeaderLogoUrl != null
                                  ? data.emailHeaderLogoUrl!
                                  : "",
                              name: data.name!,
                              backgroundColor: data.preferences!.primaryColor!,
                              size: 50,
                              fontSize: 24,
                            ),
                            SizedBox(width: 10.h),
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  "Email Header",
                                  style: TextStyle(
                                      height: 1.1,
                                      letterSpacing: -0.3,
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                // Text(
                                //   data.designation != null
                                //       ? data.designation!
                                //       : "-",
                                //   style: TextStyle(
                                //       letterSpacing: -0.3,
                                //       color:
                                //           Helper.baseBlack.withOpacity(0.5),
                                //       fontSize: 14.sp,
                                //       fontWeight: FontWeight.w400),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
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
                                                    color: Helper.textColor900,
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
                                                  fontWeight: FontWeight.w500,
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
                                                    color: Helper.textColor500,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
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
                                      "Organisation Url",
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
                                                fontWeight: FontWeight.w500),
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
}
