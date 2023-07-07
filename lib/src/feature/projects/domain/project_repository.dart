import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/cctv_camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/drone_footage_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/site_gallery_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectModel>>> projectList();
  Future<Either<Failure, ProjectModel>> projectById(String id);
  Future<Either<Failure, List<CameraModel>>> cameraList(String id);
  Future<Either<Failure, List<CctvCameraModel>>> cctvCameraList(String id);
  Future<Either<Failure, List<DroneFootageModel>>> droneFootageList(String id);
  Future<Either<Failure, List<SiteGalleryModel>>> siteGalleryList(String id);
  
}
