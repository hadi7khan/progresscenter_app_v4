// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livelapse_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LivelapseState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<LivelapseModel>> get livelapse =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LivelapseStateCopyWith<LivelapseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivelapseStateCopyWith<$Res> {
  factory $LivelapseStateCopyWith(
          LivelapseState value, $Res Function(LivelapseState) then) =
      _$LivelapseStateCopyWithImpl<$Res, LivelapseState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<LivelapseModel>> livelapse,
      String? errorMessage});
}

/// @nodoc
class _$LivelapseStateCopyWithImpl<$Res, $Val extends LivelapseState>
    implements $LivelapseStateCopyWith<$Res> {
  _$LivelapseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? livelapse = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      livelapse: null == livelapse
          ? _value.livelapse
          : livelapse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<LivelapseModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LivelapseStateCopyWith<$Res>
    implements $LivelapseStateCopyWith<$Res> {
  factory _$$_LivelapseStateCopyWith(
          _$_LivelapseState value, $Res Function(_$_LivelapseState) then) =
      __$$_LivelapseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<LivelapseModel>> livelapse,
      String? errorMessage});
}

/// @nodoc
class __$$_LivelapseStateCopyWithImpl<$Res>
    extends _$LivelapseStateCopyWithImpl<$Res, _$_LivelapseState>
    implements _$$_LivelapseStateCopyWith<$Res> {
  __$$_LivelapseStateCopyWithImpl(
      _$_LivelapseState _value, $Res Function(_$_LivelapseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? livelapse = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_LivelapseState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      livelapse: null == livelapse
          ? _value.livelapse
          : livelapse // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<LivelapseModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LivelapseState implements _LivelapseState {
  const _$_LivelapseState(
      {this.isFetching = false,
      this.livelapse = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<LivelapseModel>> livelapse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LivelapseState(isFetching: $isFetching, livelapse: $livelapse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LivelapseState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.livelapse, livelapse) ||
                other.livelapse == livelapse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, livelapse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LivelapseStateCopyWith<_$_LivelapseState> get copyWith =>
      __$$_LivelapseStateCopyWithImpl<_$_LivelapseState>(this, _$identity);
}

abstract class _LivelapseState implements LivelapseState {
  const factory _LivelapseState(
      {final bool isFetching,
      final AsyncValue<List<LivelapseModel>> livelapse,
      final String? errorMessage}) = _$_LivelapseState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<LivelapseModel>> get livelapse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LivelapseStateCopyWith<_$_LivelapseState> get copyWith =>
      throw _privateConstructorUsedError;
}
