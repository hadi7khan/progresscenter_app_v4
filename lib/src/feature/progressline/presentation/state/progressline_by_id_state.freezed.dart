// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progressline_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgresslineByIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<ProgressLineModel> get progresslineById =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgresslineByIdStateCopyWith<ProgresslineByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgresslineByIdStateCopyWith<$Res> {
  factory $ProgresslineByIdStateCopyWith(ProgresslineByIdState value,
          $Res Function(ProgresslineByIdState) then) =
      _$ProgresslineByIdStateCopyWithImpl<$Res, ProgresslineByIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ProgressLineModel> progresslineById,
      String? errorMessage});
}

/// @nodoc
class _$ProgresslineByIdStateCopyWithImpl<$Res,
        $Val extends ProgresslineByIdState>
    implements $ProgresslineByIdStateCopyWith<$Res> {
  _$ProgresslineByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? progresslineById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      progresslineById: null == progresslineById
          ? _value.progresslineById
          : progresslineById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ProgressLineModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgresslineByIdStateCopyWith<$Res>
    implements $ProgresslineByIdStateCopyWith<$Res> {
  factory _$$_ProgresslineByIdStateCopyWith(_$_ProgresslineByIdState value,
          $Res Function(_$_ProgresslineByIdState) then) =
      __$$_ProgresslineByIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ProgressLineModel> progresslineById,
      String? errorMessage});
}

/// @nodoc
class __$$_ProgresslineByIdStateCopyWithImpl<$Res>
    extends _$ProgresslineByIdStateCopyWithImpl<$Res, _$_ProgresslineByIdState>
    implements _$$_ProgresslineByIdStateCopyWith<$Res> {
  __$$_ProgresslineByIdStateCopyWithImpl(_$_ProgresslineByIdState _value,
      $Res Function(_$_ProgresslineByIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? progresslineById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ProgresslineByIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      progresslineById: null == progresslineById
          ? _value.progresslineById
          : progresslineById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ProgressLineModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProgresslineByIdState implements _ProgresslineByIdState {
  const _$_ProgresslineByIdState(
      {this.isFetching = false,
      this.progresslineById = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<ProgressLineModel> progresslineById;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProgresslineByIdState(isFetching: $isFetching, progresslineById: $progresslineById, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgresslineByIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.progresslineById, progresslineById) ||
                other.progresslineById == progresslineById) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, progresslineById, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgresslineByIdStateCopyWith<_$_ProgresslineByIdState> get copyWith =>
      __$$_ProgresslineByIdStateCopyWithImpl<_$_ProgresslineByIdState>(
          this, _$identity);
}

abstract class _ProgresslineByIdState implements ProgresslineByIdState {
  const factory _ProgresslineByIdState(
      {final bool isFetching,
      final AsyncValue<ProgressLineModel> progresslineById,
      final String? errorMessage}) = _$_ProgresslineByIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<ProgressLineModel> get progresslineById;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProgresslineByIdStateCopyWith<_$_ProgresslineByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
