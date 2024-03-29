// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountsModel _$$_AccountsModelFromJson(Map<String, dynamic> json) =>
    _$_AccountsModel(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      dob: json['dob'] as String? ?? "",
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: json['phone'] == null
          ? const Phone()
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
      hiddenProjects: (json['hiddenProjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accountsModelId: json['accountsModelId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_AccountsModelToJson(_$_AccountsModel instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'preferences': instance.preferences,
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'dob': instance.dob,
      'dp': instance.dp,
      'designation': instance.designation,
      'tags': instance.tags,
      'projects': instance.projects,
      'phone': instance.phone,
      'hiddenProjects': instance.hiddenProjects,
      'accountsModelId': instance.accountsModelId,
      'dpUrl': instance.dpUrl,
    };

_$_Phone _$$_PhoneFromJson(Map<String, dynamic> json) => _$_Phone(
      dialCode: json['dialCode'] as String? ?? "",
      countryCode: json['countryCode'] as String? ?? "",
      number: json['number'] as String? ?? "",
      fullNumber: json['fullNumber'] as String? ?? "",
      id: json['id'] as String? ?? "",
    );

Map<String, dynamic> _$$_PhoneToJson(_$_Phone instance) => <String, dynamic>{
      'dialCode': instance.dialCode,
      'countryCode': instance.countryCode,
      'number': instance.number,
      'fullNumber': instance.fullNumber,
      'id': instance.id,
    };

_$_Preferences _$$_PreferencesFromJson(Map<String, dynamic> json) =>
    _$_Preferences(
      primaryColor: json['primaryColor'] as String?,
      timezone: json['timezone'] as String?,
      isEmailNotificationEnabled: json['isEmailNotificationEnabled'] as bool?,
      show4K: json['show4K'] as bool?,
      showTimestamp: json['showTimestamp'] as bool?,
      showZoomed: json['showZoomed'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$$_PreferencesToJson(_$_Preferences instance) =>
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
