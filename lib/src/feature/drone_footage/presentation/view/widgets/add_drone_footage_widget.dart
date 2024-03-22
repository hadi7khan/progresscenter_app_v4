import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/add_drone_container.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AddDroneFootageWidget extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const AddDroneFootageWidget({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<AddDroneFootageWidget> createState() =>
      _AddDroneFootageWidgetState();
}

class _AddDroneFootageWidgetState
    extends BaseConsumerState<AddDroneFootageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Drone Footage',
                style: TextStyle(
                    letterSpacing: -0.3,
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
                onTap: () {
                  context.push('/addFileVideo', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName
                  });
                },
                child: AddDroneContainer(
                  svgPath: 'assets/images/file.svg',
                  title: "Upload Video",
                  subTitle: "Use this to upload an Mp4 file directly",
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  context.push('/addVimeoVideo', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName
                  });
                },
                child: AddDroneContainer(
                  svgPath: 'assets/images/vimeo.svg',
                  title: "From Vimeo",
                  subTitle: "Use this to add a video from Vimeo",
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  context.push('/addYoutubeVideo', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName
                  });
                },
                child: AddDroneContainer(
                  svgPath: 'assets/images/youtube.svg',
                  title: "From YouTube",
                  subTitle: "Use this to add a video from YouTube",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
