// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drone_footage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DroneFootageModel _$$_DroneFootageModelFromJson(Map<String, dynamic> json) =>
    _$_DroneFootageModel(
      location: json['location'] == null
          ? const Location()
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      details: json['details'] == null
          ? const Details()
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      url: json['url'] as String? ?? '',
      status: json['status'] as String? ?? '',
      user: json['user'] as String? ?? '',
      shareUrl: json['shareUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_DroneFootageModelToJson(
        _$_DroneFootageModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'details': instance.details,
      '_id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'url': instance.url,
      'status': instance.status,
      'user': instance.user,
      'shareUrl': instance.shareUrl,
    };

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      provider: json['provider'] as String? ?? '',
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'provider': instance.provider,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      name: json['name'] as String? ?? '',
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
