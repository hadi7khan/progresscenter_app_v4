// To parse this JSON data, do
//
//     final siteGalleryModel = siteGalleryModelFromJson(jsonString);

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
    Location? location,
    String? id,
    String? name,
    String? takenAtDate,
    String? takenAtTime,
    String? path,
    String? coverImage,
    String? status,
    String? type,
    String? reseller,
    String? client,
    String? project,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SiteGalleryModel;

  factory SiteGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$SiteGalleryModelFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    String? name,
    dynamic latitude,
    dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
