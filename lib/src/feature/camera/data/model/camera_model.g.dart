// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CameraModel _$$_CameraModelFromJson(Map<String, dynamic> json) =>
    _$_CameraModel(
      location: json['location'] == null
          ? const Location()
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String? ?? '',
      installationDate: json['installationDate'] as String? ?? '',
      status: json['status'] as String? ?? '',
      orientation: json['orientation'] as String? ?? '',
      project: json['project'] as String? ?? '',
      latestImage: json['latestImage'] == null
          ? null
          : LatestImage.fromJson(json['latestImage'] as Map<String, dynamic>),
      hasImages: json['hasImages'] as bool? ?? false,
      enabledFeaturesList: (json['enabledFeaturesList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CameraModelToJson(_$_CameraModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'installationDate': instance.installationDate,
      'status': instance.status,
      'orientation': instance.orientation,
      'project': instance.project,
      'latestImage': instance.latestImage,
      'hasImages': instance.hasImages,
      'enabledFeaturesList': instance.enabledFeaturesList,
    };

_$_LatestImage _$$_LatestImageFromJson(Map<String, dynamic> json) =>
    _$_LatestImage(
      resolution: json['resolution'] == null
          ? const Resolution()
          : Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      datetime: json['datetime'] as String? ?? '',
      url4K: json['url4K'] as String? ?? "",
      urlPreview: json['urlPreview'] as String? ?? "",
      urlThumb: json['urlThumb'] as String? ?? "",
    );

Map<String, dynamic> _$$_LatestImageToJson(_$_LatestImage instance) =>
    <String, dynamic>{
      'resolution': instance.resolution,
      'name': instance.name,
      'date': instance.date,
      'time': instance.time,
      'datetime': instance.datetime,
      'url4K': instance.url4K,
      'urlPreview': instance.urlPreview,
      'urlThumb': instance.urlThumb,
    };

_$_Resolution _$$_ResolutionFromJson(Map<String, dynamic> json) =>
    _$_Resolution(
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ResolutionToJson(_$_Resolution instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
