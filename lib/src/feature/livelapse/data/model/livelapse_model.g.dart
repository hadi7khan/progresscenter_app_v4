// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livelapse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LivelapseModel _$$_LivelapseModelFromJson(Map<String, dynamic> json) =>
    _$_LivelapseModel(
      options: json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      quality: json['quality'] as String?,
      filepath: json['filepath'] as String?,
      type: json['type'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      coverImageName: json['coverImageName'] as String?,
      status: json['status'] as String?,
      viewedBy: json['viewedBy'] as List<dynamic>?,
      camera: json['camera'] as String?,
      requestedBy: json['requestedBy'] == null
          ? null
          : RequestedBy.fromJson(json['requestedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      duration: json['duration'] as int?,
      livelapseModelId: json['livelapseModelId'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_LivelapseModelToJson(_$_LivelapseModel instance) =>
    <String, dynamic>{
      'options': instance.options,
      'id': instance.id,
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
      'requestedBy': instance.requestedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'duration': instance.duration,
      'livelapseModelId': instance.livelapseModelId,
      'coverImageUrl': instance.coverImageUrl,
      'url': instance.url,
    };

_$_Options _$$_OptionsFromJson(Map<String, dynamic> json) => _$_Options(
      hasTimestamp: json['hasTimestamp'] as bool?,
      filterBlurryImages: json['filterBlurryImages'] as bool?,
      hasAiBlending: json['hasAiBlending'] as bool?,
      imagesPerDay: json['imagesPerDay'] as int?,
      logo: json['logo'] as String?,
      startingSlide: json['startingSlide'] as String?,
      endingSlide: json['endingSlide'] as String?,
      backgroundMusic: json['backgroundMusic'] as String?,
    );

Map<String, dynamic> _$$_OptionsToJson(_$_Options instance) =>
    <String, dynamic>{
      'hasTimestamp': instance.hasTimestamp,
      'filterBlurryImages': instance.filterBlurryImages,
      'hasAiBlending': instance.hasAiBlending,
      'imagesPerDay': instance.imagesPerDay,
      'logo': instance.logo,
      'startingSlide': instance.startingSlide,
      'endingSlide': instance.endingSlide,
      'backgroundMusic': instance.backgroundMusic,
    };

_$_RequestedBy _$$_RequestedByFromJson(Map<String, dynamic> json) =>
    _$_RequestedBy(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      requestedById: json['requestedById'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_RequestedByToJson(_$_RequestedBy instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'requestedById': instance.requestedById,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
