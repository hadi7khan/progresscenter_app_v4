import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'progressline_project_model.freezed.dart';
part 'progressline_project_model.g.dart';

List<ProgresslineProjectModel> progresslineProjectModelFromJson(String str) =>
    List<ProgresslineProjectModel>.from(
        json.decode(str).map((x) => ProgresslineProjectModel.fromJson(x)));

String progresslineProjectModelToJson(List<ProgresslineProjectModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProgresslineProjectModel with _$ProgresslineProjectModel {
  const factory ProgresslineProjectModel({
    @JsonKey(name: "_id") required String id,
    @Default('') String coverImageUrl,
    @Default('') String name,
    @Default(0) int postCount,
  }) = _ProgresslineProjectModel;

  factory ProgresslineProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProgresslineProjectModelFromJson(json);
}
