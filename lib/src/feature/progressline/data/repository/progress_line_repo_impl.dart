import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/datasource/progress_line_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progress_line_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/domain/progress_line_repository.dart';

final progresslineProvider = Provider.autoDispose<ProgresslineRepositoryImpl>(
  (ref) {
    return ProgresslineRepositoryImpl(
        progresslineDataSource: ref.watch(progresslineDataSourceProvider));
  },
);

class ProgresslineRepositoryImpl implements ProgresslineRepository {
  final ProgresslineDataSource progresslineDataSource;
  ProgresslineRepositoryImpl({
    required this.progresslineDataSource,
  });

  @override
  Future<Either<Failure, List<ProgressLineModel>>> progressLine() async {
    try {
      final result = await progresslineDataSource.progressLine();
      return Right(
          (result as List).map((e) => ProgressLineModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
  
}
