import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/common/data/model/camera_by_id_model.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/multi_images_model.dart';

abstract class CameraDetailsRepository {
  Future<Either<Failure, ImagesByCameraIdModel>> imagesByCameraId(
      String projectId, String cameraId,
      {String searchDate = ''});
  Future<Either<Failure, CameraByIdModel>> cameraById(
      String projectId, String cameraId);
  Future<Either<Failure, dynamic>> createZip(
      String projectId, String cameraId, data);
  Future<Either<Failure, List<MultiImagesModel>>> multiImages(
      String projectId, String cameraId);
}
