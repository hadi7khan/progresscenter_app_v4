import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final supportDataSourceProvider = Provider.autoDispose<SupportDataSource>((ref) {
  return SupportDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class SupportDataSource {
  Future supportList({searchText = ''});
}

class SupportDataSourceImpl implements SupportDataSource {
  final DioClient dioClient;
  SupportDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future supportList({searchText = ''}) async {
    final response = await dioClient.get(Endpoints.supportListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
