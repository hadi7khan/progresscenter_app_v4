import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ticket_replies_model.freezed.dart';
part 'ticket_replies_model.g.dart';

List<TicketRepliesModel> ticketRepliesModelFromJson(String str) =>
    List<TicketRepliesModel>.from(
        json.decode(str).map((x) => TicketRepliesModel.fromJson(x)));

String ticketRepliesModelToJson(List<TicketRepliesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class TicketRepliesModel with _$TicketRepliesModel {
  const factory TicketRepliesModel({
    @JsonKey(name: '_id') String? id,
    required String message,
    required User user,
    required String supportTicket,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userType,
  }) = _TicketRepliesModel;

  factory TicketRepliesModel.fromJson(Map<String, dynamic> json) =>
      _$TicketRepliesModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    Preset? preset,
    String? id,
    String? name,
    String? dpUrl,
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
