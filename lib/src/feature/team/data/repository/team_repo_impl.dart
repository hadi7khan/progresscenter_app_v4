import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/datasource/team_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/model/user_model.dart';
import 'package:progresscenter_app_v4/src/feature/team/domain/team_repository.dart';

final teamProvider = Provider.autoDispose<TeamRepositoryImpl>(
  (ref) {
    return TeamRepositoryImpl(
        teamDataSource: ref.watch(teamDataSourceProvider));
  },
);

class TeamRepositoryImpl implements TeamRepository {
  final TeamDataSource teamDataSource;
  TeamRepositoryImpl({
    required this.teamDataSource,
  });

  @override
  Future<Either<Failure, List<UserModel>>> userList() async {
    try {
      final result = await teamDataSource.userList();
      return Right((result as List).map((e) => UserModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createUser(data) async {
    try {
      final result = await teamDataSource.createUser(data);
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
}
