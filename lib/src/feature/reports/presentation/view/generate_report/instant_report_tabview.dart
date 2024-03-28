import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/provider/generate_reports_controller.dart';
import 'dart:developer' as dev;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

enum CameraReportIntervalType {
  WEEKLY,
  MONTHLY,
  QUARTERLY,
  BIANNUALLY,
  ANNUALLY,
}

class InstantReportTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String projectName;
  final String endDate;
  final String startDate;
  final String cameraName;
  const InstantReportTabview({
    super.key,
    required this.projectId,
    required this.cameraId,
    required this.projectName,
    required this.endDate,
    required this.startDate,
    required this.cameraName,
  });

  @override
  ConsumerState<InstantReportTabview> createState() =>
      _InstantReportTabviewState();
}

class _InstantReportTabviewState
    extends BaseConsumerState<InstantReportTabview> {
  bool _isLoading = false;
  String _showDuration = "Select";
  String _duration = "Select";
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;
  Uint8List? userLogo;
  int maxImageDays = 0;
  List<Map<String, dynamic>> periods = [
    {
      "label": '1  week',
      "value": 'WEEKLY',
    },
    {
      "label": '1 Month',
      "value": 'MONTHLY',
    },
    {
      "label": '3 Months',
      "value": 'QUARTERLY',
    },
    {
      "label": '6 Months',
      "value": 'BIANNUALLY',
    },
    {
      "label": '1 Year',
      "value": 'ANNUALLY',
    },
  ];

  int getReportIntervalDays(CameraReportIntervalType intervalType) {
    final Map<CameraReportIntervalType, int> periods = {
      CameraReportIntervalType.WEEKLY: 7,
      CameraReportIntervalType.MONTHLY: 30,
      CameraReportIntervalType.QUARTERLY: 90,
      CameraReportIntervalType.BIANNUALLY: 180,
      CameraReportIntervalType.ANNUALLY: 365,
    };

    return periods[intervalType]!;
  }

  @override
  void initState() {
    super.initState();
    dev.log("dateee" + widget.startDate.toString());
    fetchUser();
    getDateDifference(widget.startDate, widget.endDate);
  }

  getDateDifference(String sDate, String eDate) {
    DateTime startDate = DateTime.parse(sDate);
    DateTime endDate = DateTime.parse(eDate);

    Duration difference = endDate.difference(startDate);
    maxImageDays = difference.inDays;

    // Print the difference in days
    dev.log('Difference in days: ${maxImageDays} days');
  }

  fetchUser() async {
    user = _prefsLocator.getUser();
    userLogo = await getImage(user!['client']['logoUrl']);
    dev.log(user.toString());
    dev.log("logo" + user!['client'].toString());
  }

  getDate(String date, String dateFormat) {
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    final String formattedTime = DateFormat(dateFormat).format(dateTime);
    return formattedTime;
  }

  Future<void> generatePdf(
    dynamic previousImageUrl,
    dynamic currentImageUrl,
    Uint8List logo,
    String username,
    dynamic previousDate,
    dynamic currentDate,
  ) async {
    // Load and embed the font
    final fontData = await rootBundle.load("assets/fonts/Inter-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);
    String svg =
        await rootBundle.loadString('assets/images/progress_center_black.svg');

    final pdf = pw.Document();
    final previousImage =
        previousImageUrl != null ? await getImage(previousImageUrl) : null;
    final currentImage =
        currentImageUrl != null ? await getImage(currentImageUrl) : null;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
              child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              // Header

              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
                pw.Image(
                  pw.MemoryImage(userLogo!),
                  width: 70,
                  height: 70,
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        widget.projectName + " - " + widget.cameraName,
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        "Progress Report",
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromInt(0xFF0052CC),
                        ),
                      ),
                    ]),
              ]),

              pw.SizedBox(height: 20),

              // Body with images
              previousImage != null
                  ? pw.Container(
                      height: context.page.pageFormat.height * 0.3,
                      child: pw.ClipRRect(
                        horizontalRadius: 15,
                        verticalRadius: 15,
                        child: pw.Transform.scale(
                          scale: 1.0,
                          child: pw.Image(
                            pw.MemoryImage(previousImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : pw.ClipRRect(
                      horizontalRadius: 15,
                      verticalRadius: 15,
                      child: pw.Container(
                        height: context.page.pageFormat.height * 0.3,
                        color: PdfColor.fromInt(0xFFF6F6F6),
                        child: pw.Center(
                          child: pw.Text(
                            "No Image Available",
                            style: pw.TextStyle(
                              color: PdfColor.fromInt(0xFF475467),
                            ),
                          ),
                        ),
                      ),
                    ),
              pw.SizedBox(height: 5),
              previousImage != null
                  ? pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                          pw.Text("Image of "),
                          pw.Text(
                            previousDate,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 12),
                          ),
                        ])
                  : pw.SizedBox(),

              pw.SizedBox(height: 15),
              currentImage != null
                  ? pw.Container(
                      height: context.page.pageFormat.height * 0.3,
                      child: pw.ClipRRect(
                        horizontalRadius: 15,
                        verticalRadius: 15,
                        child: pw.Transform.scale(
                          scale: 1.0,
                          child: pw.Image(
                            pw.MemoryImage(currentImage),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  : pw.ClipRRect(
                      horizontalRadius: 15,
                      verticalRadius: 15,
                      child: pw.Container(
                        height: context.page.pageFormat.height * 0.3,
                        color: PdfColor.fromInt(0xFFF6F6F6),
                        child: pw.Center(
                            child: pw.Text(
                          "No Image Available",
                          style: pw.TextStyle(
                            color: PdfColor.fromInt(0xFF475467),
                          ),
                        )),
                      ),
                    ),
              pw.SizedBox(height: 5),
              currentImage != null
                  ? pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                          pw.Text("Image of "),
                          pw.Text(
                            currentDate,
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 12),
                          ),
                        ])
                  : pw.SizedBox(),

              pw.SizedBox(height: 15),

              // Footer
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Generated on"),
                          pw.Text(
                              DateFormat('hh:mm a · dd MMM, yyyy')
                                  .format(DateTime.now()),
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ]),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Generated by"),
                          pw.Text(username,
                              style:
                                  pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ]),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text("Powered by"),
                          pw.SvgImage(
                            svg: svg,
                            width: 100,
                            height: 70,
                          )
                        ]),
                  ]),
            ],
          ));
        },
      ),
    );

    // Save the PDF file
    final output = await getTemporaryDirectory();
    final file = File(
        "${output.path}/${widget.cameraName + " - " + widget.projectName + ".pdf"}");
    await file.writeAsBytes(await pdf.save());

    setState(() {
      _isLoading = false;
    });
    // Open the generated PDF file using the open_file package
    OpenFile.open(file.path);

    // Open the generated PDF file
    // You can use a PDF viewer or share the file using another package
    // (e.g., share_plus or open_file).
  }

  Future<Uint8List> getImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Use the instant report to generate a PDF report",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Report will be generated and downloaded instantly",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor400,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Report type",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _showTypeBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          title: Text(
                            _showDuration,
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 59.h),
            Container(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                child: _isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 0.5,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Generating report...",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : Text(
                        "Generate",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        ref.watch(primaryColorProvider)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    )),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> data = {"type": _duration};
                  await ref
                      .watch(generateReportsProvider.notifier)
                      .generateReport(widget.projectId, widget.cameraId, data)
                      .then((value) async {
                    value.fold((failure) {
                      dev.log("errorrrrrr");
                    }, (res) async {
                      final previousDate = res['previousImage'] != null
                          ? getDate(res['previousImage']['datetime'],
                              "hh:mm a . dd MMM yyyy")
                          : null;
                      final previousImageUrl = res['previousImage'] != null
                          ? res['previousImage']['url']
                          : null;

                      final currentDate = res['currentImage'] != null
                          ? getDate(res['currentImage']['datetime'],
                              "hh:mm a . dd MMM yyyy")
                          : null;
                      final currentImageUrl = res['currentImage'] != null
                          ? res['currentImage']['url']
                          : null;
                      dev.log("response data" + previousDate.toString());
                      await generatePdf(previousImageUrl, currentImageUrl,
                          userLogo!, user!['name'], previousDate, currentDate);

                      Utils.toastSuccessMessage(
                          "Report generated successfully", context);
                      setState(() {
                        _isLoading = false;
                      });
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showTypeBottomSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Duration',
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ListView.builder(
                itemCount: periods.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  final int intervalDays = getReportIntervalDays(
                    CameraReportIntervalType.values[index],
                  );
                  final bool isItemEnabled = maxImageDays >= intervalDays;

                  return InkWell(
                    highlightColor: Colors.transparent,
                    onTap: isItemEnabled
                        ? () async {
                            setState(() {
                              _duration = periods[index]["value"];
                              _showDuration = periods[index]["label"];
                            });
                            context.pop();
                          }
                        : null,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Text(
                        periods[index]["label"],
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color:
                                isItemEnabled ? Helper.baseBlack : Colors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                })),
            Container(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  // currentIndex == contents.length - 1 ? "Continue" : "Next"
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Helper.baseBlack),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    )),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
