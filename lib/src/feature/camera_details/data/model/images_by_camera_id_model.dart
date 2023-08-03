import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'images_by_camera_id_model.freezed.dart';
part 'images_by_camera_id_model.g.dart';

ImagesByCameraIdModel imagesByCameraIdModelFromJson(String str) =>
    ImagesByCameraIdModel.fromJson(json.decode(str));

String imagesByCameraIdModelToJson(ImagesByCameraIdModel data) =>
    json.encode(data.toJson());

@freezed
class ImagesByCameraIdModel with _$ImagesByCameraIdModel {
  const factory ImagesByCameraIdModel({
    String? startDate,
    String? endDate,
    List<Image>? images,
  }) = _ImagesByCameraIdModel;

  factory ImagesByCameraIdModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesByCameraIdModelFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    Resolution? resolution,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? date,
    String? time,
    String? datetime,
    String? camera,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? imageId,
    String? urlThumb,
    String? urlPreview,
    String? url4K,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Resolution with _$Resolution {
  const factory Resolution({
    int? width,
    int? height,
  }) = _Resolution;

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}
