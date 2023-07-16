import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/camera/data/datasource/camera_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/camera/data/model/camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/camera/domain/camera_repository.dart';

final cameraProvider = Provider.autoDispose<CameraRepositoryImpl>(
  (ref) {
    return CameraRepositoryImpl(
        cameraDataSource: ref.watch(cameraDataSourceProvider));
  },
);

class CameraRepositoryImpl implements CameraRepository {
  final CameraDataSource cameraDataSource;
  CameraRepositoryImpl({
    required this.cameraDataSource,
  });

  @override
  Future<Either<Failure, List<CameraModel>>> cameraList(id) async {
    try {
      final result = await cameraDataSource.cameraList(id);
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
}
