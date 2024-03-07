import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';

abstract class ReportsRepository {
  Future<Either<Failure, dynamic>> generateReport(
      String projectId, String cameraId, data);
  Future<Either<Failure, dynamic>> scheduledReport(
      String projectId, String cameraId, data);
}
