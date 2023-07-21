import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedImageDataProvider =
    StateNotifierProvider<ImageDataProvider, ImageData?>((ref) {
  return ImageDataProvider();
});

class ImageData {
  final String? id;
  final String? urlThumb;
  final String? name;
  final String? dateTime;
  final String? camera;
  final String? urlPreview;

  ImageData(
      {this.name,
      this.dateTime,
      this.camera,
      this.urlThumb,
      required this.id,
      required this.urlPreview});
}

class ImageDataProvider extends StateNotifier<ImageData?> {
  ImageDataProvider() : super(null);

  void setImageData(ImageData data) {
    state = data;
  }
}

// final selectedImageDataProvider =
//     StateProvider<AsyncValue<ImageData>>((ref) => const AsyncValue.loading());

// class ImageData {
//   final String? id;
//   final String? urlThumb;
//   final String? name;
//   final String? dateTime;
//   final String? camera;
//   final String? urlPreview;

//   ImageData(
//       {this.name,
//       this.dateTime,
//       this.camera,
//       this.urlThumb,
//       required this.id,
//       required this.urlPreview});
// }
