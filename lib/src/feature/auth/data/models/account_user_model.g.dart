// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountUserModel _$$_AccountUserModelFromJson(Map<String, dynamic> json) =>
    _$_AccountUserModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] == null
          ? null
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
      designation: json['designation'] as String?,
      role: json['role'] as String?,
      dp: json['dp'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      preferences: json['preferences'] == null
          ? null
          : AccountUserModelPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>),
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      projectSortOrder:
          (json['projectSortOrder'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_AccountUserModelToJson(_$_AccountUserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'designation': instance.designation,
      'role': instance.role,
      'dp': instance.dp,
      'tags': instance.tags,
      'preferences': instance.preferences,
      'preset': instance.preset,
      'projectSortOrder': instance.projectSortOrder,
      'client': instance.client,
      'dpUrl': instance.dpUrl,
    };

_$_Client _$$_ClientFromJson(Map<String, dynamic> json) => _$_Client(
      name: json['name'] as String?,
      logo: json['logo'],
      preferences: json['preferences'] == null
          ? null
          : ClientPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>),
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'preferences': instance.preferences,
      'logoUrl': instance.logoUrl,
    };

_$_ClientPreferences _$$_ClientPreferencesFromJson(Map<String, dynamic> json) =>
    _$_ClientPreferences(
      hasCdnEnabled: json['hasCdnEnabled'] as bool?,
      loginImages: (json['loginImages'] as List<dynamic>?)
          ?.map((e) => LoginImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryColor: json['primaryColor'] as String?,
    );

Map<String, dynamic> _$$_ClientPreferencesToJson(
        _$_ClientPreferences instance) =>
    <String, dynamic>{
      'hasCdnEnabled': instance.hasCdnEnabled,
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
    );

Map<String, dynamic> _$$_LoginImageToJson(_$_LoginImage instance) =>
    <String, dynamic>{
      'filepath': instance.filepath,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_Phone _$$_PhoneFromJson(Map<String, dynamic> json) => _$_Phone(
      dialCode: json['dialCode'] as String?,
      countryCode: json['countryCode'] as String?,
      number: json['number'] as String?,
      fullNumber: json['fullNumber'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_PhoneToJson(_$_Phone instance) => <String, dynamic>{
      'dialCode': instance.dialCode,
      'countryCode': instance.countryCode,
      'number': instance.number,
      'fullNumber': instance.fullNumber,
      'id': instance.id,
    };

_$_AccountUserModelPreferences _$$_AccountUserModelPreferencesFromJson(
        Map<String, dynamic> json) =>
    _$_AccountUserModelPreferences(
      primaryColor: json['primaryColor'] as String?,
      timezone: json['timezone'] as String?,
      isEmailNotificationEnabled: json['isEmailNotificationEnabled'] as bool?,
      show4K: json['show4K'] as bool?,
      showTimestamp: json['showTimestamp'] as bool?,
      showZoomed: json['showZoomed'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$$_AccountUserModelPreferencesToJson(
        _$_AccountUserModelPreferences instance) =>
    <String, dynamic>{
      'primaryColor': instance.primaryColor,
      'timezone': instance.timezone,
      'isEmailNotificationEnabled': instance.isEmailNotificationEnabled,
      'show4K': instance.show4K,
      'showTimestamp': instance.showTimestamp,
      'showZoomed': instance.showZoomed,
      'theme': instance.theme,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      maxDocSize: json['maxDocSize'] as int?,
      totalSpace: json['totalSpace'] as int?,
      totalSpaceUsed: json['totalSpaceUsed'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'maxDocSize': instance.maxDocSize,
      'totalSpace': instance.totalSpace,
      'totalSpaceUsed': instance.totalSpaceUsed,
      'color': instance.color,
    };
