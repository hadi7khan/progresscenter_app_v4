import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'project_lean_model.freezed.dart';
part 'project_lean_model.g.dart';

List<ProjectLeanModel> projectLeanModelFromJson(String str) =>
    List<ProjectLeanModel>.from(
        json.decode(str).map((x) => ProjectLeanModel.fromJson(x)));

String projectLeanModelToJson(List<ProjectLeanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProjectLeanModel with _$ProjectLeanModel {
  const factory ProjectLeanModel({
    required Location location,
    @JsonKey(name: '_id') required String projectId,
    required String name,
    required List<Image> images,
    required String status,
    required String? parentId,
    required bool hasCameras,
    required int hierarchyLevel,
    required String? coverImageUrl,
  }) = _ProjectLeanModel;

  factory ProjectLeanModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectLeanModelFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    required String name,
    @JsonKey(name: '_id') required String imageId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required dynamic latitude,
    required dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
