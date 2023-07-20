// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraByIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<CameraByIdModel> get cameraById =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraByIdStateCopyWith<CameraByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraByIdStateCopyWith<$Res> {
  factory $CameraByIdStateCopyWith(
          CameraByIdState value, $Res Function(CameraByIdState) then) =
      _$CameraByIdStateCopyWithImpl<$Res, CameraByIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<CameraByIdModel> cameraById,
      String? errorMessage});
}

/// @nodoc
class _$CameraByIdStateCopyWithImpl<$Res, $Val extends CameraByIdState>
    implements $CameraByIdStateCopyWith<$Res> {
  _$CameraByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? cameraById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraById: null == cameraById
          ? _value.cameraById
          : cameraById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<CameraByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CameraByIdStateCopyWith<$Res>
    implements $CameraByIdStateCopyWith<$Res> {
  factory _$$_CameraByIdStateCopyWith(
          _$_CameraByIdState value, $Res Function(_$_CameraByIdState) then) =
      __$$_CameraByIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<CameraByIdModel> cameraById,
      String? errorMessage});
}

/// @nodoc
class __$$_CameraByIdStateCopyWithImpl<$Res>
    extends _$CameraByIdStateCopyWithImpl<$Res, _$_CameraByIdState>
    implements _$$_CameraByIdStateCopyWith<$Res> {
  __$$_CameraByIdStateCopyWithImpl(
      _$_CameraByIdState _value, $Res Function(_$_CameraByIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? cameraById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CameraByIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraById: null == cameraById
          ? _value.cameraById
          : cameraById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<CameraByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CameraByIdState implements _CameraByIdState {
  const _$_CameraByIdState(
      {this.isFetching = false,
      this.cameraById = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<CameraByIdModel> cameraById;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CameraByIdState(isFetching: $isFetching, cameraById: $cameraById, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraByIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.cameraById, cameraById) ||
                other.cameraById == cameraById) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, cameraById, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraByIdStateCopyWith<_$_CameraByIdState> get copyWith =>
      __$$_CameraByIdStateCopyWithImpl<_$_CameraByIdState>(this, _$identity);
}

abstract class _CameraByIdState implements CameraByIdState {
  const factory _CameraByIdState(
      {final bool isFetching,
      final AsyncValue<CameraByIdModel> cameraById,
      final String? errorMessage}) = _$_CameraByIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<CameraByIdModel> get cameraById;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CameraByIdStateCopyWith<_$_CameraByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
