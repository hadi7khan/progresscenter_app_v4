// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_lean_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectLeanModel _$$_ProjectLeanModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectLeanModel(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      projectId: json['_id'] as String,
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      parentId: json['parentId'] as String?,
      hasCameras: json['hasCameras'] as bool,
      hierarchyLevel: json['hierarchyLevel'] as int,
      coverImageUrl: json['coverImageUrl'] as String?,
    );

Map<String, dynamic> _$$_ProjectLeanModelToJson(_$_ProjectLeanModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      '_id': instance.projectId,
      'name': instance.name,
      'images': instance.images,
      'status': instance.status,
      'parentId': instance.parentId,
      'hasCameras': instance.hasCameras,
      'hierarchyLevel': instance.hierarchyLevel,
      'coverImageUrl': instance.coverImageUrl,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      name: json['name'] as String,
      imageId: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'name': instance.name,
      '_id': instance.imageId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      name: json['name'] as String,
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
