import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectModel>>> projectList();
  Future<Either<Failure, List<CameraModel>>> cameraList(String id);
  Future<Either<Failure, ProjectModel>> projectById(String id);
}
