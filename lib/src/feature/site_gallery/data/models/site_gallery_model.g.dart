// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteGalleryModel _$$_SiteGalleryModelFromJson(Map<String, dynamic> json) =>
    _$_SiteGalleryModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_SiteGalleryModelToJson(_$_SiteGalleryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'type': instance.type,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
