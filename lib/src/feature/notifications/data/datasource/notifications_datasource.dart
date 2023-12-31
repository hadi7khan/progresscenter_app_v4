import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final notificationsSourceProvider =
    Provider.autoDispose<NotificationsDataSource>((ref) {
  return NotificationsDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class NotificationsDataSource {
  Future notificationsList();
}

class NotificationsDataSourceImpl implements NotificationsDataSource {
  final DioClient dioClient;
  NotificationsDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future notificationsList() async {
    final response = await dioClient.get(Endpoints.livelapseListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
