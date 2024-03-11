import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'scheduled_report_model.freezed.dart';
part 'scheduled_report_model.g.dart';

ScheduledReportModel scheduledReportModelFromJson(String str) =>
    ScheduledReportModel.fromJson(json.decode(str));

String scheduledReportModelToJson(ScheduledReportModel data) =>
    json.encode(data.toJson());

@freezed
class ScheduledReportModel with _$ScheduledReportModel {
  const factory ScheduledReportModel({
    @JsonKey(name: "_id") String? id,
    String? camera,
    String? user,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ScheduledReportModel;

  factory ScheduledReportModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduledReportModelFromJson(json);
}
