import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'camera_model.freezed.dart';
part 'camera_model.g.dart';

List<CameraModel> cameraModelFromJson(String str) => List<CameraModel>.from(
    json.decode(str).map((x) => CameraModel.fromJson(x)));

String cameraModelToJson(List<CameraModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CameraModel with _$CameraModel {
  const factory CameraModel({
    @Default(Location()) Location? location,
    @JsonKey(name: '_id') String? id,
    @Default('') String? name,
    @Default('') String? installationDate,
    @Default('') String? status,
    // DateTime? lastUpdated,
    @Default('') String? orientation,
    @Default('') String? project,
    @Default(null) LatestImage? latestImage,
    @Default(false) bool? hasImages,
    @Default([]) List<String>? enabledFeaturesList,
  }) = _CameraModel;

  factory CameraModel.fromJson(Map<String, dynamic> json) =>
      _$CameraModelFromJson(json);
}

@freezed
class LatestImage with _$LatestImage {
  const factory LatestImage({
    @Default(Resolution()) Resolution? resolution,
    @Default('') String? name,
    @Default('') String? date,
    @Default('') String? time,
    @Default('') String? datetime,
    @Default("") String url4K,
    @Default("") String urlPreview,
    @Default("") String urlThumb,
  }) = _LatestImage;

  factory LatestImage.fromJson(Map<String, dynamic> json) =>
      _$LatestImageFromJson(json);
}

@freezed
class Resolution with _$Resolution {
  const factory Resolution({
    @Default(0) int? width,
    @Default(0) int? height,
  }) = _Resolution;

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @Default('') String? latitude,
    @Default('') String? longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
