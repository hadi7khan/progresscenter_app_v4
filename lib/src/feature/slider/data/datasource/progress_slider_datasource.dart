import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final progressSliderSourceProvider =
    Provider.autoDispose<ProgressSliderDataSource>((ref) {
  return ProgressSliderDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class ProgressSliderDataSource {
  Future progressSlider(String projectId, String cameraId);
}

class ProgressSliderDataSourceImpl implements ProgressSliderDataSource {
  final DioClient dioClient;
  ProgressSliderDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future progressSlider(String projectId, String cameraId) async {
    final response =
        await dioClient.get(Endpoints.progressSliderUrl(projectId, cameraId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
