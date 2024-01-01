// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsModel _$$_NotificationsModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationsModel(
      count: json['count'] as int?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotificationsModelToJson(
        _$_NotificationsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'notifications': instance.notifications,
    };

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['id'] as String?,
      user: json['user'] as String?,
      type: json['type'] as String?,
      message: json['message'] as String?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      read: json['read'] as bool?,
      notificationId: json['notificationId'] as String?,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': instance.type,
      'message': instance.message,
      'details': instance.details,
      'createdBy': instance.createdBy,
      'readAt': instance.readAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'read': instance.read,
      'notificationId': instance.notificationId,
    };

_$_CreatedBy _$$_CreatedByFromJson(Map<String, dynamic> json) => _$_CreatedBy(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      createdById: json['createdById'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_CreatedByToJson(_$_CreatedBy instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'id': instance.id,
      'name': instance.name,
      'dp': instance.dp,
      'designation': instance.designation,
      'createdById': instance.createdById,
      'dpUrl': instance.dpUrl,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'color': instance.color,
    };

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      projectId: json['projectId'] as String?,
      progressLinePostId: json['progressLinePostId'] as String?,
      cameraId: json['cameraId'] as String?,
      cameraName: json['cameraName'] as String?,
      projectName: json['projectName'] as String?,
      cameraImageName: json['cameraImageName'] as String?,
      cameraImageCommentId: json['cameraImageCommentId'] as String?,
      progressLineCommentId: json['progressLineCommentId'] as String?,
      cameraImageCommentReplyId: json['cameraImageCommentReplyId'] as String?,
      folderId: json['folderId'] as String?,
      fileId: json['fileId'] as String?,
      fileName: json['fileName'] as String?,
      filePath: json['filePath'] as String?,
      fileCreatedAt: json['fileCreatedAt'] == null
          ? null
          : DateTime.parse(json['fileCreatedAt'] as String),
      filename: json['filename'] as String?,
      multiImageDownloadId: json['multiImageDownloadId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      livelapseId: json['livelapseId'] as String?,
      duration: json['duration'] as int?,
      projectLocation: json['projectLocation'] == null
          ? null
          : ProjectLocation.fromJson(
              json['projectLocation'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
      projectImageFilePath: json['projectImageFilePath'],
      invitationId: json['invitationId'] as String?,
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'progressLinePostId': instance.progressLinePostId,
      'cameraId': instance.cameraId,
      'cameraName': instance.cameraName,
      'projectName': instance.projectName,
      'cameraImageName': instance.cameraImageName,
      'cameraImageCommentId': instance.cameraImageCommentId,
      'progressLineCommentId': instance.progressLineCommentId,
      'cameraImageCommentReplyId': instance.cameraImageCommentReplyId,
      'folderId': instance.folderId,
      'fileId': instance.fileId,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileCreatedAt': instance.fileCreatedAt?.toIso8601String(),
      'filename': instance.filename,
      'multiImageDownloadId': instance.multiImageDownloadId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'livelapseId': instance.livelapseId,
      'duration': instance.duration,
      'projectLocation': instance.projectLocation,
      'userId': instance.userId,
      'projectImageFilePath': instance.projectImageFilePath,
      'invitationId': instance.invitationId,
    };

_$_ProjectLocation _$$_ProjectLocationFromJson(Map<String, dynamic> json) =>
    _$_ProjectLocation(
      name: json['name'] as String?,
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$_ProjectLocationToJson(_$_ProjectLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
