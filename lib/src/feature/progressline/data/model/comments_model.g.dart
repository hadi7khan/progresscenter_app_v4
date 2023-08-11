// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentsModel _$$_CommentsModelFromJson(Map<String, dynamic> json) =>
    _$_CommentsModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_CommentsModelToJson(_$_CommentsModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'body': instance.body,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      userId: json['userId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'designation': instance.designation,
      'userId': instance.userId,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
