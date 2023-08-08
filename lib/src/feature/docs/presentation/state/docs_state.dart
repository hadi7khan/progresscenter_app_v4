import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/model/docs_model.dart';

part 'docs_state.freezed.dart';

@freezed
class DocsState with _$DocsState {
  const factory DocsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<DocsModel>> docs,
      String? errorMessage}) = _DocsState;
}
