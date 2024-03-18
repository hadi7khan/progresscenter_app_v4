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
    @Default(Location()) Location? location,
    @JsonKey(name: '_id') required String id,
    String? name,
    @Default([]) List<ProjectImage>? images,
    @Default('') String coverImageUrl,
    @Default('') String status,
    @Default([]) List<Asset>? assets,
    @Default(null) DateTime? lastUpdated,
    @Default('') String? parentId,
    @Default(false) bool hasCameras,
    @Default(0) int hierarchyLevel,
    @Default(null) DateTime? createdAt,
    @Default(null) DateTime? updatedAt,
    @Default(AiStats()) AiStats? aiStats,
    @Default(0) int constructionDays,
    @Default([]) List<User>? users,
    @Default([]) List<ProjectModel>? children,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

@freezed
class AiStats with _$AiStats {
  const factory AiStats({
    @Default(0) int? activityScore,
    @Default(0.0) double? ppeScore,
  }) = _AiStats;

  factory AiStats.fromJson(Map<String, dynamic> json) =>
      _$AiStatsFromJson(json);
}

@freezed
class ProjectImage with _$ProjectImage {
  const factory ProjectImage({
    @JsonKey(name: '_id') String? imageId,
    @Default('') String? url,
  }) = _ProjectImage;

  factory ProjectImage.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    @Default('') String? name,
    @JsonKey(name: '_id') String? id,
    @Default(0) int? count,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @Default('') String? name,
    @Default('') dynamic latitude,
    @Default('') dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default(Preset()) Preset? preset,
    @JsonKey(name: '_id') String? userId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String role,
    @Default('') String dp,
    @Default('') String dpUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    @Default('') String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
