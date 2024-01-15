import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class RolesScreen extends ConsumerStatefulWidget {
  final roles;
  final assignedRole;
  final Function(String)? onRoleSelection;
  const RolesScreen(
      {super.key, this.roles, this.assignedRole, this.onRoleSelection});

  @override
  ConsumerState<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends ConsumerState<RolesScreen> {
  String? selectedRole;

  @override
  void initState() {
    super.initState();
    if (widget.roles.isNotEmpty) {
      // Set the initially selected role to the first role in the list
      selectedRole = widget.assignedRole.toString().toLowerCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    log("roles passed" + widget.roles.toString());
    return Scaffold(
      backgroundColor: Helper.screenBackground,
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
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Roles",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
              actions: [
                //  Text(
                //     "Save",
                //     style: TextStyle(
                //         color: ref.watch(primaryColorProvider),
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16.sp),
                //   ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final role = widget.roles[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  minVerticalPadding: 0,
                  visualDensity: VisualDensity(vertical: -4),
                  dense: true,
                  title: Text(
                    role,
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor900,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    setState(() {
                      selectedRole = role;
                    });
                    widget.onRoleSelection!(selectedRole!);
                  },
                  trailing: selectedRole!.toLowerCase() ==
                          role.toString().toLowerCase()
                      ? Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Icon(Icons.check,
                              color: ref.watch(primaryColorProvider)),
                        )
                      : null,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.1,
                  color: Helper.textColor700,
                );
              },
              itemCount: widget.roles.length),
        ),
      )),
    );
  }
}
