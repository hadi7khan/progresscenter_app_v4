import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required Preset preset,
    @JsonKey(name: '_id') required String id,
    required String? name,
    required String? username,
    required String? email,
    required String? role,
    required String? status,
    @Default("") String dp,
    @Default("N/A") String? designation,
    required List<String>? tags,
    required List<String>? projects,
    DateTime? lastActive,
    @Default("") String? dpUrl,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    required String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
