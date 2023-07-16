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
    Details? details,
    Location? location,
    String? id,
    String? name,
    String? installationDate,
    String? status,
    DateTime? lastUpdated,
    AvailablePlugins? availablePlugins,
    dynamic pointedTo,
    String? reseller,
    String? client,
    String? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? streamingUrl,
  }) = _CctvCameraModel;

  factory CctvCameraModel.fromJson(Map<String, dynamic> json) =>
      _$CctvCameraModelFromJson(json);
}

@freezed
class AvailablePlugins with _$AvailablePlugins {
  const factory AvailablePlugins() = _AvailablePlugins;

  factory AvailablePlugins.fromJson(Map<String, dynamic> json) =>
      _$AvailablePluginsFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    String? type,
    String? version,
    dynamic unitId,
    dynamic unitSecret,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
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
