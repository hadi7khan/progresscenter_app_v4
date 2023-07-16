import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final droneFootageDataSourceProvider =
    Provider.autoDispose<DroneFootageDataSource>((ref) {
  return DroneFootageDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class DroneFootageDataSource {
  Future droneFootageList(String id);
}

class DroneFootageDataSourceImpl implements DroneFootageDataSource {
  final DioClient dioClient;
  DroneFootageDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future droneFootageList(String id) async {
    final response = await dioClient.get(Endpoints.droneFootageListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
