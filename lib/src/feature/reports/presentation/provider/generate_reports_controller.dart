import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/repository/reports_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/state/generate_report_state.dart';

final generateReportsProvider = StateNotifierProvider.autoDispose<
    GenerateReportsController, GenerateReportState>(
  (ref) {
    final reportsService = ref.watch(reportsProvider);
    return GenerateReportsController(
        const GenerateReportState(), reportsService);
  },
);

class GenerateReportsController extends StateNotifier<GenerateReportState> {
  final ReportsRepositoryImpl service;
  GenerateReportsController(super.state, this.service);

  Future generateReport(projectId, cameraId, data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.generateReport(projectId, cameraId, data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    log("valueee " + valueee.toString());
    return result;
  }
}
