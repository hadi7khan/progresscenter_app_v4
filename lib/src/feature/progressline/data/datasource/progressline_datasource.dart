import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final progresslineDataSourceProvider =
    Provider.autoDispose<ProgresslineDataSource>((ref) {
  return ProgresslineDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class ProgresslineDataSource {
  Future progressLine(projectId, {searchText = ''});
  Future postComment(String id, data);
  Future comments(String id);
  Future progresslineById(progresslineId, projectId);
  Future allProgressLinePosts();
}

class ProgresslineDataSourceImpl implements ProgresslineDataSource {
  final DioClient dioClient;
  ProgresslineDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future progressLine(projectId, {searchText = ''}) async {
    final response = await dioClient.get(Endpoints.progressLineUrl(projectId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future postComment(String id, data) async {
    final response =
        await dioClient.post(Endpoints.postCommentUrl(id), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future comments(String id) async {
    final response = await dioClient.get(Endpoints.commentsUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future progresslineById(progresslineId, projectId) async {
    final response = await dioClient
        .get(Endpoints.progresslineByIdUrl(progresslineId, projectId));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future allProgressLinePosts() async {
    final response = await dioClient.get(Endpoints.allProgressLinePostsUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
