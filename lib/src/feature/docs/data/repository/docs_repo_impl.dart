import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/datasource/docs_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/model/docs_model.dart';
import 'package:progresscenter_app_v4/src/feature/docs/domain/docs_repository.dart';

final docsProvider = Provider.autoDispose<DocsRepositoryImpl>(
  (ref) {
    return DocsRepositoryImpl(
        docsDataSource: ref.watch(docsDataSourceProvider));
  },
);

class DocsRepositoryImpl implements DocsRepository {
  final DocsDataSource docsDataSource;
  DocsRepositoryImpl({
    required this.docsDataSource,
  });

  @override
  Future<Either<Failure, List<DocsModel>>> docList() async {
    try {
      final result = await docsDataSource.docList();
      return Right((result as List).map((e) => DocsModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addDocument(String folderId, data) async {
    try {
      final result = await docsDataSource.addDocument(folderId, data);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createDocumentFolder(data) async {
    try {
      final result = await docsDataSource.createDocumentFolder(data);

      return Right(result);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
