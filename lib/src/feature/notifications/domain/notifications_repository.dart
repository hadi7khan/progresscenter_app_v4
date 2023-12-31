import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/models/notifications_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationsModel>>> notificationsList();
}
