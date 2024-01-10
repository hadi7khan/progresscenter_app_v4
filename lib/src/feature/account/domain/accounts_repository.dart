import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/models/accounts_model.dart';

abstract class AccountsRepository {
  Future<Either<Failure, AccountsModel>> getProfile();
}
