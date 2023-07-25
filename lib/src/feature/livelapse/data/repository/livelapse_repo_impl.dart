import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/datasource/livelapse_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/model/livelapse_model.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/domain/livelapse_repository.dart';

final livelapseProvider = Provider.autoDispose<LivelapseRepositoryImpl>(
  (ref) {
    return LivelapseRepositoryImpl(
        livelapseDataSource: ref.watch(livelapseSourceProvider));
  },
);

class LivelapseRepositoryImpl implements LivelapseRepository {
  final LivelapseDataSource livelapseDataSource;
  LivelapseRepositoryImpl({
    required this.livelapseDataSource,
  });

  @override
  Future<Either<Failure, List<LivelapseModel>>> livelapseList(
      String projectId, String cameraId) async {
    try {
      final result =
          await livelapseDataSource.livelapseList(projectId, cameraId);
      return Right(
          (result as List).map((e) => LivelapseModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
