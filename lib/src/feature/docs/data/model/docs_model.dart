import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'docs_model.freezed.dart';
part 'docs_model.g.dart';

List<DocsModel> docsModelFromJson(String str) =>
    List<DocsModel>.from(json.decode(str).map((x) => DocsModel.fromJson(x)));

String docsModelToJson(List<DocsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class DocsModel with _$DocsModel {
  const factory DocsModel({
    String? id,
    String? name,
    CreatedBy? createdBy,
    String? client,
    List<FileElement>? files,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DocsModel;

  factory DocsModel.fromJson(Map<String, dynamic> json) =>
      _$DocsModelFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    Preset? preset,
    String? id,
    String? name,
    String? dp,
    String? designation,
    String? createdById,
    String? dpUrl,
    String? email,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
class Preset with _$Preset {
  const factory Preset({
    String? color,
  }) = _Preset;

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}

@freezed
class FileElement with _$FileElement {
  const factory FileElement({
    String? name,
    String? path,
    String? fileSize,
    UploadedBy? uploadedBy,
    List<CreatedBy>? users,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
  }) = _FileElement;

  factory FileElement.fromJson(Map<String, dynamic> json) =>
      _$FileElementFromJson(json);
}

@freezed
class UploadedBy with _$UploadedBy {
  const factory UploadedBy({
    String? id,
    String? name,
    String? uploadedById,
  }) = _UploadedBy;

  factory UploadedBy.fromJson(Map<String, dynamic> json) =>
      _$UploadedByFromJson(json);
}
