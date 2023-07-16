import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/camera/data/model/camera_model.dart';

abstract class CameraRepository {
  Future<Either<Failure, List<CameraModel>>> cameraList(String id);
}
