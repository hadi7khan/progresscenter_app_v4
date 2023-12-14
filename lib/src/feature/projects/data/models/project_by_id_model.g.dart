// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectByIdModel _$$_ProjectByIdModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectByIdModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      assets: (json['assets'] as List<dynamic>?)
          ?.map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList(),
      activity: json['activity'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      parentId: json['parentId'],
      hasCameras: json['hasCameras'] as bool?,
      hierarchyLevel: json['hierarchyLevel'] as int?,
      reseller: json['reseller'] as String?,
      client: json['client'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      aiStats: json['aiStats'] == null
          ? null
          : AiStats.fromJson(json['aiStats'] as Map<String, dynamic>),
      constructionDays: json['constructionDays'] as int?,
      projectByIdModelId: json['projectByIdModelId'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectByIdModelToJson(_$_ProjectByIdModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'status': instance.status,
      'assets': instance.assets,
      'activity': instance.activity,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'parentId': instance.parentId,
      'hasCameras': instance.hasCameras,
      'hierarchyLevel': instance.hierarchyLevel,
      'reseller': instance.reseller,
      'client': instance.client,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'aiStats': instance.aiStats,
      'constructionDays': instance.constructionDays,
      'projectByIdModelId': instance.projectByIdModelId,
      'users': instance.users,
    };

_$_AiStats _$$_AiStatsFromJson(Map<String, dynamic> json) => _$_AiStats(
      activityScore: json['activityScore'] as int?,
      ppeScore: (json['ppeScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AiStatsToJson(_$_AiStats instance) =>
    <String, dynamic>{
      'activityScore': instance.activityScore,
      'ppeScore': instance.ppeScore,
    };

_$_Asset _$$_AssetFromJson(Map<String, dynamic> json) => _$_Asset(
      name: json['name'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      name: json['name'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
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

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      dp: json['dp'] as String?,
      userId: json['userId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'dp': instance.dp,
      'userId': instance.userId,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
