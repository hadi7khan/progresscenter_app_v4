// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteGalleryModel _$$_SiteGalleryModelFromJson(Map<String, dynamic> json) =>
    _$_SiteGalleryModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      takenAtDate: json['takenAtDate'] as String?,
      takenAtTime: json['takenAtTime'] as String?,
      path: json['path'] as String?,
      coverImage: json['coverImage'] as String?,
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
    );

Map<String, dynamic> _$$_SiteGalleryModelToJson(_$_SiteGalleryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'id': instance.id,
      'name': instance.name,
      'takenAtDate': instance.takenAtDate,
      'takenAtTime': instance.takenAtTime,
      'path': instance.path,
      'coverImage': instance.coverImage,
      'status': instance.status,
      'type': instance.type,
      'reseller': instance.reseller,
      'client': instance.client,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      name: json['name'] as String?,
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
