import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/slider/data/datasource/progress_slider_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/slider/data/model/progress_slider_model.dart';
import 'package:progresscenter_app_v4/src/feature/slider/domain/slider_repository.dart';

final progressSliderProvider =
    Provider.autoDispose<ProgressSliderRepositoryImpl>(
  (ref) {
    return ProgressSliderRepositoryImpl(
        progressSliderDataSource: ref.watch(progressSliderSourceProvider));
  },
);

class ProgressSliderRepositoryImpl implements SliderProgressRepository {
  final ProgressSliderDataSource progressSliderDataSource;
  ProgressSliderRepositoryImpl({
    required this.progressSliderDataSource,
  });

  @override
  Future<Either<Failure, List<ProgressSliderModel>>> progressSlider(
      String projectId, String cameraId) async {
    try {
      final result =
          await progressSliderDataSource.progressSlider(projectId, cameraId);
      return Right((result as List)
          .map((e) => ProgressSliderModel.fromJson(e))
          .toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
