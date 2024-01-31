import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_card.dart';

class DocsWidget extends ConsumerStatefulWidget {
  final files;
  const DocsWidget({super.key, this.files});

  @override
  ConsumerState<DocsWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<DocsWidget> {
  List filesData = [];
  int indx = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     ref.read(docsControllerProvider.notifier).getDocs();
  //   });
  // }

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
    // final docsData =
    //     ref.watch(docsControllerProvider.select((value) => value.docs));
    // return docsData.when(
    //   data: (data) {
    // filesData = [];
    // print("dataaaaa"+data.toString());
    // data.map((map) {
    //   indx = filesData.indexOf(map);
    //   print("indxxxxx"+indx.toString());
    //   return {filesData.add(map.files)};
    // }).toList();
    // print(filesData.length.toString());
    // final allFiles = data
    //     .where((document) => document.files != null)
    //     .expand((document) => document.files!)
    //     .toList();

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
        return DocsCard(docsData: file, index: index);
      }),
    );
    // },
    // error: (err, _) {
    //   return const Text("Failed to load Docs",
    //       style: TextStyle(color: Helper.errorColor));
    // },
    // loading: () => LoadingCardListScreen(),
    // );
  }
}
