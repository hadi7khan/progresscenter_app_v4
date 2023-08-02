import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';

final splitView1DataProvider =
    StateNotifierProvider<ImageDataProvider, ImageData?>((ref) {
  return ImageDataProvider();
});

class ImageDataProvider extends StateNotifier<ImageData?> {
  ImageDataProvider() : super(null);

  void setImageData(ImageData data) {
    state = data;
  }
}
