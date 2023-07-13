// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lean_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLeanModel _$$_UserLeanModelFromJson(Map<String, dynamic> json) =>
    _$_UserLeanModel(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      dp: json['dp'] as String?,
      userLeanModelId: json['userLeanModelId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserLeanModelToJson(_$_UserLeanModel instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dp': instance.dp,
      'userLeanModelId': instance.userLeanModelId,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
