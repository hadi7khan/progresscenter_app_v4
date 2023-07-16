import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/data/model/cctv_camera_model.dart';

abstract class CctvRepository {
  Future<Either<Failure, List<CctvCameraModel>>> cctvCameraList(String id);
}
