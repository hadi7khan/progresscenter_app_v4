import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_report_state.freezed.dart';

@freezed
class ScheduleReportState with _$ScheduleReportState {
  const factory ScheduleReportState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _ScheduleReportState;
}
