import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/model/user_model.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<UserModel>>> userList();
  Future<Either<Failure, dynamic>> createUser(data);
  Future<Either<Failure, dynamic>> inviteByMail(data);
}
