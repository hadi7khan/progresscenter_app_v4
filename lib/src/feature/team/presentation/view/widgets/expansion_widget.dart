import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ExpansionWidget extends StatefulWidget {
  final index;
  final selected;
  final Widget mainListTile;
  final Widget children;
  final hasChildren;
  final Function onSelectedChange;

  const ExpansionWidget(
      {super.key,
      this.index,
      this.selected,
      required this.mainListTile,
      required this.children,
      this.hasChildren,
      required this.onSelectedChange});

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  ExpansionTileController controller = ExpansionTileController();
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        key: Key(widget.index.toString()),
        controller: controller,
        // initiallyExpanded: isExpanded,
        backgroundColor:
            isExpanded ? Helper.widgetBackground : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        tilePadding: EdgeInsets.zero,
        trailing: Switch.adaptive(
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            inactiveTrackColor: Color.fromRGBO(120, 120, 128, 0.16),
            activeTrackColor: Helper.switchActiveColor,
            thumbColor: MaterialStateProperty.all(Colors.white),
            // splashRadius: 10,
            value: widget.selected,
            onChanged: (value) {
              if (widget.hasChildren &&
                  !controller.isExpanded &&
                  !widget.selected) {
                // _tileController.
                log(widget.hasChildren.toString());
                setState(() {
                  controller.expand();
                });

                return;
              } else {
                // setState(() {
                //   switchValues[project.projectId] = value;
                // });

                widget.onSelectedChange(value);
              }
              // setState(() {
              //   switchValues[project.projectId] = value;
              // });

              // var values =
              //     projectHierarchySelection!.changeSelected(project, value);
              // print("valueeeeee" + values.toString());
            }
            // setState(() {
            //   switchValues[project.projectId] = value;
            // });
            // var values =
            //     projectHierarchySelection!.changeSelected(project, value);
            // print("valueeeeee" + values.toString());
            // },
            ),
        // trailing: projectHierarchySelection!.hasChildren(project.projectId)
        //     ? SvgPicture.asset(
        //         'assets/images/chevron-down.svg',
        //         color: Helper.baseBlack.withOpacity(0.2),
        //         width: 24.w,
        //       )
        //     : SizedBox(
        //         width: 24.w,
        //       ),
        title: widget.mainListTile,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: widget.children,
          ),
        ],
        onExpansionChanged: (bool expanding) {
          // setState(() {
          //   expandFlag = expanding;
          // });

          log("expanded" + expanding.toString());
          setState(() => isExpanded = expanding);
        });
  }
}
