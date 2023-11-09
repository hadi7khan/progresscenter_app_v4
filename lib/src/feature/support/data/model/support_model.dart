import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

List<SupportModel> supportModelFromJson(String str) => List<SupportModel>.from(json.decode(str).map((x) => SupportModel.fromJson(x)));

String supportModelToJson(List<SupportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class SupportModel with _$SupportModel {
    const factory SupportModel({
        required String id,
        required String topic,
        required String subject,
        required String detail,
        required String status,
        required User user,
        required DateTime createdAt,
        required DateTime updatedAt,
    }) = _SupportModel;

    factory SupportModel.fromJson(Map<String, dynamic> json) => _$SupportModelFromJson(json);
}

@freezed
class User with _$User {
    const factory User({
        required String id,
        required String name,
        @JsonKey(name: '_id') String? userId,
    }) = _User;

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}