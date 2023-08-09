import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progress_line_model.dart';

abstract class ProgresslineRepository {
  Future<Either<Failure, List<ProgressLineModel>>> progressLine();
}
