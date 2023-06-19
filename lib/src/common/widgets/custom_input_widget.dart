import 'package:flutter/material.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class CustomInputWidget extends StatelessWidget {
  final String title;
  final Widget formField;
  const CustomInputWidget({
    super.key,
    required this.title,
    required this.formField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: Helper.textColor500,
                fontWeight: FontWeight.w400),
          ),
        ),
        formField
      ],
    );
  }
}
