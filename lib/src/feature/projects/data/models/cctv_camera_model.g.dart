// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cctv_camera_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CctvCameraModel _$$_CctvCameraModelFromJson(Map<String, dynamic> json) =>
    _$_CctvCameraModel(
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      installationDate: json['installationDate'] as String?,
      status: json['status'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      availablePlugins: json['availablePlugins'] == null
          ? null
          : AvailablePlugins.fromJson(
              json['availablePlugins'] as Map<String, dynamic>),
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
      streamingUrl: json['streamingUrl'] as String?,
    );

Map<String, dynamic> _$$_CctvCameraModelToJson(_$_CctvCameraModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'location': instance.location,
      'id': instance.id,
      'name': instance.name,
      'installationDate': instance.installationDate,
      'status': instance.status,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'availablePlugins': instance.availablePlugins,
      'pointedTo': instance.pointedTo,
      'reseller': instance.reseller,
      'client': instance.client,
      'project': instance.project,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'streamingUrl': instance.streamingUrl,
    };

_$_AvailablePlugins _$$_AvailablePluginsFromJson(Map<String, dynamic> json) =>
    _$_AvailablePlugins();

Map<String, dynamic> _$$_AvailablePluginsToJson(_$_AvailablePlugins instance) =>
    <String, dynamic>{};

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      type: json['type'] as String?,
      version: json['version'] as String?,
      unitId: json['unitId'],
      unitSecret: json['unitSecret'],
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'type': instance.type,
      'version': instance.version,
      'unitId': instance.unitId,
      'unitSecret': instance.unitSecret,
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
