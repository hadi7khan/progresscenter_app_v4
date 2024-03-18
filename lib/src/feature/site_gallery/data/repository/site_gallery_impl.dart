import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_exception.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/data/datasource/site_gallery_datasource.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/data/models/site_gallery_model.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/domain/site_gallery_repository.dart';

final siteGalleryProvider = Provider.autoDispose<SiteGalleryRepositoryImpl>(
  (ref) {
    return SiteGalleryRepositoryImpl(
        siteGalleryDataSource: ref.watch(siteGalleryDataSourceProvider));
  },
);

class SiteGalleryRepositoryImpl implements SiteGalleryRepository {
  final SiteGalleryDataSource siteGalleryDataSource;
  SiteGalleryRepositoryImpl({
    required this.siteGalleryDataSource,
  });

  @override
  Future<Either<Failure, List<SiteGalleryModel>>> siteGalleryList(
      String id) async {
    try {
      final result = await siteGalleryDataSource.siteGalleryList(id);
      return Right(
          (result as List).map((e) => SiteGalleryModel.fromJson(e)).toList());
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);

      rethrow;
    }
  }
}
