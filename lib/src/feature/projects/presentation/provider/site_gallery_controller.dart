import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/site_gallery_state.dart';

final siteGalleryControllerProvider =
    StateNotifierProvider.autoDispose<SiteGalleryController, SiteGalleryState>(
        (ref) {
  final projectService = ref.watch(projectProvider);
  return SiteGalleryController(const SiteGalleryState(), projectService);
});

class SiteGalleryController extends StateNotifier<SiteGalleryState> {
  SiteGalleryController(super.state, this.service);
  final ProjectRepositoryImpl service;

  void getSiteGallery(id) async {
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
