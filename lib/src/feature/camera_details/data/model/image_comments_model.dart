import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/all_image_comments_model.dart';

part 'image_comments_model.freezed.dart';
part 'image_comments_model.g.dart';

ImageCommentsModel imageCommentsModelFromJson(String str) =>
    ImageCommentsModel.fromJson(json.decode(str));

String imageCommentsModelToJson(ImageCommentsModel data) =>
    json.encode(data.toJson());

@freezed
class ImageCommentsModel with _$ImageCommentsModel {
  const factory ImageCommentsModel({
    String? url,
    List<Comment>? comments,
  }) = _ImageCommentsModel;

  factory ImageCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$ImageCommentsModelFromJson(json);
}
