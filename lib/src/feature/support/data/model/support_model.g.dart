// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportModel _$$_SupportModelFromJson(Map<String, dynamic> json) =>
    _$_SupportModel(
      id: json['id'] as String,
      topic: json['topic'] as String,
      subject: json['subject'] as String,
      detail: json['detail'] as String,
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_SupportModelToJson(_$_SupportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'subject': instance.subject,
      'detail': instance.detail,
      'status': instance.status,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      name: json['name'] as String,
      userId: json['_id'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      '_id': instance.userId,
    };
