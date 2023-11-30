// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progressline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProgressLineModel _$$_ProgressLineModelFromJson(Map<String, dynamic> json) =>
    _$_ProgressLineModel(
      id: json['_id'] as String,
      caption: json['caption'] as String,
      file: json['file'] as String,
      mediaType: json['mediaType'] as String,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewedBy: (json['viewedBy'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      camera: json['camera'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_ProgressLineModelToJson(
        _$_ProgressLineModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'caption': instance.caption,
      'file': instance.file,
      'mediaType': instance.mediaType,
      'comments': instance.comments,
      'viewedBy': instance.viewedBy,
      'user': instance.user,
      'camera': instance.camera,
      'project': instance.project,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'url': instance.url,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String,
      commentId: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'user': instance.user,
      'body': instance.body,
      '_id': instance.commentId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      preset: Preset.fromJson(json['preset'] as Map<String, dynamic>),
      userId: json['_id'] as String,
      name: json['name'] as String,
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      dpUrl: json['dpUrl'] as String?,
      role: json['role'] as String?,
      lastActive: json['lastActive'] == null
          ? null
          : DateTime.parse(json['lastActive'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'preset': instance.preset,
      '_id': instance.userId,
      'name': instance.name,
      'dp': instance.dp,
      'designation': instance.designation,
      'dpUrl': instance.dpUrl,
      'role': instance.role,
      'lastActive': instance.lastActive?.toIso8601String(),
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      projectId: json['_id'] as String,
      name: json['name'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImageUrl: json['coverImageUrl'] as String,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      '_id': instance.projectId,
      'name': instance.name,
      'images': instance.images,
      'coverImageUrl': instance.coverImageUrl,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      name: json['name'] as String,
      imageId: json['_id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'name': instance.name,
      '_id': instance.imageId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
