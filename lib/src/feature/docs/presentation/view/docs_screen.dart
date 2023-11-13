import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_widget.dart';

class DocsScreen extends ConsumerStatefulWidget {
  final label;
  final detailsPath;
  const DocsScreen({super.key, this.label, this.detailsPath});

  @override
  ConsumerState<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends BaseConsumerState<DocsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(docsControllerProvider.notifier).getDocs();
    });
  }

  List<Map<String, dynamic>> categoryList = [];
  @override
  Widget build(BuildContext context) {
    final docsData =
        ref.watch(docsControllerProvider.select((value) => value.docs));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: docsData.when(
            data: (data) {
              print("data fetched" + data.toString());
              categoryList = data.map((map) {
                return {
                  '_id': map.id,
                  'name': map.name,
                };
              }).toList();
              print("mapped data " + categoryList.toString());
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/home.svg'),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/search.svg'),
                          SizedBox(width: 12.w),
                          SvgPicture.asset('assets/images/sort.svg'),
                          SizedBox(width: 12.w),
                          InkWell(
                              onTap: () {
                                _showUserBottomSheet(context, categoryList);
                              },
                              child:
                                  SvgPicture.asset('assets/images/plus.svg')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Documents",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  DocsWidget(),
                ],
              );
            },
            error: (err, _) {
              return const Text("Failed to load Docs",
                  style: TextStyle(color: Helper.errorColor));
            },
            loading: () => SizedBox(),
          ),
        ),
      )),
    );
  }

  _showUserBottomSheet(context, categoryList) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 216.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add new',
                  style: TextStyle(
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
                  onTap: () async {
                    context.push('/addDocs',extra: {"category": categoryList});
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Add document',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Add new category',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
