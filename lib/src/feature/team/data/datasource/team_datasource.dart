import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final teamDataSourceProvider = Provider.autoDispose<TeamDataSource>((ref) {
  return TeamDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class TeamDataSource {
  Future userList({searchText = ''});
}

class TeamDataSourceImpl implements TeamDataSource {
  final DioClient dioClient;
  TeamDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future userList({searchText = ''}) async {
    final response = await dioClient.get(Endpoints.userListUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
