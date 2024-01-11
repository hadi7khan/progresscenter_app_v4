// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ProjectImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImageUrl: json['coverImageUrl'] as String?,
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
      projectModelId: json['projectModelId'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      '_id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'coverImageUrl': instance.coverImageUrl,
      'status': instance.status,
      'assets': instance.assets,
      'activity': instance.activity,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'parentId': instance.parentId,
      'hasCameras': instance.hasCameras,
      'hierarchyLevel': instance.hierarchyLevel,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'aiStats': instance.aiStats,
      'constructionDays': instance.constructionDays,
      'projectModelId': instance.projectModelId,
      'users': instance.users,
      'children': instance.children,
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

_$_ProjectImage _$$_ProjectImageFromJson(Map<String, dynamic> json) =>
    _$_ProjectImage(
      imageId: json['_id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ProjectImageToJson(_$_ProjectImage instance) =>
    <String, dynamic>{
      '_id': instance.imageId,
      'url': instance.url,
    };

_$_Asset _$$_AssetFromJson(Map<String, dynamic> json) => _$_Asset(
      name: json['name'] as String?,
      id: json['_id'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_AssetToJson(_$_Asset instance) => <String, dynamic>{
      'name': instance.name,
      '_id': instance.id,
      'count': instance.count,
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
      userId: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      dp: json['dp'] as String?,
      role: json['role'] as String?,
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      '_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'dp': instance.dp,
      'role': instance.role,
      'projects': instance.projects,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
