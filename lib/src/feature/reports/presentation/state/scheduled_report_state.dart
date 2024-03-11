import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/models/scheduled_report_model.dart';

part 'scheduled_report_state.freezed.dart';

@freezed
class ScheduledReportState with _$ScheduledReportState {
  const factory ScheduledReportState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<ScheduledReportModel> scheduledReport,
      String? errorMessage}) = _ScheduledReportState;
}
