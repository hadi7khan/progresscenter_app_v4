// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userlean_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserLeanState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<UserLeanModel>> get userlean =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserLeanStateCopyWith<UserLeanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLeanStateCopyWith<$Res> {
  factory $UserLeanStateCopyWith(
          UserLeanState value, $Res Function(UserLeanState) then) =
      _$UserLeanStateCopyWithImpl<$Res, UserLeanState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<UserLeanModel>> userlean,
      String? errorMessage});
}

/// @nodoc
class _$UserLeanStateCopyWithImpl<$Res, $Val extends UserLeanState>
    implements $UserLeanStateCopyWith<$Res> {
  _$UserLeanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? userlean = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      userlean: null == userlean
          ? _value.userlean
          : userlean // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<UserLeanModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLeanStateCopyWith<$Res>
    implements $UserLeanStateCopyWith<$Res> {
  factory _$$_UserLeanStateCopyWith(
          _$_UserLeanState value, $Res Function(_$_UserLeanState) then) =
      __$$_UserLeanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<UserLeanModel>> userlean,
      String? errorMessage});
}

/// @nodoc
class __$$_UserLeanStateCopyWithImpl<$Res>
    extends _$UserLeanStateCopyWithImpl<$Res, _$_UserLeanState>
    implements _$$_UserLeanStateCopyWith<$Res> {
  __$$_UserLeanStateCopyWithImpl(
      _$_UserLeanState _value, $Res Function(_$_UserLeanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? userlean = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_UserLeanState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      userlean: null == userlean
          ? _value.userlean
          : userlean // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<UserLeanModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserLeanState implements _UserLeanState {
  const _$_UserLeanState(
      {this.isFetching = false,
      this.userlean = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<UserLeanModel>> userlean;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserLeanState(isFetching: $isFetching, userlean: $userlean, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLeanState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.userlean, userlean) ||
                other.userlean == userlean) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, userlean, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLeanStateCopyWith<_$_UserLeanState> get copyWith =>
      __$$_UserLeanStateCopyWithImpl<_$_UserLeanState>(this, _$identity);
}

abstract class _UserLeanState implements UserLeanState {
  const factory _UserLeanState(
      {final bool isFetching,
      final AsyncValue<List<UserLeanModel>> userlean,
      final String? errorMessage}) = _$_UserLeanState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<UserLeanModel>> get userlean;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UserLeanStateCopyWith<_$_UserLeanState> get copyWith =>
      throw _privateConstructorUsedError;
}
