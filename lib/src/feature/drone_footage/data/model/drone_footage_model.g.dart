// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone_footage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DroneFootageModel _$$_DroneFootageModelFromJson(Map<String, dynamic> json) =>
    _$_DroneFootageModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      takenAtDate: json['takenAtDate'] as String?,
      takenAtTime: json['takenAtTime'] as String?,
      coverImage: json['coverImage'] as String?,
      reseller: json['reseller'] as String?,
      client: json['client'] as String?,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
    );

Map<String, dynamic> _$$_DroneFootageModelToJson(
        _$_DroneFootageModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'details': instance.details,
      '_id': instance.id,
      'name': instance.name,
      'takenAtDate': instance.takenAtDate,
      'takenAtTime': instance.takenAtTime,
      'coverImage': instance.coverImage,
      'reseller': instance.reseller,
      'client': instance.client,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
      'coverImageUrl': instance.coverImageUrl,
    };

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      resolution: json['resolution'] as String?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'resolution': instance.resolution,
      'provider': instance.provider,
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

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as String?,
      name: json['name'] as String?,
      projectId: json['projectId'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projectId': instance.projectId,
    };
