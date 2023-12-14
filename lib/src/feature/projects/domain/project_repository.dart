import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_by_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectModel>>> projectList();
  Future<Either<Failure, ProjectByIdModel>> projectById(String id);
  Future<Either<Failure, List<UserLeanModel>>> userleanList();
  Future<Either<Failure, dynamic>> inviteMembers(data, id);
  Future<Either<Failure, List<ProjectLeanModel>>> projectLeanList();
}
