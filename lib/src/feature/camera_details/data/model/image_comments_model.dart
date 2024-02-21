import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'image_comments_model.freezed.dart';
part 'image_comments_model.g.dart';

ImageCommentsModel imageCommentsModelFromJson(String str) =>
    ImageCommentsModel.fromJson(json.decode(str));

String imageCommentsModelToJson(ImageCommentsModel data) =>
    json.encode(data.toJson());

@freezed
class ImageCommentsModel with _$ImageCommentsModel {
  const factory ImageCommentsModel({
    String? url,
    List<Comment>? comments,
  }) = _ImageCommentsModel;

  factory ImageCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$ImageCommentsModelFromJson(json);
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
    User? user,
    @JsonKey(name: "_id") String? replyId,
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
