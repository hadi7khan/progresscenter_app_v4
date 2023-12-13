// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteGalleryModel _$$_SiteGalleryModelFromJson(Map<String, dynamic> json) =>
    _$_SiteGalleryModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      reseller: json['reseller'] as String?,
      client: json['client'] as String?,
      project: json['project'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$_SiteGalleryModelToJson(_$_SiteGalleryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'status': instance.status,
      'type': instance.type,
      'reseller': instance.reseller,
      'client': instance.client,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
      'user': instance.user,
    };
