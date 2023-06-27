import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final projectDataSourceProvider = Provider.autoDispose<ProjectDataSource>((ref) {
  return ProjectDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class ProjectDataSource {
  Future projectList(String token, {searchText = ''});
}

class ProjectDataSourceImpl implements ProjectDataSource {
  final DioClient dioClient;
  ProjectDataSourceImpl({
    required this.dioClient,
  });


  @override
  Future projectList(
    token, {
    searchText = '',
  }) async {
    final response = await dioClient.get(Endpoints.projectListUrl(
      token,
    ));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

}