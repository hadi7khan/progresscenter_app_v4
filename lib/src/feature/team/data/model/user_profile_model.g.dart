// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileModel _$$_UserProfileModelFromJson(Map<String, dynamic> json) =>
    _$_UserProfileModel(
      preset: Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['_id'] as String,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      dp: json['dp'] as String? ?? "",
      designation: json['designation'] as String? ?? "N/A",
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastActive: json['lastActive'] == null
          ? null
          : DateTime.parse(json['lastActive'] as String),
      dpUrl: json['dpUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserProfileModelToJson(_$_UserProfileModel instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'dp': instance.dp,
      'designation': instance.designation,
      'tags': instance.tags,
      'projects': instance.projects,
      'lastActive': instance.lastActive?.toIso8601String(),
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
