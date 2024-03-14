import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/comments_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';

abstract class ProgresslineRepository {
  Future<Either<Failure, List<ProgressLineModel>>> progressLine(projectId);
  Future<Either<Failure, dynamic>> postComment(String id, data);
  Future<Either<Failure, List<CommentsModel>>> comments(String id);
  Future<Either<Failure, ProgressLineModel>> progresslineById(
      progresslineId, projectId);
  Future<Either<Failure, List<ProgressLineModel>>> allProgressLinePosts();
}
