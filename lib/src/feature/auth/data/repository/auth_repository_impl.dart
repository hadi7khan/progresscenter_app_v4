import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/datasource/auth_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/models/client_accounts_model.dart';
import 'package:progresscenter_app_v4/src/feature/auth/domain/auth_repository.dart';

final authProvider = Provider.autoDispose<AuthRepositoryImpl>(
  (ref) {
    return AuthRepositoryImpl(
        authDataSource: ref.watch(authDataSourceProvider));
  },
);

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<Either<Failure, dynamic>> forgotPassword(data) async {
    try {
      final result = await authDataSource.forgotPassword(data);
      print("result: " + result.toString());
      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword(data, token) async {
    try {
      final result = await authDataSource.changePassword(data, token);
      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signIn(data) async {
    try {
      final result = await authDataSource.signIn(data);
      log("Right result " + result.toString());
      return Right(result);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendOTP(token) async {
    try {
      final result = await authDataSource.resendOTP(token);
      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> verifyEmail(data, token) async {
    try {
      final result = await authDataSource.verifyEmail(data, token);
      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<ClientAccountsModel>>> clientAccounts() async {
    try {
      final result = await authDataSource.clientAccounts();
      return Right((result as List)
          .map((e) => ClientAccountsModel.fromJson(e))
          .toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
