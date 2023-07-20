// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CameraByIdModel _$$_CameraByIdModelFromJson(Map<String, dynamic> json) =>
    _$_CameraByIdModel(
      details: json['details'] == null
          ? null
          : CameraByIdModelDetails.fromJson(
              json['details'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      timezone: json['timezone'] as String?,
      id: json['id'] as String?,
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
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      enabledFeatures: json['enabledFeatures'] == null
          ? null
          : EnabledFeatures.fromJson(
              json['enabledFeatures'] as Map<String, dynamic>),
      latestImage: json['latestImage'] == null
          ? null
          : LatestImage.fromJson(json['latestImage'] as Map<String, dynamic>),
      storage: json['storage'] == null
          ? null
          : Storage.fromJson(json['storage'] as Map<String, dynamic>),
      enabledFeaturesList: (json['enabledFeaturesList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasImages: json['hasImages'] as bool?,
      cameraByIdModelId: json['cameraByIdModelId'] as String?,
    );

Map<String, dynamic> _$$_CameraByIdModelToJson(_$_CameraByIdModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'location': instance.location,
      'timezone': instance.timezone,
      'id': instance.id,
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
      'enabledFeatures': instance.enabledFeatures,
      'latestImage': instance.latestImage,
      'storage': instance.storage,
      'enabledFeaturesList': instance.enabledFeaturesList,
      'hasImages': instance.hasImages,
      'cameraByIdModelId': instance.cameraByIdModelId,
    };

_$_CameraByIdModelDetails _$$_CameraByIdModelDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_CameraByIdModelDetails(
      type: json['type'] as String?,
      version: json['version'] as String?,
      unitId: json['unitId'] as String?,
      unitSecret: json['unitSecret'],
    );

Map<String, dynamic> _$$_CameraByIdModelDetailsToJson(
        _$_CameraByIdModelDetails instance) =>
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
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
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

_$_Storage _$$_StorageFromJson(Map<String, dynamic> json) => _$_Storage(
      type: json['type'] as String?,
      details: json['details'] == null
          ? null
          : StorageDetails.fromJson(json['details'] as Map<String, dynamic>),
      bucket: json['bucket'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_StorageToJson(_$_Storage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'details': instance.details,
      'bucket': instance.bucket,
      'id': instance.id,
    };

_$_StorageDetails _$$_StorageDetailsFromJson(Map<String, dynamic> json) =>
    _$_StorageDetails(
      region: json['region'] as String?,
      signatureVersion: json['signatureVersion'] as String?,
      accessKeyId: json['accessKeyId'] as String?,
      secretAccessKey: json['secretAccessKey'] as String?,
    );

Map<String, dynamic> _$$_StorageDetailsToJson(_$_StorageDetails instance) =>
    <String, dynamic>{
      'region': instance.region,
      'signatureVersion': instance.signatureVersion,
      'accessKeyId': instance.accessKeyId,
      'secretAccessKey': instance.secretAccessKey,
    };
