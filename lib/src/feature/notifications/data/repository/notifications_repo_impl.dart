import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/datasource/notifications_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/models/notifications_model.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/domain/notifications_repository.dart';

final notificationsProvider = Provider.autoDispose<NotificationsRepositoryImpl>(
  (ref) {
    return NotificationsRepositoryImpl(
        livelapseDataSource: ref.watch(notificationsSourceProvider));
  },
);

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsDataSource livelapseDataSource;
  NotificationsRepositoryImpl({
    required this.livelapseDataSource,
  });

  @override
  Future<Either<Failure, NotificationsModel>> notificationsList(
      int page) async {
    try {
      final result = await livelapseDataSource.notificationsList(page);
      return Right((NotificationsModel.fromJson(result)));
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      print(errorMessage.toString());
      rethrow;
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
