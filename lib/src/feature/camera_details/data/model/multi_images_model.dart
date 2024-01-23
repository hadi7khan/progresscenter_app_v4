import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'multi_images_model.freezed.dart';
part 'multi_images_model.g.dart';

List<MultiImagesModel> multiImagesModelFromJson(String str) =>
    List<MultiImagesModel>.from(
        json.decode(str).map((x) => MultiImagesModel.fromJson(x)));

String multiImagesModelToJson(List<MultiImagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class MultiImagesModel with _$MultiImagesModel {
  const factory MultiImagesModel({
    Options? options,
    String? id,
    String? filepath,
    String? name,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? status,
    String? camera,
    String? project,
    String? client,
    RequestedBy? requestedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? multiImagesModelId,
    String? url,
  }) = _MultiImagesModel;

  factory MultiImagesModel.fromJson(Map<String, dynamic> json) =>
      _$MultiImagesModelFromJson(json);
}

@freezed
class Options with _$Options {
  const factory Options({
    bool? hasTimestamp,
    String? imageQuality,
  }) = _Options;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
}

@freezed
class RequestedBy with _$RequestedBy {
  const factory RequestedBy({
    String? id,
    String? name,
    String? requestedById,
  }) = _RequestedBy;

  factory RequestedBy.fromJson(Map<String, dynamic> json) =>
      _$RequestedByFromJson(json);
}
