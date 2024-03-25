import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'comments_model.freezed.dart';
part 'comments_model.g.dart';

List<CommentsModel> commentsModelFromJson(String str) =>
    List<CommentsModel>.from(
        json.decode(str).map((x) => CommentsModel.fromJson(x)));

String commentsModelToJson(List<CommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class CommentsModel with _$CommentsModel {
  const factory CommentsModel({
    @Default(User()) User? user,
    @Default('') String? body,
    @JsonKey(name: '_id') required String id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CommentsModel;

  factory CommentsModel.fromJson(Map<String, dynamic> json) =>
      _$CommentsModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    @JsonKey(name: '_id') String? id,
    @Default('') String? name,
    @Default('') String? designation,
    @Default('') String? userId,
    @Default('') String? dpUrl,
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
