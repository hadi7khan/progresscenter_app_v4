// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<AccountsModel> get account => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountsStateCopyWith<AccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(
          AccountsState value, $Res Function(AccountsState) then) =
      _$AccountsStateCopyWithImpl<$Res, AccountsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<AccountsModel> account,
      String? errorMessage});
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res, $Val extends AccountsState>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? account = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AccountsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountsStateCopyWith<$Res>
    implements $AccountsStateCopyWith<$Res> {
  factory _$$_AccountsStateCopyWith(
          _$_AccountsState value, $Res Function(_$_AccountsState) then) =
      __$$_AccountsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<AccountsModel> account,
      String? errorMessage});
}

/// @nodoc
class __$$_AccountsStateCopyWithImpl<$Res>
    extends _$AccountsStateCopyWithImpl<$Res, _$_AccountsState>
    implements _$$_AccountsStateCopyWith<$Res> {
  __$$_AccountsStateCopyWithImpl(
      _$_AccountsState _value, $Res Function(_$_AccountsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? account = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AccountsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AccountsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AccountsState implements _AccountsState {
  const _$_AccountsState(
      {this.isFetching = false,
      this.account = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<AccountsModel> account;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AccountsState(isFetching: $isFetching, account: $account, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, account, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountsStateCopyWith<_$_AccountsState> get copyWith =>
      __$$_AccountsStateCopyWithImpl<_$_AccountsState>(this, _$identity);
}

abstract class _AccountsState implements AccountsState {
  const factory _AccountsState(
      {final bool isFetching,
      final AsyncValue<AccountsModel> account,
      final String? errorMessage}) = _$_AccountsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<AccountsModel> get account;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AccountsStateCopyWith<_$_AccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}
