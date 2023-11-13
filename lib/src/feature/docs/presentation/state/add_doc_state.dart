import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_doc_state.freezed.dart';

@freezed
class AddDocState with _$AddDocState {
  const factory AddDocState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _AddDocState;
}