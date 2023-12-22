// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cctv_camera_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CctvCameraModel _$$_CctvCameraModelFromJson(Map<String, dynamic> json) =>
    _$_CctvCameraModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      folderId: json['folderId'],
      timezone: json['timezone'] as String?,
      camera: json['camera'],
      id: json['_id'] as String?,
      name: json['name'] as String?,
      installationDate: json['installationDate'] as String?,
      streamingUrl: json['streamingUrl'] as String?,
      status: json['status'] as String?,
      reseller: json['reseller'] as String?,
      client: json['client'] as String?,
      qLiveUnit: json['qLiveUnit'] as String?,
      project: json['project'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      latestImage: json['latestImage'] == null
          ? null
          : LatestImage.fromJson(json['latestImage'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CctvCameraModelToJson(_$_CctvCameraModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'folderId': instance.folderId,
      'timezone': instance.timezone,
      'camera': instance.camera,
      '_id': instance.id,
      'name': instance.name,
      'installationDate': instance.installationDate,
      'streamingUrl': instance.streamingUrl,
      'status': instance.status,
      'reseller': instance.reseller,
      'client': instance.client,
      'qLiveUnit': instance.qLiveUnit,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'latestImage': instance.latestImage,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_LatestImage _$$_LatestImageFromJson(Map<String, dynamic> json) =>
    _$_LatestImage(
      resolution: json['resolution'] == null
          ? null
          : Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
      name: json['name'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      datetime: json['datetime'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_LatestImageToJson(_$_LatestImage instance) =>
    <String, dynamic>{
      'resolution': instance.resolution,
      'name': instance.name,
      'date': instance.date,
      'time': instance.time,
      'datetime': instance.datetime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };

_$_Resolution _$$_ResolutionFromJson(Map<String, dynamic> json) =>
    _$_Resolution(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$_ResolutionToJson(_$_Resolution instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
