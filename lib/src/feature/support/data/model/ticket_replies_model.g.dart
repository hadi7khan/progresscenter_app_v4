// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_replies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketRepliesModel _$$_TicketRepliesModelFromJson(
        Map<String, dynamic> json) =>
    _$_TicketRepliesModel(
      id: json['_id'] as String?,
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      supportTicket: json['supportTicket'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$$_TicketRepliesModelToJson(
        _$_TicketRepliesModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'user': instance.user,
      'supportTicket': instance.supportTicket,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'userType': instance.userType,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
