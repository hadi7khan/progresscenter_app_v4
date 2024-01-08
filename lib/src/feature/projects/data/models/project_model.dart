import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

List<ProjectModel> projectModelFromJson(String str) => List<ProjectModel>.from(
    json.decode(str).map((x) => ProjectModel.fromJson(x)));

String projectModelToJson(List<ProjectModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    Location? location,
    @JsonKey(name: '_id') String? id,
    String? name,
    List<ProjectImage>? images,
    String? status,
    List<Asset>? assets,
    String? activity,
    DateTime? lastUpdated,
    dynamic parentId,
    bool? hasCameras,
    int? hierarchyLevel,
    DateTime? createdAt,
    DateTime? updatedAt,
    AiStats? aiStats,
    int? constructionDays,
    String? projectModelId,
    List<User>? users,
    List<ProjectModel>? children,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
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
class ProjectImage with _$ProjectImage {
  const factory ProjectImage({
    @JsonKey(name: '_id') String? imageId,
    String? url,
  }) = _ProjectImage;

  factory ProjectImage.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    String? name,
    @JsonKey(name: '_id') String? id,
    int? count,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
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
    @JsonKey(name: '_id') String? userId,
    String? name,
    String? email,
    String? dp,
    String? role,
    List<String>? projects,
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
