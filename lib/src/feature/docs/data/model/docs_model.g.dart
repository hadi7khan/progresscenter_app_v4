// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocsModel _$$_DocsModelFromJson(Map<String, dynamic> json) => _$_DocsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdBy: json['createdBy'] == null
          ? null
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      client: json['client'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_DocsModelToJson(_$_DocsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'client': instance.client,
      'files': instance.files,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_CreatedBy _$$_CreatedByFromJson(Map<String, dynamic> json) => _$_CreatedBy(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      createdById: json['createdById'] as String?,
      dpUrl: json['dpUrl'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_CreatedByToJson(_$_CreatedBy instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'designation': instance.designation,
      'createdById': instance.createdById,
      'dpUrl': instance.dpUrl,
      'email': instance.email,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };

_$_FileElement _$$_FileElementFromJson(Map<String, dynamic> json) =>
    _$_FileElement(
      name: json['name'] as String?,
      path: json['path'] as String?,
      fileSize: json['fileSize'] as String?,
      uploadedBy: json['uploadedBy'] == null
          ? null
          : UploadedBy.fromJson(json['uploadedBy'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_FileElementToJson(_$_FileElement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'fileSize': instance.fileSize,
      'uploadedBy': instance.uploadedBy,
      'users': instance.users,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };

_$_UploadedBy _$$_UploadedByFromJson(Map<String, dynamic> json) =>
    _$_UploadedBy(
      id: json['id'] as String?,
      name: json['name'] as String?,
      uploadedById: json['uploadedById'] as String?,
    );

Map<String, dynamic> _$$_UploadedByToJson(_$_UploadedBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uploadedById': instance.uploadedById,
    };
