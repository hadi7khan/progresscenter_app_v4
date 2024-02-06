// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livelapse_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LivelapseByIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<LivelapseByIdModel> get livelapseById =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LivelapseByIdStateCopyWith<LivelapseByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivelapseByIdStateCopyWith<$Res> {
  factory $LivelapseByIdStateCopyWith(
          LivelapseByIdState value, $Res Function(LivelapseByIdState) then) =
      _$LivelapseByIdStateCopyWithImpl<$Res, LivelapseByIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<LivelapseByIdModel> livelapseById,
      String? errorMessage});
}

/// @nodoc
class _$LivelapseByIdStateCopyWithImpl<$Res, $Val extends LivelapseByIdState>
    implements $LivelapseByIdStateCopyWith<$Res> {
  _$LivelapseByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? livelapseById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      livelapseById: null == livelapseById
          ? _value.livelapseById
          : livelapseById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LivelapseByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LivelapseByIdStateCopyWith<$Res>
    implements $LivelapseByIdStateCopyWith<$Res> {
  factory _$$_LivelapseByIdStateCopyWith(_$_LivelapseByIdState value,
          $Res Function(_$_LivelapseByIdState) then) =
      __$$_LivelapseByIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<LivelapseByIdModel> livelapseById,
      String? errorMessage});
}

/// @nodoc
class __$$_LivelapseByIdStateCopyWithImpl<$Res>
    extends _$LivelapseByIdStateCopyWithImpl<$Res, _$_LivelapseByIdState>
    implements _$$_LivelapseByIdStateCopyWith<$Res> {
  __$$_LivelapseByIdStateCopyWithImpl(
      _$_LivelapseByIdState _value, $Res Function(_$_LivelapseByIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? livelapseById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_LivelapseByIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      livelapseById: null == livelapseById
          ? _value.livelapseById
          : livelapseById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<LivelapseByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LivelapseByIdState implements _LivelapseByIdState {
  const _$_LivelapseByIdState(
      {this.isFetching = false,
      this.livelapseById = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<LivelapseByIdModel> livelapseById;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LivelapseByIdState(isFetching: $isFetching, livelapseById: $livelapseById, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LivelapseByIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.livelapseById, livelapseById) ||
                other.livelapseById == livelapseById) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, livelapseById, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LivelapseByIdStateCopyWith<_$_LivelapseByIdState> get copyWith =>
      __$$_LivelapseByIdStateCopyWithImpl<_$_LivelapseByIdState>(
          this, _$identity);
}

abstract class _LivelapseByIdState implements LivelapseByIdState {
  const factory _LivelapseByIdState(
      {final bool isFetching,
      final AsyncValue<LivelapseByIdModel> livelapseById,
      final String? errorMessage}) = _$_LivelapseByIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<LivelapseByIdModel> get livelapseById;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LivelapseByIdStateCopyWith<_$_LivelapseByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
