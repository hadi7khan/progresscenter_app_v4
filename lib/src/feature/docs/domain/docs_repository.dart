import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/docs/data/model/docs_model.dart';

abstract class DocsRepository {
  Future<Either<Failure, List<DocsModel>>> docList();
  Future<Either<Failure, dynamic>> addDocument(
      String folderId, data);
}
