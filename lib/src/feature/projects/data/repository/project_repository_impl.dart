import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/datasource/project_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/domain/project_repository.dart';

final projectProvider = Provider.autoDispose<ProjectRepositoryImpl>(
  (ref) {
    return ProjectRepositoryImpl(
        projectDataSource: ref.watch(projectDataSourceProvider));
  },
);

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDataSource projectDataSource;
  ProjectRepositoryImpl({
    required this.projectDataSource,
  });

  @override
  Future<Either<Failure, List<ProjectModel>>> projectList(
      {searchText = ''}) async {
    try {
      final result =
          await projectDataSource.projectList(searchText: searchText);
      return Right(
          (result as List).map((e) => ProjectModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProjectModel>> projectById(
      String id, bool includeChildren) async {
    try {
      final result = await projectDataSource.projectById(id, includeChildren);
      return Right((ProjectModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<UserLeanModel>>> userleanList() async {
    try {
      final result = await projectDataSource.userleanList();
      return Right(
          (result as List).map((e) => UserLeanModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> inviteMembers(data, id) async {
    try {
      final result = await projectDataSource.inviteMembers(data, id);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> projectLeanList() async {
    try {
      final result = await projectDataSource.projectLeanList();
      return Right(
          (result as List).map((e) => ProjectModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
