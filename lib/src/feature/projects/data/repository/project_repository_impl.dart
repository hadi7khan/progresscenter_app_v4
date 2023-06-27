import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/datasource/project_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
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
    token,
  ) async {
    try {
      final result = await projectDataSource.projectList(
        token,
      );
      return Right(
          (result as List).map((e) => ProjectModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}