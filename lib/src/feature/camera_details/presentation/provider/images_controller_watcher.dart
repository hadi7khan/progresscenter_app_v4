import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';

class CurrentImageNotifier extends StateNotifier<Image?> {
  CurrentImageNotifier() : super(null);

  void setCurrentImage(Image newImage) {
    try {
      state = newImage;
    } catch (error, stackTrace) {
      // Handle errors or print them for debugging
      print('Error setting current image: $error\n$stackTrace');
    }
  }
}

final currentImageProvider =
    StateNotifierProvider<CurrentImageNotifier, Image?>((ref) {
  return CurrentImageNotifier();
});

final imagesByCameraIdInterProvider =
    StateProvider.autoDispose<ImagesByCameraIdModel>((ref) {
  final imagesByCamIdData = ref.watch(
      imagesByCamIdControllerProvider.select((value) => value.imagesByCamId));

  final startDate = imagesByCamIdData.value?.startDate;
  final endDate = imagesByCamIdData.value?.endDate;
  final images = imagesByCamIdData.value?.images ?? [];
  final currentImage = images.isNotEmpty ? images[0] : null;

  if (currentImage != null) {
// Set the initial value for currentImageProvider
    ref.read(currentImageProvider.notifier).setCurrentImage(currentImage);
  }

  return ImagesByCameraIdModel(
    startDate: startDate,
    endDate: endDate,
    images: images,
    currentImage: currentImage,
  );
});
