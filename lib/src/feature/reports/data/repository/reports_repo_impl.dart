import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/reports/data/datasource/reports_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/reports/domain/reports_repository.dart';

final reportsProvider = Provider.autoDispose<ReportsRepositoryImpl>(
  (ref) {
    return ReportsRepositoryImpl(
        reportsDataSource: ref.watch(reportsDataSourceProvider));
  },
);

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsDataSource reportsDataSource;
  ReportsRepositoryImpl({
    required this.reportsDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> generateReport(
      String projectId, String cameraId, data) async {
    try {
      final result =
          await reportsDataSource.generateReport(projectId, cameraId, data);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> scheduledReport(
      String projectId, String cameraId, data) async {
    try {
      final result =
          await reportsDataSource.scheduledReport(projectId, cameraId, data);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
