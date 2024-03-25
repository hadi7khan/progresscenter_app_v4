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
    @JsonKey(name: '_id') required String? id,
    @Default("") String? caption,
    @Default([]) List<Comment>? comments,
    @Default([]) List<User>? viewedBy,
    @Default(User()) User? user,
    @Default('') String? camera,
    Project? project,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    @Default('') String? url,
  }) = _ProgressLineModel;

  factory ProgressLineModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressLineModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default(User()) User? user,
    @Default('') String? body,
    @JsonKey(name: '_id') String? commentId,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default(Preset()) Preset? preset,
    @JsonKey(name: '_id') String? userId,
    @Default('') String? name,
    @Default('') String? designation,
    @Default('') String? dpUrl,
    @Default('') String? role,
    DateTime? lastActive,
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
    @JsonKey(name: '_id') String? projectId,
    @Default('') String? name,
    @Default('') String? coverImageUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
