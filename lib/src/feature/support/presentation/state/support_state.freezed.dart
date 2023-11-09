// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SupportState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<SupportModel>> get users =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupportStateCopyWith<SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<SupportModel>> users,
      String? errorMessage});
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? users = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SupportModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupportStateCopyWith<$Res>
    implements $SupportStateCopyWith<$Res> {
  factory _$$_SupportStateCopyWith(
          _$_SupportState value, $Res Function(_$_SupportState) then) =
      __$$_SupportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<SupportModel>> users,
      String? errorMessage});
}

/// @nodoc
class __$$_SupportStateCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$_SupportState>
    implements _$$_SupportStateCopyWith<$Res> {
  __$$_SupportStateCopyWithImpl(
      _$_SupportState _value, $Res Function(_$_SupportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? users = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SupportState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SupportModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SupportState implements _SupportState {
  const _$_SupportState(
      {this.isFetching = false,
      this.users = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<SupportModel>> users;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SupportState(isFetching: $isFetching, users: $users, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching, users, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportStateCopyWith<_$_SupportState> get copyWith =>
      __$$_SupportStateCopyWithImpl<_$_SupportState>(this, _$identity);
}

abstract class _SupportState implements SupportState {
  const factory _SupportState(
      {final bool isFetching,
      final AsyncValue<List<SupportModel>> users,
      final String? errorMessage}) = _$_SupportState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<SupportModel>> get users;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SupportStateCopyWith<_$_SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}
