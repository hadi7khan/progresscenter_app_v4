// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientAccountsModel _$$_ClientAccountsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ClientAccountsModel(
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      clientAccountsModelId: json['clientAccountsModelId'] as String?,
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$$_ClientAccountsModelToJson(
        _$_ClientAccountsModel instance) =>
    <String, dynamic>{
      'preferences': instance.preferences,
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'clientAccountsModelId': instance.clientAccountsModelId,
      'logoUrl': instance.logoUrl,
    };

_$_Preferences _$$_PreferencesFromJson(Map<String, dynamic> json) =>
    _$_Preferences(
      primaryColor: json['primaryColor'] as String?,
    );

Map<String, dynamic> _$$_PreferencesToJson(_$_Preferences instance) =>
    <String, dynamic>{
      'primaryColor': instance.primaryColor,
    };
