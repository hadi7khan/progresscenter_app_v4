import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/camera_view_bottom_nav.dart';

class BottomNavWidget extends StatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  final String endDate;
  final String startDate;
  final String cameraName;
  const BottomNavWidget({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
    required this.endDate,
    required this.startDate,
    required this.cameraName,
  });

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.2), width: 0.5),
          ),
        ),
        height: 50.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push('/livelapse', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName,
                    "cameraId": widget.cameraId
                  });
                },
                child: const IconBottomBar(
                  icon: 'assets/images/video-recorder.svg',
                  selected: true,
                  text: 'LiveLapse',
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push('/slider', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName,
                    "cameraId": widget.cameraId
                  });
                },
                child: const IconBottomBar(
                  icon: 'assets/images/sliders.svg',
                  selected: true,
                  text: 'Slider',
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push('/compare', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName,
                    "cameraId": widget.cameraId
                  });
                },
                child: const IconBottomBar(
                  icon: 'assets/images/rows.svg',
                  selected: true,
                  text: 'Compare',
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push('/splitview', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName,
                    "cameraId": widget.cameraId
                  });
                },
                child: const IconBottomBar(
                  icon: 'assets/images/layout-left.svg',
                  selected: true,
                  text: 'Split View',
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();

                  context.push('/report', extra: {
                    "projectId": widget.projectId,
                    "projectName": widget.projectName,
                    "cameraId": widget.cameraId,
                    "endDate": widget.endDate,
                    "startDate": widget.startDate,
                    "cameraName": widget.cameraName,
                  });
                },
                child: const IconBottomBar(
                  icon: 'assets/images/file-download.svg',
                  selected: true,
                  text: 'Report',
                ),
              )
            ]),
      ),
    );
  }
}
