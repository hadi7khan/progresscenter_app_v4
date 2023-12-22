import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'cctv_camera_model.freezed.dart';
part 'cctv_camera_model.g.dart';

List<CctvCameraModel> cctvCameraModelFromJson(String str) =>
    List<CctvCameraModel>.from(
        json.decode(str).map((x) => CctvCameraModel.fromJson(x)));

String cctvCameraModelToJson(List<CctvCameraModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CctvCameraModel with _$CctvCameraModel {
  const factory CctvCameraModel({
    Location? location,
    dynamic folderId,
    String? timezone,
    dynamic camera,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? installationDate,
    String? streamingUrl,
    String? status,
    String? reseller,
    String? client,
    String? qLiveUnit,
    String? project,
    DateTime? createdAt,
    DateTime? lastUpdated,
    LatestImage? latestImage,
    DateTime? updatedAt,
  }) = _CctvCameraModel;

  factory CctvCameraModel.fromJson(Map<String, dynamic> json) =>
      _$CctvCameraModelFromJson(json);
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
    String? url,
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
