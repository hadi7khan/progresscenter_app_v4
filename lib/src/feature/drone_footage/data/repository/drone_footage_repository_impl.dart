import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/datasource/project_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/model/drone_footage_model.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/domain/drone_footage_repository.dart';

final droneFootageProvider = Provider.autoDispose<DroneFootageRepositoryImpl>(
  (ref) {
    return DroneFootageRepositoryImpl(
        droneFootageDataSource: ref.watch(droneFootageDataSourceProvider));
  },
);

class DroneFootageRepositoryImpl implements DroneFootageRepository {
  final DroneFootageDataSource droneFootageDataSource;
  DroneFootageRepositoryImpl({
    required this.droneFootageDataSource,
  });

  @override
  Future<Either<Failure, List<DroneFootageModel>>> droneFootageList(
      String id) async {
    try {
      final result = await droneFootageDataSource.droneFootageList(id);
      return Right(
          (result as List).map((e) => DroneFootageModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
