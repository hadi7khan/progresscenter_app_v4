import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'client_accounts_model.freezed.dart';
part 'client_accounts_model.g.dart';

List<ClientAccountsModel> clientAccountsModelFromJson(String str) =>
    List<ClientAccountsModel>.from(
        json.decode(str).map((x) => ClientAccountsModel.fromJson(x)));

String clientAccountsModelToJson(List<ClientAccountsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ClientAccountsModel with _$ClientAccountsModel {
  const factory ClientAccountsModel({
    Preferences? preferences,
    String? id,
    String? name,
    String? logo,
    String? clientAccountsModelId,
    String? logoUrl,
  }) = _ClientAccountsModel;

  factory ClientAccountsModel.fromJson(Map<String, dynamic> json) =>
      _$ClientAccountsModelFromJson(json);
}

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    String? primaryColor,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}
