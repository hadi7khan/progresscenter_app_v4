// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduledReportModel _$$_ScheduledReportModelFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduledReportModel(
      id: json['_id'] as String?,
      camera: json['camera'] as String?,
      user: json['user'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ScheduledReportModelToJson(
        _$_ScheduledReportModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'camera': instance.camera,
      'user': instance.user,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
