import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final cameraDataSourceProvider =
    Provider.autoDispose<AccountsDataSource>((ref) {
  return CameraDetailsDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class AccountsDataSource {
  Future imagesByCameraId(String projectId, String cameraId, {searchDate = ''});
  Future cameraById(String projectId, String cameraId);
}

class CameraDetailsDataSourceImpl implements AccountsDataSource {
  final DioClient dioClient;
  CameraDetailsDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future cameraById(String projectId, String cameraId) async {
    final response =
        await dioClient.get(Endpoints.CameraByIdUrl(projectId, cameraId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future imagesByCameraId(String projectId, String cameraId,
      {searchDate = ''}) async {
    DateTime date = DateTime.now();
    log("before res" + date.toString());

    final response = await dioClient.get(Endpoints.imagesByCameraIdUrl(
        projectId, cameraId,
        searchDate: searchDate));
    if (response.statusCode == 200) {
      log("after res" + date.toString());
      return response.data;
    } else {
      return ServerException();
    }
  }
}
