import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/drone_footage_model.dart';

part 'drone_footage_state.freezed.dart';

@freezed
class DroneFootageState with _$DroneFootageState {
  const factory DroneFootageState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<DroneFootageModel>> droneFootages,
      String? errorMessage}) = _DroneFootageState;
}
