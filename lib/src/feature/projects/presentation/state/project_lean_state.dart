import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

part 'project_lean_state.freezed.dart';

@freezed
class ProjectLeanState with _$ProjectLeanState {
  const factory ProjectLeanState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<ProjectModel>> projectlean,
      String? errorMessage}) = _ProjectLeanState;
}
