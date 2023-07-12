import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/datasource/project_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/cctv_camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/drone_footage_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/site_gallery_model.dart';
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
  Future<Either<Failure, List<ProjectModel>>> projectList() async {
    try {
      final result = await projectDataSource.projectList();
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

  @override
  Future<Either<Failure, ProjectModel>> projectById(String id) async {
    try {
      final result = await projectDataSource.projectById(
        id,
      );
      return Right((ProjectModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<CameraModel>>> cameraList(id) async {
    try {
      final result = await projectDataSource.cameraList(id);
      return Right(
          (result as List).map((e) => CameraModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<CctvCameraModel>>> cctvCameraList(
      String id) async {
    try {
      final result = await projectDataSource.cctvCameraList(id);
      return Right(
          (result as List).map((e) => CctvCameraModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<DroneFootageModel>>> droneFootageList(
      String id) async {
    try {
      final result = await projectDataSource.droneFootageList(id);
      return Right(
          (result as List).map((e) => DroneFootageModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<SiteGalleryModel>>> siteGalleryList(
      String id) async {
    try {
      final result = await projectDataSource.siteGalleryList(id);
      return Right(
          (result as List).map((e) => SiteGalleryModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
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
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
  
  @override
  Future<Either<Failure, dynamic>> inviteMenbers(data, id) async{
    try {
      final result = await projectDataSource.inviteMembers(data, id);
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
