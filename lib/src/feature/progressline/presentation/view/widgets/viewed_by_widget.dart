import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ViewedByWidget extends StatefulWidget {
  final data;
  final showText;
  const ViewedByWidget({super.key, this.data, this.showText});

  @override
  State<ViewedByWidget> createState() => _ViewedByWidgetState();
}

class _ViewedByWidgetState extends State<ViewedByWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.toString());
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          // height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.showText,
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      horizontalTitleGap: 12.w,
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      contentPadding: EdgeInsets.only(bottom: 10.h),
                      leading: AvatarWidget(
                        dpUrl: widget.data[index].dp != null
                            ? widget.data[index].dpUrl!
                            : "",
                        name: widget.data[index].name!,
                        backgroundColor: widget.data[index].preset!.color!,
                        size: 32,
                      ),
                      title: Text(
                        widget.data[index].name!,
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                    ;
                  },
                ),
              ]),
        ),
      ],
    );
  }
}
