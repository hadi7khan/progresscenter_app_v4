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
    @Default(0) int? count,
    @Default([]) List<Comment>? comments,
  }) = _AllImageCommentsModel;

  factory AllImageCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$AllImageCommentsModelFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default(Position()) Position? position,
    @JsonKey(name: "_id") String? id,
    @Default('') String? imageName,
    @Default('') String? message,
    @Default(User()) User? user,
    @Default([]) List<Reply>? replies,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class Position with _$Position {
  const factory Position({
    @Default(0.0) double? x,
    @Default(0.0) double? y,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
class Reply with _$Reply {
  const factory Reply({
    @Default('') String? message,
    @Default('') String? userId,
    @Default('') String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @Default(Preset()) Preset? preset,
    @Default(Preferences()) Preferences? preferences,
    @JsonKey(name: "_id") String? userId,
    @Default('') String? name,
    @Default('') String? dpUrl,
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
