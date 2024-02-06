import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/repository/notifications_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/presentation/state/notifications_state.dart';
import 'dart:developer';

final notificationsControllerProvider = StateNotifierProvider.autoDispose<
    NotificationsController, NotificationsState>((ref) {
  final notificationsService = ref.watch(notificationsProvider);
  return NotificationsController(
      const NotificationsState(), notificationsService);
});

class NotificationsController extends StateNotifier<NotificationsState> {
  NotificationsController(super.state, this.service);
  final NotificationsRepositoryImpl service;

  Future getNotifications(int page) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.notificationsList(page);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, notifications: AsyncValue.data(r));
      value = r;
    });
    log("valueee " + value.toString());
    return value;
  }
}
