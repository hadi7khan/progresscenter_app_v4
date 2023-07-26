import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String imgTitle;
  final String adminName;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.imgTitle,
    required this.adminName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.pop();
        }),
        Column(children: [
          Text("Timelapse Camera"),
          Text("17 Jul 2019 - 18 Aug 2019 "),
          
        ],),
        IconButton(icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.pop();
        }),
        
    ],);
    }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}