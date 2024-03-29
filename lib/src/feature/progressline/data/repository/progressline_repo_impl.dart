import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/datasource/progressline_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/comments_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/domain/progressline_repository.dart';

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
  Future<Either<Failure, List<ProgressLineModel>>> progressLine(
      projectId) async {
    try {
      final result = await progresslineDataSource.progressLine(projectId);
      return Right(
          (result as List).map((e) => ProgressLineModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> postComment(String id, data) async {
    try {
      final result = await progresslineDataSource.postComment(id, data);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<CommentsModel>>> comments(String id) async {
    try {
      final result = await progresslineDataSource.comments(id);
      return Right(
          (result as List).map((e) => CommentsModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ProgressLineModel>> progresslineById(
      progresslineId, projectId) async {
    try {
      final result = await progresslineDataSource.progresslineById(
          progresslineId, projectId);
      return Right((ProgressLineModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<ProgressLineModel>>>
      allProgressLinePosts() async {
    try {
      final result = await progresslineDataSource.allProgressLinePosts();
      return Right(
          (result as List).map((e) => ProgressLineModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
