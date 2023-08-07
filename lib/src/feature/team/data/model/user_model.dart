import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    Preset? preset,
    CreatedBy? createdBy,
    String? id,
    String? name,
    String? email,
    String? role,
    String? status,
    String? dp,
    String? designation,
    List<String>? tags,
    List<Project>? projects,
    String? lastActive,
    String? userModelId,
    String? dpUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    Preset? preset,
    String? id,
    String? name,
    dynamic dp,
    String? designation,
    String? createdById,
    dynamic dpUrl,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
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
    String? projectId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
