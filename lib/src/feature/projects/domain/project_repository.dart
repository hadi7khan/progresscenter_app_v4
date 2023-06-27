import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectModel>>> projectList(
    String page,
  );
}
