import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/datasource/support_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/support_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/domain/support_repository.dart';

final supportProvider = Provider.autoDispose<SupportRepositoryImpl>(
  (ref) {
    return SupportRepositoryImpl(
        supportDataSource: ref.watch(supportDataSourceProvider));
  },
);

class SupportRepositoryImpl implements SupportRepository {
  final SupportDataSource supportDataSource;
  SupportRepositoryImpl({
    required this.supportDataSource,
  });

  @override
  Future<Either<Failure, List<SupportModel>>> supportList() async {
    try {
      final result = await supportDataSource.supportList();
      return Right(
          (result as List).map((e) => SupportModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createTicket(data) async {
    try {
      final result = await supportDataSource.createTicket(data);
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
