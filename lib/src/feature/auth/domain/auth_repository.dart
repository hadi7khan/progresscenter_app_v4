import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/models/client_accounts_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> signIn(Map<String, dynamic> data);
  Future<Either<Failure, dynamic>> forgotPassword(data);
  Future<Either<Failure, dynamic>> verifyEmail(data, token);
  Future<Either<Failure, dynamic>> changePassword(data, token);
  Future<Either<Failure, dynamic>> resendOTP(token);
  Future<Either<Failure, List<ClientAccountsModel>>> clientAccounts();
}
