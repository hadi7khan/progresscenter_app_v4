import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final livelapseSourceProvider =
    Provider.autoDispose<LivelapseDataSource>((ref) {
  return LivelapseDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class LivelapseDataSource {
  Future livelapseList(String projectId, String cameraId);
  Future createBasicLivelapse(String projectId, String cameraId, data);
  Future createAdvancedLivelapse(String projectId, String cameraId, data);
}

class LivelapseDataSourceImpl implements LivelapseDataSource {
  final DioClient dioClient;
  LivelapseDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future livelapseList(String projectId, String cameraId) async {
    final response =
        await dioClient.get(Endpoints.livelapseListUrl(projectId, cameraId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future createBasicLivelapse(String projectId, String cameraId, data) async {
    final response = await dioClient
        .post(Endpoints.createBasicLivelapseUrl(projectId, cameraId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future createAdvancedLivelapse(String projectId, String cameraId, data) async {
    final response = await dioClient
        .post(Endpoints.createAdvancedLivelapseUrl(projectId, cameraId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
