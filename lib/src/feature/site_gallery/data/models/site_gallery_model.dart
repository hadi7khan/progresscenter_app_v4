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
    @JsonKey(name: '_id') String? id,
    String? name,
    String? path,
    String? status,
    String? type,
    String? reseller,
    String? client,
    String? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
    String? user,
  }) = _SiteGalleryModel;

  factory SiteGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$SiteGalleryModelFromJson(json);
}
