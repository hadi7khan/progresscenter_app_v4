// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketByIdModel _$$_TicketByIdModelFromJson(Map<String, dynamic> json) =>
    _$_TicketByIdModel(
      id: json['_id'] as String?,
      topic: json['topic'] as String,
      subject: json['subject'] as String,
      detail: json['detail'] as String,
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_TicketByIdModelToJson(_$_TicketByIdModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'topic': instance.topic,
      'subject': instance.subject,
      'detail': instance.detail,
      'status': instance.status,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: Preset.fromJson(json['preset'] as Map<String, dynamic>),
      userId: json['_id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      '_id': instance.userId,
      'name': instance.name,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
