import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
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

class InstantReportTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String projectName;
  const InstantReportTabview(
      {super.key,
      required this.projectId,
      required this.cameraId,
      required this.projectName});

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

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    user = _prefsLocator.getUser();
    userLogo = await getImage(user!['client']['logoUrl']);
    dev.log(user.toString());
    dev.log("logo" + user!['client']['logoUrl'].toString());
  }

  Future<void> generatePdf(String previousImageUrl, String currentImageUrl,
      Uint8List logo, String username) async {
    // Load and embed the font
    final fontData = await rootBundle.load("assets/fonts/Inter-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);
    String svg =
        await rootBundle.loadString('assets/images/progress_center_black.svg');

    final pdf = pw.Document();
    final previousImage = await getImage(previousImageUrl);
    final currentImage = await getImage(currentImageUrl);

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
                  width: 50,
                  height: 50,
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(widget.projectName),
                      pw.Text("Progress Report",
                          style: pw.TextStyle(
                              color: PdfColor.fromInt(0xFF0052CC))),
                    ]),
              ]),

              pw.SizedBox(height: 20),

              // Body with images
              pw.Container(
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
              ),
              pw.Text("Image of"),
              pw.SizedBox(height: 20),
              pw.Container(
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
              ),
              pw.Text("Image of"),
              pw.SizedBox(height: 20),

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
    final file = File("${output.path}/example.pdf");
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
                      await generatePdf(res['previousImage']['url'],
                          res['currentImage']['url'], userLogo!, user!['name']);
                      dev.log("response data" + res.toString());
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
        height: 450.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      _duration = "WEEKLY";
                      _showDuration = "1 Week";
                    });
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
                      '1 Week',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "MONTHLY";
                      _showDuration = "1 Month";
                    });
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
                      '1 Month',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "QUARTERLY";
                      _showDuration = "3 Months";
                    });
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
                      '3 Months',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "BIANNUALLY";
                      _showDuration = "6 Months";
                    });
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
                      '6 Months',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "ANNUALLY";
                      _showDuration = "1 Year";
                    });
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
                      '1 Year',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
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
          ],
        ),
      ),
    );
  }
}
