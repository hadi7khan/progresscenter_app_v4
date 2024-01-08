import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AvatarGroupWidget extends StatefulWidget {
  final List<Map<String, dynamic>> avatars;
  final double? max;
  final double? size;
  const AvatarGroupWidget(
      {super.key, required this.avatars, this.max, this.size});

  @override
  State<AvatarGroupWidget> createState() => _AvatarGroupWidgetState();
}

class _AvatarGroupWidgetState extends State<AvatarGroupWidget> {
  int? avatarsLength;
  int? maxCount;
  var displayCount;

  calculateOverlay(index) {
    return index * (widget.size! - 10);
  }

  @override
  void initState() {
    avatarsLength = widget.avatars.length;
    maxCount = widget.max!.round();
    displayCount = min(avatarsLength!, maxCount!);
    if (avatarsLength! > maxCount!) {
      displayCount += 1;
    }
    print("displayCount" + displayCount.toString());
  }

  _getPositionedWidgets() {
    int? index;
    List<Widget> positioned =
        widget.avatars.take(widget.max!.round()).map((avatar) {
      index = widget.avatars.indexOf(avatar);
      return Positioned(
        width: widget.size,
        height: widget.size,
        left: calculateOverlay(index),
        child: AvatarWidget(
          dpUrl: avatar['dpUrl'] != "" ? avatar['dpUrl'] : "",
          name: avatar['name'],
          backgroundColor: avatar['backgroundColor'],
          size: widget.size!,
          fontSize: 14,
        ),
      );
    }).toList();
    if (avatarsLength! > maxCount!) {
      var count = avatarsLength! - maxCount!;
      positioned.add(
        Positioned(
          width: widget.size,
          height: widget.size,
          left: calculateOverlay(widget.max!),
          child: Container(
              width: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Helper.widgetBackground,
              ),
              child: Center(
                child: Text(
                  "+" + count.toString(),
                  style: TextStyle(
                      color: Helper.textColor700,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              )),
        ),
      );
    }
    return positioned;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.avatars.toString());
    return Stack(children: [
      Container(
        color: Colors.transparent,
        width: displayCount * widget.size! - ((displayCount - 1) * 10),
      ),
      ..._getPositionedWidgets()
    ]);
  }
}
