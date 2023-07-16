import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final cctvDataSourceProvider = Provider.autoDispose<CctvDataSource>((ref) {
  return CctvDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class CctvDataSource {
  Future cctvCameraList(String id);
}

class CctvDataSourceImpl implements CctvDataSource {
  final DioClient dioClient;
  CctvDataSourceImpl({
    required this.dioClient,
  });
  @override
  Future cctvCameraList(String id) async {
    final response = await dioClient.get(Endpoints.cctvCameraListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
