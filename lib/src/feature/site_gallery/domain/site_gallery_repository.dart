import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/data/models/site_gallery_model.dart';

abstract class SiteGalleryRepository {
  Future<Either<Failure, List<SiteGalleryModel>>> siteGalleryList(String id);
}
