import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_doc_folder_state.freezed.dart';

@freezed
class CreateDocState with _$CreateDocState {
  const factory CreateDocState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _CreateDocState;
}