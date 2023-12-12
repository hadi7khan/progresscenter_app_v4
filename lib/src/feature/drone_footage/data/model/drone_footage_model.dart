import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'drone_footage_model.freezed.dart';
part 'drone_footage_model.g.dart';

List<DroneFootageModel> droneFootageModelFromJson(String str) =>
    List<DroneFootageModel>.from(
        json.decode(str).map((x) => DroneFootageModel.fromJson(x)));

String droneFootageModelToJson(List<DroneFootageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class DroneFootageModel with _$DroneFootageModel {
  const factory DroneFootageModel({
    Location? location,
    Details? details,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? reseller,
    String? client,
    Project? project,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? url,
    String? path,
    String? status,
    String? user,
  }) = _DroneFootageModel;

  factory DroneFootageModel.fromJson(Map<String, dynamic> json) =>
      _$DroneFootageModelFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    String? provider,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
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

@freezed
class Project with _$Project {
  const factory Project({
    String? id,
    String? name,
    String? projectId,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
