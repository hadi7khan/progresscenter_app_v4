import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'site_gallery_model.freezed.dart';
part 'site_gallery_model.g.dart';

List<SiteGalleryModel> siteGalleryModelFromJson(String str) =>
    List<SiteGalleryModel>.from(
        json.decode(str).map((x) => SiteGalleryModel.fromJson(x)));

String siteGalleryModelToJson(List<SiteGalleryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class SiteGalleryModel with _$SiteGalleryModel {
  const factory SiteGalleryModel({
    @JsonKey(name: "_id") String? id,
    String? name,
    String? status,
    String? type,
    User? user,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
  }) = _SiteGalleryModel;

  factory SiteGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$SiteGalleryModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    String? id,
    String? name,
    String? userId,
    String? dpUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}
