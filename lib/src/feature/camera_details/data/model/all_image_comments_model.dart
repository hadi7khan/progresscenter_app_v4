import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'all_image_comments_model.freezed.dart';
part 'all_image_comments_model.g.dart';

AllImageCommentsModel allImageCommentsModelFromJson(String str) =>
    AllImageCommentsModel.fromJson(json.decode(str));

String allImageCommentsModelToJson(AllImageCommentsModel data) =>
    json.encode(data.toJson());

@freezed
class AllImageCommentsModel with _$AllImageCommentsModel {
  const factory AllImageCommentsModel({
    int? count,
    List<Comment>? comments,
  }) = _AllImageCommentsModel;

  factory AllImageCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$AllImageCommentsModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    Position? position,
    @JsonKey(name: "_id") String? id,
    String? imageName,
    String? camera,
    String? message,
    User? user,
    List<Reply>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class Position with _$Position {
  const factory Position({
    double? x,
    double? y,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
class Reply with _$Reply {
  const factory Reply({
    String? message,
    String? user,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    Preferences? preferences,
    @JsonKey(name: "_id") String? userId,
    String? name,
    String? dp,
    String? dpUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    String? primaryColor,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
