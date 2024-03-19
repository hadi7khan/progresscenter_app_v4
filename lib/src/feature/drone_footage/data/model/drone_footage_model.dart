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
    @Default(Location()) Location? location,
    @Default(Details()) Details? details,
    @JsonKey(name: '_id') String? id,
    @Default('') String? name,
    DateTime? createdAt,
    @Default('') String? url,
    @Default('') String? status,
    @Default('') String? user,
    @Default('') String? shareUrl,
  }) = _DroneFootageModel;

  factory DroneFootageModel.fromJson(Map<String, dynamic> json) =>
      _$DroneFootageModelFromJson(json);
}

@freezed
class Details with _$Details {
  const factory Details({
    @Default('') String? provider,
  }) = _Details;

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @Default('') String? name,
    dynamic latitude,
    dynamic longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
