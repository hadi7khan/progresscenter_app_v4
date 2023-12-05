import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';

class DocsCard extends ConsumerStatefulWidget {
  final docsData;
  final index;
  const DocsCard({super.key, required this.docsData, this.index});

  @override
  ConsumerState<DocsCard> createState() => _DocsCardState();
}

class _DocsCardState extends BaseConsumerState<DocsCard> {
  @override
  Widget build(BuildContext context) {
    print("data passed to docs card" + widget.docsData.toString());
    return widget.docsData != null
        ? Container(
            decoration: BoxDecoration(
              color: Helper.widgetBackground,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Text(
                  widget.docsData['path'].split('.').last.toUpperCase(),
                  style: TextStyle(
                      color: Helper.textColor600,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              title: Text(
                widget.docsData['fileName'],
                style: TextStyle(
                    color: Helper.textColor700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "uploaded by " + widget.docsData["uploadedBy"],
                style: TextStyle(
                    color: Helper.textColor600,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              trailing: PopupMenuButton(
                icon: SvgPicture.asset('assets/images/dots-vertical.svg'),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'download',
                    child: Text(
                      'Download',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Helper.errorColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
                onSelected: (value) {
                  print(value.toString());
                  if (value == 'delete') {
                    Service()
                        .deleteFile(widget.docsData['fileId'])
                        .then((value) {
                      Utils.flushBarErrorMessage("File deleted", context);
                      ref.watch(docsControllerProvider.notifier).getDocs();
                    });
                  } else if (value == 'download') {
                    // Handle download action
                    print('Download option selected');
                  }
                },
              ),
            ),
          )
        : Text("No docs present");
  }
}
