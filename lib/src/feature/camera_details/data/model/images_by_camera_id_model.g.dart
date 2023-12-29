// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_by_camera_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImagesByCameraIdModel _$$_ImagesByCameraIdModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImagesByCameraIdModel(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentImage: json['currentImage'] == null
          ? null
          : Image.fromJson(json['currentImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImagesByCameraIdModelToJson(
        _$_ImagesByCameraIdModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'images': instance.images,
      'currentImage': instance.currentImage,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      resolution: json['resolution'] == null
          ? null
          : Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      datetime: json['datetime'] as String?,
      camera: json['camera'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      imageId: json['imageId'] as String?,
      urlThumb: json['urlThumb'] as String?,
      urlPreview: json['urlPreview'] as String?,
      url4K: json['url4K'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'resolution': instance.resolution,
      '_id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'time': instance.time,
      'datetime': instance.datetime,
      'camera': instance.camera,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'imageId': instance.imageId,
      'urlThumb': instance.urlThumb,
      'urlPreview': instance.urlPreview,
      'url4K': instance.url4K,
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
