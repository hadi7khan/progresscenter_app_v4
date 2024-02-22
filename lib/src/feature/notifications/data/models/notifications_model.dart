import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'notifications_model.freezed.dart';
part 'notifications_model.g.dart';

NotificationsModel notificationsModelFromMap(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToMap(NotificationsModel data) =>
    json.encode(data.toJson());

@freezed
class NotificationsModel with _$NotificationsModel {
  const factory NotificationsModel({
    int? count,
    List<Notification>? notifications,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    String? id,
    String? user,
    String? type,
    String? message,
    Details? details,
    CreatedBy? createdBy,
    DateTime? readAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? read,
    String? notificationId,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    Preset? preset,
    String? id,
    String? name,
    String? dp,
    String? designation,
    String? createdById,
    String? dpUrl,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    String? projectId,
    String? progressLinePostId,
    String? cameraId,
    String? cameraName,
    String? projectName,
    String? cameraImageName,
    String? cameraImageCommentId,
    String? progressLineCommentId,
    String? cameraImageCommentReplyId,
    String? folderId,
    String? fileId,
    String? fileName,
    String? filePath,
    DateTime? fileCreatedAt,
    String? filename,
    String? multiImageDownloadId,
    String? startDate,
    String? endDate,
    String? livelapseId,
    int? duration,
    CameraImageResolution? cameraImageResolution,
    ProjectLocation? projectLocation,
    String? userId,
    dynamic projectImageFilePath,
    String? invitationId,
    String? supportTicketId,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}

@freezed
class CameraImageResolution with _$CameraImageResolution {
  const factory CameraImageResolution({
    int? width,
    int? height,
  }) = _CameraImageResolution;

  factory CameraImageResolution.fromJson(Map<String, dynamic> json) =>
      _$CameraImageResolutionFromJson(json);
}

@freezed
class ProjectLocation with _$ProjectLocation {
  const factory ProjectLocation({
    String? name,
    dynamic latitude,
    dynamic longitude,
  }) = _ProjectLocation;

  factory ProjectLocation.fromJson(Map<String, dynamic> json) =>
      _$ProjectLocationFromJson(json);
}
