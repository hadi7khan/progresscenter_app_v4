import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final docsDataSourceProvider = Provider.autoDispose<DocsDataSource>((ref) {
  return DocDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class DocsDataSource {
  Future docList({searchText = ''});
  Future addDocument(folderId, data);
}

class DocDataSourceImpl implements DocsDataSource {
  final DioClient dioClient;
  DocDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future docList({searchText = ''}) async {
    final response = await dioClient.get(Endpoints.docListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future addDocument(folderId, data) async {
    final response =
        await dioClient.post(Endpoints.addDocomentUrl(folderId), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
