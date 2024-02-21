import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/common/data/model/camera_by_id_model.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/datasource/camera_details_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/all_image_comments_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/image_comments_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/multi_images_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/domain/camera_details_repository.dart';

final cameraDetailsProvider = Provider.autoDispose<CameraDetailsRepositoryImpl>(
  (ref) {
    return CameraDetailsRepositoryImpl(
        cameraDetailsDataSource: ref.watch(cameraDataSourceProvider));
  },
);

class CameraDetailsRepositoryImpl implements CameraDetailsRepository {
  final AccountsDataSource cameraDetailsDataSource;
  CameraDetailsRepositoryImpl({
    required this.cameraDetailsDataSource,
  });

  @override
  Future<Either<Failure, CameraByIdModel>> cameraById(
      String projectId, String cameraId) async {
    try {
      final result =
          await cameraDetailsDataSource.cameraById(projectId, cameraId);
      return Right((CameraByIdModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ImagesByCameraIdModel>> imagesByCameraId(
      String projectId, String cameraId,
      {String searchDate = ''}) async {
    try {
      final result = await cameraDetailsDataSource
          .imagesByCameraId(projectId, cameraId, searchDate: searchDate);
      return Right((ImagesByCameraIdModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createZip(
      String projectId, String cameraId, data) async {
    try {
      final result =
          await cameraDetailsDataSource.createZip(projectId, cameraId, data);
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
  Future<Either<Failure, List<MultiImagesModel>>> multiImages(
      String projectId, String cameraId) async {
    try {
      final result =
          await cameraDetailsDataSource.multiImages(projectId, cameraId);
      return Right(
          (result as List).map((e) => MultiImagesModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ImageCommentsModel>> imageComments(
      String projectId, String cameraId, String imageName) async {
    try {
      final result = await cameraDetailsDataSource.imageComments(
          projectId, cameraId, imageName);
      return Right((ImageCommentsModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, AllImageCommentsModel>> allImageComments(
      String projectId, String cameraId, int page) async {
    try {
      final result = await cameraDetailsDataSource.allImageComments(
          projectId, cameraId, page);
      return Right((AllImageCommentsModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
