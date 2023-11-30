// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progressline_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProgresslineProjectModel _$ProgresslineProjectModelFromJson(
    Map<String, dynamic> json) {
  return _ProgresslineProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProgresslineProjectModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgresslineProjectModelCopyWith<ProgresslineProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgresslineProjectModelCopyWith<$Res> {
  factory $ProgresslineProjectModelCopyWith(ProgresslineProjectModel value,
          $Res Function(ProgresslineProjectModel) then) =
      _$ProgresslineProjectModelCopyWithImpl<$Res, ProgresslineProjectModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String coverImageUrl,
      String name,
      int postCount});
}

/// @nodoc
class _$ProgresslineProjectModelCopyWithImpl<$Res,
        $Val extends ProgresslineProjectModel>
    implements $ProgresslineProjectModelCopyWith<$Res> {
  _$ProgresslineProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coverImageUrl = null,
    Object? name = null,
    Object? postCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgresslineProjectModelCopyWith<$Res>
    implements $ProgresslineProjectModelCopyWith<$Res> {
  factory _$$_ProgresslineProjectModelCopyWith(
          _$_ProgresslineProjectModel value,
          $Res Function(_$_ProgresslineProjectModel) then) =
      __$$_ProgresslineProjectModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String coverImageUrl,
      String name,
      int postCount});
}

/// @nodoc
class __$$_ProgresslineProjectModelCopyWithImpl<$Res>
    extends _$ProgresslineProjectModelCopyWithImpl<$Res,
        _$_ProgresslineProjectModel>
    implements _$$_ProgresslineProjectModelCopyWith<$Res> {
  __$$_ProgresslineProjectModelCopyWithImpl(_$_ProgresslineProjectModel _value,
      $Res Function(_$_ProgresslineProjectModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coverImageUrl = null,
    Object? name = null,
    Object? postCount = null,
  }) {
    return _then(_$_ProgresslineProjectModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProgresslineProjectModel implements _ProgresslineProjectModel {
  const _$_ProgresslineProjectModel(
      {@JsonKey(name: "_id") required this.id,
      required this.coverImageUrl,
      required this.name,
      required this.postCount});

  factory _$_ProgresslineProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProgresslineProjectModelFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String coverImageUrl;
  @override
  final String name;
  @override
  final int postCount;

  @override
  String toString() {
    return 'ProgresslineProjectModel(id: $id, coverImageUrl: $coverImageUrl, name: $name, postCount: $postCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgresslineProjectModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, coverImageUrl, name, postCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgresslineProjectModelCopyWith<_$_ProgresslineProjectModel>
      get copyWith => __$$_ProgresslineProjectModelCopyWithImpl<
          _$_ProgresslineProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProgresslineProjectModelToJson(
      this,
    );
  }
}

abstract class _ProgresslineProjectModel implements ProgresslineProjectModel {
  const factory _ProgresslineProjectModel(
      {@JsonKey(name: "_id") required final String id,
      required final String coverImageUrl,
      required final String name,
      required final int postCount}) = _$_ProgresslineProjectModel;

  factory _ProgresslineProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProgresslineProjectModel.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get coverImageUrl;
  @override
  String get name;
  @override
  int get postCount;
  @override
  @JsonKey(ignore: true)
  _$$_ProgresslineProjectModelCopyWith<_$_ProgresslineProjectModel>
      get copyWith => throw _privateConstructorUsedError;
}
