import 'package:fpdart/fpdart.dart';
import 'package:progresscenter_app_v4/src/core/network/failure.dart';
import 'package:progresscenter_app_v4/src/feature/slider/data/model/progress_slider_model.dart';

abstract class SliderProgressRepository {
  Future<Either<Failure, List<ProgressSliderModel>>> progressSlider(
      String projectId, String cameraId);
}
