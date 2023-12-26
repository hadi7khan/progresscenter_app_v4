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
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        ));
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        ));
  }



  @override
  Widget build(BuildContext context) {
    final selectedImageData = ref.watch(selectedImageDataProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            print("state printed" + selectedImageData.toString());
            return Center(
              child: Expanded(
                child: Stack(
                  // fit: StackFit.loose,
                  children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: InteractiveViewer(
                      clipBehavior: Clip.none,
                      maxScale : 10,
                      child: Image.network(
                        selectedImageData == null
                            ? widget.imagesData.images![0].urlPreview!
                            : selectedImageData.urlPreview!,
                        // width: double.infinity,
                        height: MediaQuery.of(context).size.height,
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
                  Positioned(
                    top: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: BlurryContainer(
                        blur: 3,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 4.w),
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/images/close-x.svg',
                          height: 16.h,
                          width: 16.w,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
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
