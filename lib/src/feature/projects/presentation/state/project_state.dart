import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<ProjectModel>> projects,
      String? errorMessage}) = _ProjectState;
}
