import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_by_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';

part 'project_by_id_state.freezed.dart';

@freezed
class ProjectByIdState with _$ProjectByIdState {
  const factory ProjectByIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<ProjectModel> projectDetails,
      String? errorMessage}) = _ProjectByIdState;
}
