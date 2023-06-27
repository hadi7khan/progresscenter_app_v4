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
    String? id,
    String? name,
    List<Image>? images,
    String? status,
    String? activity,
    DateTime? lastUpdated,
    dynamic parentId,
    bool? hasCameras,
    int? hierarchyLevel,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? constructionDays,
    String? projectModelId,
    List<User>? users,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    String? name,
    String? id,
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
    String? dp,
    List<String>? projects,
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
