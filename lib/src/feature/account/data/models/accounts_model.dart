import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

part 'accounts_model.freezed.dart';
part 'accounts_model.g.dart';

AccountsModel accountsModelFromJson(String str) =>
    AccountsModel.fromJson(json.decode(str));

String accountsModelToJson(AccountsModel data) => json.encode(data.toJson());

@freezed
class AccountsModel with _$AccountsModel {
  const factory AccountsModel({
    Preset? preset,
    Preferences? preferences,
    @JsonKey(name: "_id") String? id,
    String? name,
    String? username,
    String? email,
    String? role,
    String? status,
    @Default("") String? dob,
    String? dp,
    String? designation,
    List<String>? tags,
    List<ProjectModel>? projects,
    @Default(Phone()) Phone? phone,
    List<String>? hiddenProjects,
    String? accountsModelId,
    String? dpUrl,
  }) = _AccountsModel;

  factory AccountsModel.fromJson(Map<String, dynamic> json) =>
      _$AccountsModelFromJson(json);
}

@freezed
class Phone with _$Phone {
  const factory Phone({
    @Default("") String? dialCode,
    @Default("") String? countryCode,
    @Default("") String? number,
    @Default("") String? fullNumber,
    @Default("") String? id,
  }) = _Phone;

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);
}

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    String? primaryColor,
    String? timezone,
    bool? isEmailNotificationEnabled,
    bool? show4K,
    bool? showTimestamp,
    bool? showZoomed,
    String? theme,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    int? maxDocSize,
    int? totalSpace,
    int? totalSpaceUsed,
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    Location? location,
    String? id,
    String? name,
    List<Image>? images,
    String? status,
    String? parentId,
    bool? hasCameras,
    int? hierarchyLevel,
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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    String? name,
    String? latitude,
    String? longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
