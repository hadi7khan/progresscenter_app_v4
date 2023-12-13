import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final siteGalleryDataSourceProvider =
    Provider.autoDispose<SiteGalleryDataSource>((ref) {
  return SiteGalleryDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class SiteGalleryDataSource {
  Future siteGalleryList(String id);
}

class SiteGalleryDataSourceImpl implements SiteGalleryDataSource {
  final DioClient dioClient;
  SiteGalleryDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future siteGalleryList(String id) async {
    final response = await dioClient.get(Endpoints.siteGalleryListUrl(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
