import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'organisation_model.freezed.dart';
part 'organisation_model.g.dart';

OrganisationModel organisationModelFromJson(String str) =>
    OrganisationModel.fromJson(json.decode(str));

String organisationModelToJson(OrganisationModel data) =>
    json.encode(data.toJson());

@freezed
class OrganisationModel with _$OrganisationModel {
  const factory OrganisationModel({
    Preferences? preferences,
    @JsonKey(name: "_id") String? id,
    String? name,
    String? domain,
    String? organisationModelId,
    String? logoUrl,
    String? emailHeaderLogoUrl,
  }) = _OrganisationModel;

  factory OrganisationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganisationModelFromJson(json);
}

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    List<LoginImage>? loginImages,
    String? primaryColor,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}

@freezed
class LoginImage with _$LoginImage {
  const factory LoginImage({
    String? filepath,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
  }) = _LoginImage;

  factory LoginImage.fromJson(Map<String, dynamic> json) =>
      _$LoginImageFromJson(json);
}
