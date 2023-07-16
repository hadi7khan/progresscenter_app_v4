import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/data/datasource/cctv_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/data/model/cctv_camera_model.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/domain/cctv_repository.dart';

final cctvProvider = Provider.autoDispose<CctvRepositoryImpl>(
  (ref) {
    return CctvRepositoryImpl(
        cctvDataSource: ref.watch(cctvDataSourceProvider));
  },
);

class CctvRepositoryImpl implements CctvRepository {
  final CctvDataSource cctvDataSource;
  CctvRepositoryImpl({
    required this.cctvDataSource,
  });

  @override
  Future<Either<Failure, List<CctvCameraModel>>> cctvCameraList(
      String id) async {
    try {
      final result = await cctvDataSource.cctvCameraList(id);
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
}
