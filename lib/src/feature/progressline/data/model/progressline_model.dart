import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'progressline_model.freezed.dart';
part 'progressline_model.g.dart';

List<ProgressLineModel> progressLineModelFromJson(String str) =>
    List<ProgressLineModel>.from(
        json.decode(str).map((x) => ProgressLineModel.fromJson(x)));

String progressLineModelToJson(List<ProgressLineModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProgressLineModel with _$ProgressLineModel {
  const factory ProgressLineModel({
    @JsonKey(name: '_id') required String id,
    required String caption,
    required String file,
    required String mediaType,
    required List<Comment> comments,
    required List<User> viewedBy,
    required User user,
    required String camera,
    required Project project,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String url,
  }) = _ProgressLineModel;

  factory ProgressLineModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressLineModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required User user,
    required String body,
    @JsonKey(name: '_id') required String commentId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required Preset preset,
    @JsonKey(name: '_id') required String userId,
    required String name,
    @Default("") String? dp,
    String? designation,
    @Default("") String? dpUrl,
    String? role,
    DateTime? lastActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    required String color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    @JsonKey(name: '_id') required String projectId,
    required String name,
    required List<Image> images,
    required String coverImageUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
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
