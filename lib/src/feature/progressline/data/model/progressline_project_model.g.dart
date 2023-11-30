// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progressline_project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgresslineProjectModel _$$_ProgresslineProjectModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProgresslineProjectModel(
      id: json['_id'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      name: json['name'] as String,
      postCount: json['postCount'] as int,
    );

Map<String, dynamic> _$$_ProgresslineProjectModelToJson(
        _$_ProgresslineProjectModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'coverImageUrl': instance.coverImageUrl,
      'name': instance.name,
      'postCount': instance.postCount,
    };
