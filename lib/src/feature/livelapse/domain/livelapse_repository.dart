import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/model/livelapse_model.dart';

abstract class LivelapseRepository {
  Future<Either<Failure, List<LivelapseModel>>> livelapseList(
      String projectId, String cameraId);
  Future<Either<Failure, dynamic>> createBasicLivelapse(
      String projectId, String cameraId, data);
  Future<Either<Failure, dynamic>> createAdvancedLivelapse(
      String projectId, String cameraId, data);
}
