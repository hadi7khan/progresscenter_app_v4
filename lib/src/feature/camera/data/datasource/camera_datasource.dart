import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final cameraDataSourceProvider =
    Provider.autoDispose<CameraDataSource>((ref) {
  return CameraDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class CameraDataSource {
  Future cameraList(String id);
}

class CameraDataSourceImpl implements CameraDataSource {
  final DioClient dioClient;
  CameraDataSourceImpl({
    required this.dioClient,
  });
  @override
  Future cameraList(id) async {
    final response = await dioClient.get(Endpoints.cameraListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

}
