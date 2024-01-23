// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MultiImagesModel _$$_MultiImagesModelFromJson(Map<String, dynamic> json) =>
    _$_MultiImagesModel(
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
      id: json['id'] as String?,
      filepath: json['filepath'] as String?,
      name: json['name'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      status: json['status'] as String?,
      camera: json['camera'] as String?,
      project: json['project'] as String?,
      client: json['client'] as String?,
      requestedBy: json['requestedBy'] == null
          ? null
          : RequestedBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      multiImagesModelId: json['multiImagesModelId'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_MultiImagesModelToJson(_$_MultiImagesModel instance) =>
    <String, dynamic>{
      'options': instance.options,
      'id': instance.id,
      'filepath': instance.filepath,
      'name': instance.name,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
      'camera': instance.camera,
      'project': instance.project,
      'client': instance.client,
      'requestedBy': instance.requestedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'multiImagesModelId': instance.multiImagesModelId,
      'url': instance.url,
    };

_$_Options _$$_OptionsFromJson(Map<String, dynamic> json) => _$_Options(
      hasTimestamp: json['hasTimestamp'] as bool?,
      imageQuality: json['imageQuality'] as String?,
    );

Map<String, dynamic> _$$_OptionsToJson(_$_Options instance) =>
    <String, dynamic>{
      'hasTimestamp': instance.hasTimestamp,
      'imageQuality': instance.imageQuality,
    };

_$_RequestedBy _$$_RequestedByFromJson(Map<String, dynamic> json) =>
    _$_RequestedBy(
      id: json['id'] as String?,
      name: json['name'] as String?,
      requestedById: json['requestedById'] as String?,
    );

Map<String, dynamic> _$$_RequestedByToJson(_$_RequestedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'requestedById': instance.requestedById,
    };
