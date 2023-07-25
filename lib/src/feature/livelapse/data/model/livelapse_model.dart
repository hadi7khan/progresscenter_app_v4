import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'livelapse_model.freezed.dart';
part 'livelapse_model.g.dart';

List<LivelapseModel> livelapseModelFromJson(String str) =>
    List<LivelapseModel>.from(
        json.decode(str).map((x) => LivelapseModel.fromJson(x)));

String livelapseModelToJson(List<LivelapseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class LivelapseModel with _$LivelapseModel {
  const factory LivelapseModel({
    Options? options,
    String? id,
    String? name,
    String? quality,
    String? filepath,
    String? type,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? coverImageName,
    String? status,
    List<dynamic>? viewedBy,
    String? camera,
    RequestedBy? requestedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? duration,
    String? livelapseModelId,
    String? coverImageUrl,
    String? url,
  }) = _LivelapseModel;

  factory LivelapseModel.fromJson(Map<String, dynamic> json) =>
      _$LivelapseModelFromJson(json);
}

@freezed
class Options with _$Options {
  const factory Options({
    bool? hasTimestamp,
    bool? filterBlurryImages,
    bool? hasAiBlending,
    int? imagesPerDay,
    String? logo,
    String? startingSlide,
    String? endingSlide,
    String? backgroundMusic,
  }) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}

@freezed
class RequestedBy with _$RequestedBy {
  const factory RequestedBy({
    Preset? preset,
    String? id,
    String? name,
    String? dp,
    String? requestedById,
    String? dpUrl,
  }) = _RequestedBy;

  factory RequestedBy.fromJson(Map<String, dynamic> json) =>
      _$RequestedByFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
