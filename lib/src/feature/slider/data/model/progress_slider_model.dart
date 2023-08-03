import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'progress_slider_model.freezed.dart';
part 'progress_slider_model.g.dart';

List<ProgressSliderModel> progressSliderModelFromJson(String str) =>
    List<ProgressSliderModel>.from(
        json.decode(str).map((x) => ProgressSliderModel.fromJson(x)));

String progressSliderModelToJson(List<ProgressSliderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProgressSliderModel with _$ProgressSliderModel {
  const factory ProgressSliderModel({
    String? name,
    String? date,
    String? time,
    @JsonKey(name: '_id') String? id,
    String? camera,
    String? url4K,
    String? urlPreview,
    String? urlThumb,
  }) = _ProgressSliderModel;

  factory ProgressSliderModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressSliderModelFromJson(json);
}
