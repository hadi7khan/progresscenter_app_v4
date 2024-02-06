import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'livelapse_by_id_model.freezed.dart';
part 'livelapse_by_id_model.g.dart';

LivelapseByIdModel livelapseByIdFromJson(String str) =>
    LivelapseByIdModel.fromJson(json.decode(str));

String livelapseByIdToJson(LivelapseByIdModel data) =>
    json.encode(data.toJson());

@freezed
class LivelapseByIdModel with _$LivelapseByIdModel {
  const factory LivelapseByIdModel({
    Options? options,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? quality,
    String? filepath,
    String? type,
    String? startDate,
    String? endDate,
    dynamic startTime,
    dynamic endTime,
    String? coverImageName,
    String? status,
    List<EdBy>? viewedBy,
    String? camera,
    String? project,
    String? client,
    EdBy? requestedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? duration,
    String? livelapseByIdId,
    String? coverImageUrl,
    String? url,
  }) = _LivelapseByIdModel;

  factory LivelapseByIdModel.fromJson(Map<String, dynamic> json) =>
      _$LivelapseByIdModelFromJson(json);
}

@freezed
class Options with _$Options {
  const factory Options({
    bool? hasTimestamp,
    bool? filterBlurryImages,
    bool? hasAiBlending,
    dynamic logo,
    dynamic startingSlide,
    dynamic endingSlide,
    dynamic backgroundMusic,
    int? imagesPerDay,
  }) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}

@freezed
class EdBy with _$EdBy {
  const factory EdBy({
    Preset? preset,
    String? id,
    String? name,
    String? dp,
    String? edById,
    String? dpUrl,
  }) = _EdBy;

  factory EdBy.fromJson(Map<String, dynamic> json) => _$EdByFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
