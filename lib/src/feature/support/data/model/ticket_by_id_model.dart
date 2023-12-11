
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ticket_by_id_model.freezed.dart';
part 'ticket_by_id_model.g.dart';

TicketByIdModel ticketByIdModelFromJson(String str) => TicketByIdModel.fromJson(json.decode(str));

String ticketByIdModelToJson(TicketByIdModel data) => json.encode(data.toJson());

@freezed
class TicketByIdModel with _$TicketByIdModel {
    const factory TicketByIdModel({
        @JsonKey(name: '_id') String? id,
        required String topic,
        required String subject,
        required String detail,
        required String status,
        required User user,
        required DateTime createdAt,
        required DateTime updatedAt,
    }) = _TicketByIdModel;

    factory TicketByIdModel.fromJson(Map<String, dynamic> json) => _$TicketByIdModelFromJson(json);
}

@freezed
class User with _$User {
    const factory User({
        required Preset preset,
        @JsonKey(name: '_id') String? userId,
        required String name,
    }) = _User;

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Preset with _$Preset {
    const factory Preset({
        required String color,
    }) = _Preset;

    factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}