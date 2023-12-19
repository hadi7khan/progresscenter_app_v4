import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/model/drone_footage_model.dart';

abstract class DroneFootageRepository {
  Future<Either<Failure, List<DroneFootageModel>>> droneFootageList(String id);
  Future<Either<Failure, dynamic>> addYoutubeVideo(projectId, data);
  Future<Either<Failure, dynamic>> addVimeoVideo(projectId, data);
  Future<Either<Failure, dynamic>> addFileVideo(projectId, data);
}
