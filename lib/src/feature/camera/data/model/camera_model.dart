// To parse this JSON data, do
//
//     final cameraModel = cameraModelFromJson(jsonString);

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
    Details? details,
    Location? location,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? installationDate,
    String? status,
    DateTime? lastUpdated,
    String? orientation,
    dynamic pointedTo,
    String? reseller,
    String? client,
    String? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    LatestImage? latestImage,
    List<String>? enabledFeaturesList,
    bool? hasImages,
    String? cameraModelId,
    EnabledFeatures? enabledFeatures,
  }) = _CameraModel;

  factory CameraModel.fromJson(Map<String, dynamic> json) =>
      _$CameraModelFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    String? type,
    String? version,
    String? unitId,
    dynamic unitSecret,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}

@freezed
class EnabledFeatures with _$EnabledFeatures {
  const factory EnabledFeatures({
    Ai? ai,
  }) = _EnabledFeatures;

  factory EnabledFeatures.fromJson(Map<String, dynamic> json) =>
      _$EnabledFeaturesFromJson(json);
}

@freezed
class Ai with _$Ai {
  const factory Ai({
    String? id,
  }) = _Ai;

  factory Ai.fromJson(Map<String, dynamic> json) => _$AiFromJson(json);
}

@freezed
class LatestImage with _$LatestImage {
  const factory LatestImage({
    Resolution? resolution,
    String? name,
    String? date,
    String? time,
    String? datetime,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    int? width,
    int? height,
  }) = _Resolution;

  factory Resolution.fromJson(Map<String, dynamic> json) =>
      _$ResolutionFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    String? latitude,
    String? longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
