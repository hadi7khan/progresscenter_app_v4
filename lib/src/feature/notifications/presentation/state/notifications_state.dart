import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/models/notifications_model.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<NotificationsModel> notifications,
      String? errorMessage}) = _NotificationsState;
}
