import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';

class LandscapeCameraDetailsScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  final imagesData;
  const LandscapeCameraDetailsScreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
    required this.imagesData,
  });

  @override
  ConsumerState<LandscapeCameraDetailsScreen> createState() =>
      _LandscapeCameraDetailsScreenState();
}

class _LandscapeCameraDetailsScreenState
    extends BaseConsumerState<LandscapeCameraDetailsScreen> {
  int _selectedImageIndex = 0;
  String _selectedDate = '';
  String _searchDate = '';
  DateTime currentMonth = DateTime.now();
  String showMonth = "JAN";

  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  showDate(String date) {
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    showMonth = DateFormat.MMM().format(parsedDate).toUpperCase();
    return formattedDate;
  }

  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }



  @override
  Widget build(BuildContext context) {
    final selectedImageData = ref.watch(selectedImageDataProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer(builder: (context, ref, child) {
            print("state printed" + selectedImageData.toString());
            return Column(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                  Container(height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                    color: Helper.textColor300,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        selectedImageData == null
                            ? widget.imagesData.images![0].urlPreview!
                            : selectedImageData.urlPreview!,
                        width: double.infinity,
                        // height: 210.h,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              color: Helper.primary,
                              value: (loadingProgress != null)
                                  ? (loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!)
                                  : 0,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return ClipRRect(
                            child: Image.asset(
                              'assets/images/error_image.jpeg',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 16,
                  //   left: 16,
                  //   child: InkWell(
                  //     onTap: () async {
                  //       await _showDateBottomSheet(
                  //           context,
                  //           widget.imagesData.startDate!,
                  //           widget.imagesData.endDate!,
                  //           _selectedDate,
                  //           widget.cameraId,
                  //           widget.projectId,
                  //           ref,
                  //           currentMonth);
                  //       setState(() {});
                  //     },
                  //     child: BlurryContainer(
                  //         blur: 3,
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: 6.h, horizontal: 8.w),
                  //         borderRadius: BorderRadius.circular(30.r),
                  //         color: Colors.white.withOpacity(0.1),
                  //         child: Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //               'assets/images/timeline.svg',
                  //               height: 16.h,
                  //               width: 16.w,
                  //               color: Colors.white,
                  //             ),
                  //             SizedBox(width: 4.w),
                  //             Text(showDate(widget.imagesData.endDate!),
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 12.sp)),
                  //           ],
                  //         )),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: BlurryContainer(
                        blur: 3,
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 8.w),
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white.withOpacity(0.1),
                        child: SvgPicture.asset(
                          'assets/images/minimize.svg',
                          height: 16.h,
                          width: 16.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 6.h),
                SizedBox(
                  height: 84.h,
                  child: ListView.separated(
                      separatorBuilder: (context, builder) {
                        return SizedBox(
                          width: 2.w,
                        );
                      },
                      itemCount: widget.imagesData.images!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        String dateWithT = widget.imagesData.images![index].datetime!
                                .substring(0, 8) +
                            'T' +
                            widget.imagesData.images![index].datetime!.substring(8);
                        DateTime dateTime = DateTime.parse(dateWithT);
                        final String formattedTime =
                            DateFormat('h:mm a').format(dateTime);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedImageIndex = index;
                            });
                            final imageData = ImageData(
                              name: widget.imagesData.images![index].name,
                              dateTime: widget.imagesData.images![index].datetime,
                              camera: widget.imagesData.images![index].camera,
                              id: widget.imagesData.images![index].id,
                              urlPreview: widget.imagesData.images![index].urlPreview,
                            );

                            ref
                                .read(selectedImageDataProvider.notifier)
                                .setImageData(imageData);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: _selectedImageIndex == index
                                          ? Border.all(
                                              color: Helper.primary,
                                              width: 2.w,
                                            )
                                          : Border.all(
                                              width: 2.w,
                                              color: Colors.transparent),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.network(
                                        widget.imagesData.images![index].urlThumb!,
                                        width: 51.w,
                                        height: 51.h,
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return ClipRRect(
                                            child: Image.asset(
                                              'assets/images/error_image.jpeg',
                                              width: 51.w,
                                              height: 51.h,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          ),
                        );
                      })),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
   _showDateBottomSheet(
      context,
      String startDate,
      String endDate,
      String selectedDate,
      String cameraId,
      String projectId,
      WidgetRef ref,
      DateTime currentMonth) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, StateSetter modalState) {
          // bottomSheetState = modalState;
          return Container(
            padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Select Date',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      lastDate: DateTime.parse(endDate),
                      firstDate: DateTime.parse(startDate),
                      selectedDayHighlightColor: Helper.primary,
                    ),
                    value: [],
                    onValueChanged: (value) {
                      print(value.toString());
                      DateTime date = DateTime.parse(value[0].toString());
                      selectedDate = DateFormat("yyyyMMdd").format(date);
                      print("selectedDate " + selectedDate);
                      currentMonth = value[0]!;
                    },
                  ),
                  // SizedBox(height: 20.h),
                  Container(
                    height: 52.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: ElevatedButton(
                      child: Text(
                        "Done",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        // currentIndex == contents.length - 1 ? "Continue" : "Next"
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Helper.primary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          )),
                      onPressed: () {
                        print(selectedDate);
                        //         ref
                        // .read(imagesByCamIdControllerProvider.notifier)
                        // .getIagesByCamId(projectId, cameraId, searchDate: selectedDate );
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                          ref
                              .read(imagesByCamIdControllerProvider.notifier)
                              .getImagesByCamId(projectId, cameraId,
                                  searchDate: selectedDate);
                        });
            
                        context.pop();
                        setState(() {
                          // getDaysInMonth(currentMonth, false);
                          // showDate(endDate);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ]),
    );
  }

}
