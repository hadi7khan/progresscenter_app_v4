// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livelapse_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LivelapseByIdModel _$$_LivelapseByIdModelFromJson(
        Map<String, dynamic> json) =>
    _$_LivelapseByIdModel(
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      quality: json['quality'] as String?,
      filepath: json['filepath'] as String?,
      type: json['type'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'],
      endTime: json['endTime'],
      coverImageName: json['coverImageName'] as String?,
      status: json['status'] as String?,
      viewedBy: (json['viewedBy'] as List<dynamic>?)
          ?.map((e) => EdBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      camera: json['camera'] as String?,
      project: json['project'] as String?,
      client: json['client'] as String?,
      requestedBy: json['requestedBy'] == null
          ? null
          : EdBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      duration: json['duration'] as int?,
      livelapseByIdId: json['livelapseByIdId'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_LivelapseByIdModelToJson(
        _$_LivelapseByIdModel instance) =>
    <String, dynamic>{
      'options': instance.options,
      '_id': instance.id,
      'name': instance.name,
      'quality': instance.quality,
      'filepath': instance.filepath,
      'type': instance.type,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'coverImageName': instance.coverImageName,
      'status': instance.status,
      'viewedBy': instance.viewedBy,
      'camera': instance.camera,
      'project': instance.project,
      'client': instance.client,
      'requestedBy': instance.requestedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'duration': instance.duration,
      'livelapseByIdId': instance.livelapseByIdId,
      'coverImageUrl': instance.coverImageUrl,
      'url': instance.url,
    };

_$_Options _$$_OptionsFromJson(Map<String, dynamic> json) => _$_Options(
      hasTimestamp: json['hasTimestamp'] as bool?,
      filterBlurryImages: json['filterBlurryImages'] as bool?,
      hasAiBlending: json['hasAiBlending'] as bool?,
      logo: json['logo'],
      startingSlide: json['startingSlide'],
      endingSlide: json['endingSlide'],
      backgroundMusic: json['backgroundMusic'],
      imagesPerDay: json['imagesPerDay'] as int?,
    );

Map<String, dynamic> _$$_OptionsToJson(_$_Options instance) =>
    <String, dynamic>{
      'hasTimestamp': instance.hasTimestamp,
      'filterBlurryImages': instance.filterBlurryImages,
      'hasAiBlending': instance.hasAiBlending,
      'logo': instance.logo,
      'startingSlide': instance.startingSlide,
      'endingSlide': instance.endingSlide,
      'backgroundMusic': instance.backgroundMusic,
      'imagesPerDay': instance.imagesPerDay,
    };

_$_EdBy _$$_EdByFromJson(Map<String, dynamic> json) => _$_EdBy(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      edById: json['edById'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_EdByToJson(_$_EdBy instance) => <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'edById': instance.edById,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
