import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/data/models/site_gallery_model.dart';

part 'site_gallery_state.freezed.dart';

@freezed
class SiteGalleryState with _$SiteGalleryState{
  const factory SiteGalleryState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<SiteGalleryModel>> siteGallery,
      String? errorMessage}) = _SiteGalleryState;
}
