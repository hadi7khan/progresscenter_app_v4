import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_action_widget.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_card.dart';
import 'dart:developer';

class DocsWidget extends ConsumerStatefulWidget {
  final files;
  const DocsWidget({super.key, this.files});

  @override
  ConsumerState<DocsWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<DocsWidget> {
  List filesData = [];
  int indx = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.files.isEmpty) {
      return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.6.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/illustration.svg'),
            SizedBox(height: 16.h),
            Text(
              "No Documents",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "This space is empty. ",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor600,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }
    ;

    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: widget.files.length,
      itemBuilder: ((context, index) {
        final file = widget.files[index];
        log("file" + file.toString());
        return InkWell(
            onTap: () {
              showModalBottomSheet(
                  useRootNavigator: true,
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => DocsActionWidget(
                      folderId: file['folderId'],
                      fileId: file['fileId'],
                      fileName: file['fileName'],
                      fileUrl: file['fileUrl'],
                      filePath: file['path']));
            },
            child: DocsCard(docsData: file, index: index));
      }),
    );
  }
}
