import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/support_model.dart';

abstract class SupportRepository {
  Future<Either<Failure, List<SupportModel>>> supportList();
}
