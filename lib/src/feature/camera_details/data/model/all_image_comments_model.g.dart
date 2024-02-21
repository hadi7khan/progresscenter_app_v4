// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_image_comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllImageCommentsModel _$$_AllImageCommentsModelFromJson(
        Map<String, dynamic> json) =>
    _$_AllImageCommentsModel(
      count: json['count'] as int?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AllImageCommentsModelToJson(
        _$_AllImageCommentsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'comments': instance.comments,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
      id: json['id'] as String?,
      imageName: json['imageName'] as String?,
      camera: json['camera'] as String?,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      commentId: json['commentId'] as String?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'position': instance.position,
      'id': instance.id,
      'imageName': instance.imageName,
      'camera': instance.camera,
      'message': instance.message,
      'user': instance.user,
      'replies': instance.replies,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'commentId': instance.commentId,
    };

_$_Position _$$_PositionFromJson(Map<String, dynamic> json) => _$_Position(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PositionToJson(_$_Position instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

_$_Reply _$$_ReplyFromJson(Map<String, dynamic> json) => _$_Reply(
      message: json['message'] as String?,
      user: json['user'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ReplyToJson(_$_Reply instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      userId: json['userId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      'preferences': instance.preferences,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'userId': instance.userId,
      'dpUrl': instance.dpUrl,
    };

_$_Preferences _$$_PreferencesFromJson(Map<String, dynamic> json) =>
    _$_Preferences(
      primaryColor: json['primaryColor'] as String?,
    );

Map<String, dynamic> _$$_PreferencesToJson(_$_Preferences instance) =>
    <String, dynamic>{
      'primaryColor': instance.primaryColor,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };
