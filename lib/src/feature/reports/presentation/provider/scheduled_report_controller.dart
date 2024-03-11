import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/repository/reports_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/state/scheduled_report_state.dart';

final scheduledReportProvider = StateNotifierProvider.autoDispose<
    ScheduledReportController, ScheduledReportState>(
  (ref) {
    final reportsService = ref.watch(reportsProvider);
    return ScheduledReportController(
        const ScheduledReportState(), reportsService);
  },
);

class ScheduledReportController extends StateNotifier<ScheduledReportState> {
  final ReportsRepositoryImpl service;
  ScheduledReportController(super.state, this.service);

  Future getScheduledReport(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.getScheduledReport(projectId, cameraId);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isFetching: false, scheduledReport: AsyncValue.data(r));
    });
  }
}
