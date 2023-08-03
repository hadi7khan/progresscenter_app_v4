// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CameraModel _$$_CameraModelFromJson(Map<String, dynamic> json) =>
    _$_CameraModel(
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      installationDate: json['installationDate'] as String?,
      status: json['status'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      orientation: json['orientation'] as String?,
      pointedTo: json['pointedTo'],
      reseller: json['reseller'] as String?,
      client: json['client'] as String?,
      project: json['project'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      latestImage: json['latestImage'] == null
          ? null
          : LatestImage.fromJson(json['latestImage'] as Map<String, dynamic>),
      enabledFeaturesList: (json['enabledFeaturesList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasImages: json['hasImages'] as bool?,
      cameraModelId: json['cameraModelId'] as String?,
      enabledFeatures: json['enabledFeatures'] == null
          ? null
          : EnabledFeatures.fromJson(
              json['enabledFeatures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CameraModelToJson(_$_CameraModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'installationDate': instance.installationDate,
      'status': instance.status,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'orientation': instance.orientation,
      'pointedTo': instance.pointedTo,
      'reseller': instance.reseller,
      'client': instance.client,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'latestImage': instance.latestImage,
      'enabledFeaturesList': instance.enabledFeaturesList,
      'hasImages': instance.hasImages,
      'cameraModelId': instance.cameraModelId,
      'enabledFeatures': instance.enabledFeatures,
    };

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      type: json['type'] as String?,
      version: json['version'] as String?,
      unitId: json['unitId'] as String?,
      unitSecret: json['unitSecret'],
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'type': instance.type,
      'version': instance.version,
      'unitId': instance.unitId,
      'unitSecret': instance.unitSecret,
    };

_$_EnabledFeatures _$$_EnabledFeaturesFromJson(Map<String, dynamic> json) =>
    _$_EnabledFeatures(
      ai: json['ai'] == null
          ? null
          : Ai.fromJson(json['ai'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EnabledFeaturesToJson(_$_EnabledFeatures instance) =>
    <String, dynamic>{
      'ai': instance.ai,
    };

_$_Ai _$$_AiFromJson(Map<String, dynamic> json) => _$_Ai(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_AiToJson(_$_Ai instance) => <String, dynamic>{
      'id': instance.id,
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
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url4K': instance.url4K,
      'urlPreview': instance.urlPreview,
      'urlThumb': instance.urlThumb,
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
