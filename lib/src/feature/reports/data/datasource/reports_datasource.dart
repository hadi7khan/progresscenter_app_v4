import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final reportsDataSourceProvider =
    Provider.autoDispose<ReportsDataSource>((ref) {
  return ReportsDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class ReportsDataSource {
  Future generateReport(String projectId, String cameraId, data);
  Future scheduledReport(String projectId, String cameraId, data);
}

class ReportsDataSourceImpl implements ReportsDataSource {
  final DioClient dioClient;
  ReportsDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future generateReport(String projectId, String cameraId, data) async {
    final response = await dioClient
        .post(Endpoints.instantReportUrl(projectId, cameraId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future scheduledReport(String projectId, String cameraId, data) async {
    final response = await dioClient
        .post(Endpoints.scheduledReportUrl(projectId, cameraId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
