import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, dynamic>> signIn(data);
  Future<Either<Failure, dynamic>> forgotPassword(data);
  Future<Either<Failure, dynamic>> verifyEmail(data, token);
  Future<Either<Failure, dynamic>> changePassword(data, token);
  Future<Either<Failure, dynamic>> resendOTP(token);
}