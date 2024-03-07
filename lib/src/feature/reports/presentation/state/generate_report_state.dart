import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_report_state.freezed.dart';

@freezed
class GenerateReportState with _$GenerateReportState {
  const factory GenerateReportState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _GenerateReportState;
}
