import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/models/scheduled_report_model.dart';

abstract class ReportsRepository {
  Future<Either<Failure, dynamic>> generateReport(
      String projectId, String cameraId, data);
  Future<Either<Failure, dynamic>> scheduleReport(
      String projectId, String cameraId, data);
  Future<Either<Failure, ScheduledReportModel>> getScheduledReport(
    String projectId,
    String cameraId,
  );
}
