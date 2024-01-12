import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final accountsDataSourceProvider =
    Provider.autoDispose<AccountsDataSource>((ref) {
  return AccountsDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class AccountsDataSource {
  Future getProfile();
  Future getOrganisation();
}

class AccountsDataSourceImpl implements AccountsDataSource {
  final DioClient dioClient;
  AccountsDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future getProfile() async {
    final response = await dioClient.get(Endpoints.getProfileUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future getOrganisation() async {
    final response = await dioClient.get(Endpoints.getOrganisationUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
