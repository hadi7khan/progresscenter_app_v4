import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'progress_line_model.freezed.dart';
part 'progress_line_model.g.dart';

List<ProgressLineModel> progressLineModelFromJson(String str) =>
    List<ProgressLineModel>.from(
        json.decode(str).map((x) => ProgressLineModel.fromJson(x)));

String progressLineModelToJson(List<ProgressLineModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProgressLineModel with _$ProgressLineModel {
  const factory ProgressLineModel({
    String? id,
    String? caption,
    String? file,
    String? mediaType,
    List<Comment>? comments,
    List<User>? viewedBy,
    User? user,
    String? camera,
    Project? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
  }) = _ProgressLineModel;

  factory ProgressLineModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressLineModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    User? user,
    String? body,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    String? id,
    String? name,
    String? dp,
    String? designation,
    String? userId,
    String? dpUrl,
    String? role,
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

@freezed
class Project with _$Project {
  const factory Project({
    String? id,
    String? name,
    List<Image>? images,
    String? projectId,
    String? coverImageUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    String? name,
    String? id,
    String? createdAt,
    String? updatedAt,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
