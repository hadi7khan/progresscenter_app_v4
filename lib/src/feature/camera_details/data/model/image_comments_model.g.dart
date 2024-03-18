// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageCommentsModel _$$_ImageCommentsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImageCommentsModel(
      url: json['url'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageCommentsModelToJson(
        _$_ImageCommentsModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'comments': instance.comments,
    };
