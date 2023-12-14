import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'project_by_id_model.freezed.dart';
part 'project_by_id_model.g.dart';

ProjectByIdModel projectByIdModelFromJson(String str) =>
    ProjectByIdModel.fromJson(json.decode(str));

String? projectByIdModelToJson(ProjectByIdModel data) =>
    json.encode(data.toJson());

@freezed
class ProjectByIdModel with _$ProjectByIdModel {
  const factory ProjectByIdModel({
    Location? location,
    @JsonKey(name: '_id') String? id,
    String? name,
    List<Image>? images,
    String? status,
    List<Asset>? assets,
    String? activity,
    DateTime? lastUpdated,
    dynamic parentId,
    bool? hasCameras,
    int? hierarchyLevel,
    String? reseller,
    String? client,
    DateTime? createdAt,
    DateTime? updatedAt,
    AiStats? aiStats,
    int? constructionDays,
    String? projectByIdModelId,
    List<User>? users,
  }) = _ProjectByIdModel;

  factory ProjectByIdModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectByIdModelFromJson(json);
}

@freezed
class AiStats with _$AiStats {
  const factory AiStats({
    int? activityScore,
    double? ppeScore,
  }) = _AiStats;

  factory AiStats.fromJson(Map<String, dynamic> json) =>
      _$AiStatsFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    String? name,
    int? count,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    String? name,
    @JsonKey(name: '_id') String? imageId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    String? name,
    dynamic latitude,
    dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    String? id,
    String? name,
    String? email,
    String? role,
    String? dp,
    String? userId,
    String? dpUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
