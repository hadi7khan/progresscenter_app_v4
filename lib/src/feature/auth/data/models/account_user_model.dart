import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'account_user_model.freezed.dart';
part 'account_user_model.g.dart';

AccountUserModel accountUserModelFromJson(String str) =>
    AccountUserModel.fromJson(json.decode(str));

String accountUserModelToJson(AccountUserModel data) =>
    json.encode(data.toJson());

@freezed
class AccountUserModel with _$AccountUserModel {
  const factory AccountUserModel({
    @JsonKey(name: "_id") String? id,
    String? name,
    String? username,
    String? email,
    Phone? phone,
    String? designation,
    String? role,
    String? dp,
    List<String>? tags,
    AccountUserModelPreferences? preferences,
    Preset? preset,
    Map<String, int>? projectSortOrder,
    Client? client,
    String? dpUrl,
  }) = _AccountUserModel;

  factory AccountUserModel.fromJson(Map<String, dynamic> json) =>
      _$AccountUserModelFromJson(json);
}

@freezed
class Client with _$Client {
  const factory Client({
    String? name,
    dynamic logo,
    ClientPreferences? preferences,
    String? logoUrl,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
class ClientPreferences with _$ClientPreferences {
  const factory ClientPreferences({
    bool? hasCdnEnabled,
    List<LoginImage>? loginImages,
    String? primaryColor,
  }) = _ClientPreferences;

  factory ClientPreferences.fromJson(Map<String, dynamic> json) =>
      _$ClientPreferencesFromJson(json);
}

@freezed
class LoginImage with _$LoginImage {
  const factory LoginImage({
    String? filepath,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _LoginImage;

  factory LoginImage.fromJson(Map<String, dynamic> json) =>
      _$LoginImageFromJson(json);
}

@freezed
class Phone with _$Phone {
  const factory Phone({
    String? dialCode,
    String? countryCode,
    String? number,
    String? fullNumber,
    String? id,
  }) = _Phone;

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);
}

@freezed
class AccountUserModelPreferences with _$AccountUserModelPreferences {
  const factory AccountUserModelPreferences({
    String? primaryColor,
    String? timezone,
    bool? isEmailNotificationEnabled,
    bool? show4K,
    bool? showTimestamp,
    bool? showZoomed,
    String? theme,
  }) = _AccountUserModelPreferences;

  factory AccountUserModelPreferences.fromJson(Map<String, dynamic> json) =>
      _$AccountUserModelPreferencesFromJson(json);
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
