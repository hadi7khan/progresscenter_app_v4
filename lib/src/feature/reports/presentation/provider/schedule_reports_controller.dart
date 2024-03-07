import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/repository/reports_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/state/schedule_report_state.dart';

final scheduleReportsProvider = StateNotifierProvider.autoDispose<
    ScheduleReportsController, ScheduleReportState>(
  (ref) {
    final reportsService = ref.watch(reportsProvider);
    return ScheduleReportsController(
        const ScheduleReportState(), reportsService);
  },
);

class ScheduleReportsController extends StateNotifier<ScheduleReportState> {
  final ReportsRepositoryImpl service;
  ScheduleReportsController(super.state, this.service);

  Future scheduleReport(projectId, cameraId, data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.scheduledReport(projectId, cameraId, data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    log("valueee " + valueee.toString());
    return result;
  }
}
