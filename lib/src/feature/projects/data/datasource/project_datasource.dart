import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final projectDataSourceProvider =
    Provider.autoDispose<ProjectDataSource>((ref) {
  return ProjectDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class ProjectDataSource {
  Future projectList({searchText = ''});
  Future cameraList(String id);
  Future projectById(String id);
}

class ProjectDataSourceImpl implements ProjectDataSource {
  final DioClient dioClient;
  ProjectDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future projectList({
    searchText = '',
  }) async {
    final response = await dioClient.get(Endpoints.projectListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future projectById(String id) async {
    final response = await dioClient.get(Endpoints.projectByIdUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
  
  @override
  Future cameraList(id) async{
    final response = await dioClient.get(Endpoints.cameraListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
