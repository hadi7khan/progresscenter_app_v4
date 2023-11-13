import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/repository/docs_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/state/add_doc_state.dart';

final addDocProvider =
    StateNotifierProvider.autoDispose<AddDocController, AddDocState>(
  (ref) {
    final docService = ref.watch(docsProvider);
    return AddDocController(const AddDocState(), docService);
  },
);

class AddDocController extends StateNotifier<AddDocState> {
  final DocsRepositoryImpl service;
  AddDocController(super.state, this.service);

  Future addDocument(folderId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.addDocument(folderId, data);
    // return result;
    // if (!mounted) return;
    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      // state = state.copyWith(
      //   isLoading: false,
      //     result: AsyncValue.data(r));
      return r;
    });
    print("valueee " + valueee.toString());
    return result;
  }
}
