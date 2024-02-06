import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'camera_by_id_model.freezed.dart';
part 'camera_by_id_model.g.dart';

CameraByIdModel cameraByIdModelFromJson(String str) =>
    CameraByIdModel.fromJson(json.decode(str));

String cameraByIdModelToJson(CameraByIdModel data) =>
    json.encode(data.toJson());

@freezed
class CameraByIdModel with _$CameraByIdModel {
  const factory CameraByIdModel({
    CameraByIdModelDetails? details,
    Location? location,
    String? timezone,
    String? id,
    String? name,
    String? installationDate,
    String? status,
    DateTime? lastUpdated,
    String? orientation,
    dynamic pointedTo,
    String? reseller,
    String? client,
    Project? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    EnabledFeatures? enabledFeatures,
    Storage? storage,
    List<String>? enabledFeaturesList,
    bool? hasImages,
    String? cameraByIdModelId,
    String? startDate,
    String? endDate,
  }) = _CameraByIdModel;

  factory CameraByIdModel.fromJson(Map<String, dynamic> json) =>
      _$CameraByIdModelFromJson(json);
}

@freezed
class CameraByIdModelDetails with _$CameraByIdModelDetails {
  const factory CameraByIdModelDetails({
    String? type,
    String? version,
    String? unitId,
    dynamic unitSecret,
  }) = _CameraByIdModelDetails;

  factory CameraByIdModelDetails.fromJson(Map<String, dynamic> json) =>
      _$CameraByIdModelDetailsFromJson(json);
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
    dynamic latitude,
    dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    String? id,
    String? name,
    String? projectId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class Storage with _$Storage {
  const factory Storage({
    String? type,
    StorageDetails? details,
    String? bucket,
    String? id,
  }) = _Storage;

  factory Storage.fromJson(Map<String, dynamic> json) =>
      _$StorageFromJson(json);
}

@freezed
class StorageDetails with _$StorageDetails {
  const factory StorageDetails({
    String? region,
    String? signatureVersion,
    String? accessKeyId,
    String? secretAccessKey,
  }) = _StorageDetails;

  factory StorageDetails.fromJson(Map<String, dynamic> json) =>
      _$StorageDetailsFromJson(json);
}
