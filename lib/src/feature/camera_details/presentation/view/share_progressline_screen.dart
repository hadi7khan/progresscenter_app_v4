import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_slider.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'dart:ui' as ui;

import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/caption_bottomsheet_widget.dart';

class ShareProgresslineScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String imageUrl;
  final int imageHeight;
  final int imageWidth;
  const ShareProgresslineScreen(
      {super.key,
      required this.projectId,
      required this.cameraId,
      required this.imageUrl,
      required this.imageHeight,
      required this.imageWidth});

  @override
  ConsumerState<ShareProgresslineScreen> createState() =>
      _ShareProgresslineScreenState();
}

class _ShareProgresslineScreenState
    extends BaseConsumerState<ShareProgresslineScreen> {
  ui.Image? image;
  bool isImageloaded = false;
  GlobalKey _myCanvasKey = new GlobalKey();
  ImageEditor? editor;
  TextEditingController _captionController = TextEditingController();
  GlobalKey _containerKey = GlobalKey();

  void initState() {
    super.initState();
    init();
  }

  void dispose() {
    super.dispose();
    ref.invalidate(drawingDataProvider);
  }

  Future<Null> init() async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(widget.imageUrl))
            .load(widget.imageUrl))
        .buffer
        .asUint8List();

    // final ByteData data = await rootBundle.load('img/guide1.png');
    image = await loadImage(Uint8List.view(bytes.buffer));
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Widget _buildImage(image, drawingData) {
    editor = ImageEditor(image: image!, drawingData: drawingData);

    if (this.isImageloaded) {
      return GestureDetector(
        onPanStart: (details) {
          drawingData.startNewLine(details.localPosition);
          setState(() {});
        },
        onPanUpdate: (details) {
          drawingData.update(details.localPosition);
          setState(() {});
        },
        child: ClipRect(
          child: RepaintBoundary(
            key: _myCanvasKey,
            child: AspectRatio(
              key: _containerKey,
              aspectRatio: widget.imageWidth / widget.imageHeight,
              child: CustomPaint(
                // key: _myCanvasKey,
                painter: editor,
                // size: Size(MediaQuery.of(context).size.width,
                //     MediaQuery.of(context).size.height * 0.6),
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(child: Text('loading'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final drawingData = ref.read(drawingDataProvider);
    dev.log("rebuilt");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            leading: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                context.pop();
              },
              child: Transform.rotate(
                angle: 180 * (3.1415926535 / 180),
                child: SvgPicture.asset('assets/images/chevron-right.svg',
                    color: Helper.iconColor, fit: BoxFit.contain),
              ),
            ),
            leadingWidth: 24,
            title: Text(
              "Share Image",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: image != null
            ? Center(child: _buildImage(image, drawingData))
            : Center(child: LoadingSlider()),
      ),
      bottomNavigationBar: image != null
          ? SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                color: Colors.white,
                alignment: Alignment.center,
                height: 76.h,
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () async {
                            drawingData.clearPoints();
                            setState(() {});
                            // editor!.clearPoints();
                            // _myCanvasKey.currentContext!
                            //     .findRenderObject()!
                            //     .markNeedsPaint();
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 11.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              backgroundColor: Colors.white,
                              fixedSize: Size.infinite),
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.neutral500,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            // _handleSavePressed();
                            showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: CaptionBottomSheetWidget(
                                  onNext: (value) {
                                    saveCanvasAsImage(value);
                                  },
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 11.h),
                              backgroundColor: ref.watch(primaryColorProvider),
                              side: BorderSide(color: Helper.textColor300),
                              fixedSize: Size.infinite),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                ),
              ),
            )
          : SizedBox(),
    );
  }

  void saveCanvasAsImage(String caption) async {
    RenderRepaintBoundary boundary = _myCanvasKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image =
        await boundary.toImage(pixelRatio: 3.0); // Set pixelRatio as needed
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Save image to a temporary file
    String tempPath = (await getTemporaryDirectory()).path;
    File imageFile = File('$tempPath/canvas_image.png');
    await imageFile.writeAsBytes(pngBytes);
    Service()
        .shareProgresslinePost(
            widget.projectId, widget.cameraId, imageFile.path, caption)
        .then((value) {
      dev.log("response id" + value["id"].toString());

      context.pop();
      context.pushReplacement('/progresslineById', extra: {
        "projectId": widget.projectId,
        "progressLinePostId": value["id"].toString(),
        "commentId": "",
      });
      Utils.toastSuccessMessage("Post shared", context);
    });
  }
}

class DrawingData {
  List<List<Offset>> lines = [];

  void startNewLine(Offset offset) {
    dev.log("adding" + offset.toString());
    lines.add([offset]);
  }

  void update(Offset offset) {
    if (lines.isNotEmpty) {
      lines.last.add(offset);
    }
  }

  void clearPoints() {
    if (lines.isNotEmpty) {
      lines.removeLast();
    }
  }
}

final drawingDataProvider = Provider<DrawingData>((ref) {
  return DrawingData();
});

class ImageEditor extends CustomPainter {
  ImageEditor({
    required this.image,
    required this.drawingData,
  });
  ui.Image image;
  final DrawingData drawingData;

  List<Offset> points = [];
  List<List<Offset>> lines = [];

  final Paint painter = new Paint()
    ..color = Helper.primary
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  void startNewLine() {
    points = [];
    lines.add(points);
  }

  void update(Offset offset) {
    points.add(offset);
  }

  void clearPoints() {
    if (lines.isNotEmpty) {
      var index = lines.indexOf(lines.last);
      lines.removeAt(index);
    }
  }

  @override
  void paint(Canvas canvas, Size size) async {
    Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    Rect imageRect = Offset.zero & imageSize;
    Rect canvasRect = Offset.zero & size;
    canvas.drawImageRect(image, imageRect, canvasRect, Paint());
    dev.log("Drawing lines: ${drawingData.lines}");

    for (List<Offset> line in drawingData.lines) {
      for (int i = 0; i < line.length - 1; i++) {
        if (line[i] != null && line[i + 1] != null) {
          canvas.drawLine(line[i], line[i + 1], painter);
        } else if (line[i] != null && line[i + 1] == null) {
          canvas.drawPoints(PointMode.points, [line[i]], painter);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
