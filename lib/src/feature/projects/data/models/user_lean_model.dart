import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_lean_model.freezed.dart';
part 'user_lean_model.g.dart';

List<UserLeanModel> userLeanModelFromJson(String str) => List<UserLeanModel>.from(json.decode(str).map((x) => UserLeanModel.fromJson(x)));

String userLeanModelToJson(List<UserLeanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class UserLeanModel with _$UserLeanModel {
    const factory UserLeanModel({
        Preset? preset,
        String? id,
        String? name,
        String? email,
        String? dp,
        String? userLeanModelId,
        String? dpUrl,
    }) = _UserLeanModel;

    factory UserLeanModel.fromJson(Map<String, dynamic> json) => _$UserLeanModelFromJson(json);
}

@freezed
class Preset with _$Preset {
    const factory Preset({
        String? color,
    }) = _Preset;

    factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);
}