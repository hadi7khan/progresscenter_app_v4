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
  Future projectById(String id);
  Future siteGalleryList(String id);
  Future userleanList();
  Future inviteMembers(data, id);
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
  Future siteGalleryList(String id) async {
    final response = await dioClient.get(Endpoints.siteGalleryListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future userleanList() async {
    final response = await dioClient.get(Endpoints.userleanListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future inviteMembers(data, id) async {
    final response = await dioClient.post(Endpoints.inviteMemberUrl(id), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
