import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/repository/docs_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/state/docs_state.dart';

final docsControllerProvider =
    StateNotifierProvider.autoDispose<DocsController, DocsState>((ref) {
  final docsService = ref.watch(docsProvider);
  return DocsController(const DocsState(), docsService);
});

class DocsController extends StateNotifier<DocsState> {
  DocsController(super.state, this.service);
  final DocsRepositoryImpl service;

  Future getDocs() async {
    state = state.copyWith(isFetching: true);
    final result = await service.docList();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, docs: AsyncValue.data(r));
    });
  }
}
