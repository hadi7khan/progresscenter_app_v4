import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/data/repository/site_gallery_impl.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/state/site_gallery_state.dart';

final siteGalleryControllerProvider =
    StateNotifierProvider.autoDispose<SiteGalleryController, SiteGalleryState>(
        (ref) {
  final siteGalleryService = ref.watch(siteGalleryProvider);
  return SiteGalleryController(const SiteGalleryState(), siteGalleryService);
});

class SiteGalleryController extends StateNotifier<SiteGalleryState> {
  SiteGalleryController(super.state, this.service);
  final SiteGalleryRepositoryImpl service;

  Future getSiteGallery(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.siteGalleryList(id);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, siteGallery: AsyncValue.data(r));
    });
  }
}
