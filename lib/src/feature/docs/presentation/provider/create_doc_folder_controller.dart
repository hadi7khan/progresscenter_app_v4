import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/repository/docs_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/state/add_doc_state.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/state/create_doc_folder_state.dart';

final createDocFolderProvider = StateNotifierProvider.autoDispose<
    CreateDocFolderController, CreateDocState>(
  (ref) {
    final docService = ref.watch(docsProvider);
    return CreateDocFolderController(const CreateDocState(), docService);
  },
);

class CreateDocFolderController extends StateNotifier<CreateDocState> {
  final DocsRepositoryImpl service;
  CreateDocFolderController(super.state, this.service);

  Future createDocFolder(data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.createDocumentFolder(data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });

    return result;
  }
}
