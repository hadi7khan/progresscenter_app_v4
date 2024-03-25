import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart'
    as model;

class CarouselWidget extends ConsumerStatefulWidget {
  final model.ImagesByCameraIdModel imagesByCameraIdInter;
  final model.Image currentImage;
  final Function onChange;
  const CarouselWidget(
      {super.key,
      required this.imagesByCameraIdInter,
      required this.currentImage,
      required this.onChange});

  @override
  ConsumerState<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends BaseConsumerState<CarouselWidget> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.imagesByCameraIdInter.images!.length,
      reverse: true,
      itemBuilder: (BuildContext context, int itemIndex) {
        return Stack(
          alignment: Alignment.center,
          children: [
            BlurryContainer(
                blur: 30,
                borderRadius: BorderRadius.zero,
                height: 250.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.4),
                child: SizedBox()),
            PinchZoom(
              maxScale: 10,
              child: Image.network(
                widget.currentImage.urlPreview!,
                width: double.infinity,
                gaplessPlayback: true,
                scale: 1,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: CircularProgressIndicator(
                      color: ref.watch(primaryColorProvider),
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
          ],
        );
      },
      onPageChanged: (int index) {
        setState(() {
          final image = model.Image(
            id: widget.imagesByCameraIdInter.images![index].id,
            name: widget.imagesByCameraIdInter.images![index].name,
            datetime: widget.imagesByCameraIdInter.images![index].datetime,
            date: widget.imagesByCameraIdInter.images![index].date,
            time: widget.imagesByCameraIdInter.images![index].time,
            urlPreview: widget.imagesByCameraIdInter.images![index].urlPreview,
            urlThumb: widget.imagesByCameraIdInter.images![index].urlThumb,
            url4K: widget.imagesByCameraIdInter.images![index].url4K,
            resolution: widget.imagesByCameraIdInter.images![index].resolution,
          );
          widget.onChange(image);
        });
      },
    );
  }
}
