import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';

final imagesByCameraIdModelProvider =
    StateProvider.autoDispose<ImagesByCameraIdModel>((ref) {
  final imagesByCamIdIntermediateProvider = ref.watch(
      imagesByCamIdControllerProvider.select((value) => value.imagesByCamId));

  final startDate = imagesByCamIdIntermediateProvider.value?.startDate;
  final endDate = imagesByCamIdIntermediateProvider.value?.endDate;
  final images = imagesByCamIdIntermediateProvider.value?.images ?? [];
  final currentImage = imagesByCamIdIntermediateProvider.value!.currentImage ??
      images[0]; // Use the extension method

  return ImagesByCameraIdModel(
    startDate: startDate, // Set the appropriate value based on your data
    endDate: endDate, // Set the appropriate value based on your data
    images: images,
    currentImage: currentImage,
  );
});
