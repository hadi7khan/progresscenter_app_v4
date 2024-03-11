// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduledReportModel _$ScheduledReportModelFromJson(Map<String, dynamic> json) {
  return _ScheduledReportModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduledReportModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get camera => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduledReportModelCopyWith<ScheduledReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledReportModelCopyWith<$Res> {
  factory $ScheduledReportModelCopyWith(ScheduledReportModel value,
          $Res Function(ScheduledReportModel) then) =
      _$ScheduledReportModelCopyWithImpl<$Res, ScheduledReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? camera,
      String? user,
      String? type,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ScheduledReportModelCopyWithImpl<$Res,
        $Val extends ScheduledReportModel>
    implements $ScheduledReportModelCopyWith<$Res> {
  _$ScheduledReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? camera = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduledReportModelCopyWith<$Res>
    implements $ScheduledReportModelCopyWith<$Res> {
  factory _$$_ScheduledReportModelCopyWith(_$_ScheduledReportModel value,
          $Res Function(_$_ScheduledReportModel) then) =
      __$$_ScheduledReportModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? camera,
      String? user,
      String? type,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_ScheduledReportModelCopyWithImpl<$Res>
    extends _$ScheduledReportModelCopyWithImpl<$Res, _$_ScheduledReportModel>
    implements _$$_ScheduledReportModelCopyWith<$Res> {
  __$$_ScheduledReportModelCopyWithImpl(_$_ScheduledReportModel _value,
      $Res Function(_$_ScheduledReportModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? camera = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_ScheduledReportModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduledReportModel implements _ScheduledReportModel {
  const _$_ScheduledReportModel(
      {@JsonKey(name: "_id") this.id,
      this.camera,
      this.user,
      this.type,
      this.createdAt,
      this.updatedAt});

  factory _$_ScheduledReportModel.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduledReportModelFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? camera;
  @override
  final String? user;
  @override
  final String? type;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ScheduledReportModel(id: $id, camera: $camera, user: $user, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduledReportModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, camera, user, type, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduledReportModelCopyWith<_$_ScheduledReportModel> get copyWith =>
      __$$_ScheduledReportModelCopyWithImpl<_$_ScheduledReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduledReportModelToJson(
      this,
    );
  }
}

abstract class _ScheduledReportModel implements ScheduledReportModel {
  const factory _ScheduledReportModel(
      {@JsonKey(name: "_id") final String? id,
      final String? camera,
      final String? user,
      final String? type,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_ScheduledReportModel;

  factory _ScheduledReportModel.fromJson(Map<String, dynamic> json) =
      _$_ScheduledReportModel.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get camera;
  @override
  String? get user;
  @override
  String? get type;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduledReportModelCopyWith<_$_ScheduledReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
