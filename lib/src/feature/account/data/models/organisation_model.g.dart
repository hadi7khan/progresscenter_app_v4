// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrganisationModel _$$_OrganisationModelFromJson(Map<String, dynamic> json) =>
    _$_OrganisationModel(
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      domain: json['domain'] as String?,
      organisationModelId: json['organisationModelId'] as String?,
      logoUrl: json['logoUrl'] as String?,
      emailHeaderLogoUrl: json['emailHeaderLogoUrl'] as String?,
    );

Map<String, dynamic> _$$_OrganisationModelToJson(
        _$_OrganisationModel instance) =>
    <String, dynamic>{
      'preferences': instance.preferences,
      '_id': instance.id,
      'name': instance.name,
      'domain': instance.domain,
      'organisationModelId': instance.organisationModelId,
      'logoUrl': instance.logoUrl,
      'emailHeaderLogoUrl': instance.emailHeaderLogoUrl,
    };

_$_Preferences _$$_PreferencesFromJson(Map<String, dynamic> json) =>
    _$_Preferences(
      loginImages: (json['loginImages'] as List<dynamic>?)
          ?.map((e) => LoginImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryColor: json['primaryColor'] as String?,
    );

Map<String, dynamic> _$$_PreferencesToJson(_$_Preferences instance) =>
    <String, dynamic>{
      'loginImages': instance.loginImages,
      'primaryColor': instance.primaryColor,
    };

_$_LoginImage _$$_LoginImageFromJson(Map<String, dynamic> json) =>
    _$_LoginImage(
      filepath: json['filepath'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_LoginImageToJson(_$_LoginImage instance) =>
    <String, dynamic>{
      'filepath': instance.filepath,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };
