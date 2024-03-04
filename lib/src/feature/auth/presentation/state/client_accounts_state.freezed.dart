// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClientAccountsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<ClientAccountsModel>> get clientAccounts =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClientAccountsStateCopyWith<ClientAccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientAccountsStateCopyWith<$Res> {
  factory $ClientAccountsStateCopyWith(
          ClientAccountsState value, $Res Function(ClientAccountsState) then) =
      _$ClientAccountsStateCopyWithImpl<$Res, ClientAccountsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ClientAccountsModel>> clientAccounts,
      String? errorMessage});
}

/// @nodoc
class _$ClientAccountsStateCopyWithImpl<$Res, $Val extends ClientAccountsState>
    implements $ClientAccountsStateCopyWith<$Res> {
  _$ClientAccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? clientAccounts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      clientAccounts: null == clientAccounts
          ? _value.clientAccounts
          : clientAccounts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ClientAccountsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientAccountsStateCopyWith<$Res>
    implements $ClientAccountsStateCopyWith<$Res> {
  factory _$$_ClientAccountsStateCopyWith(_$_ClientAccountsState value,
          $Res Function(_$_ClientAccountsState) then) =
      __$$_ClientAccountsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ClientAccountsModel>> clientAccounts,
      String? errorMessage});
}

/// @nodoc
class __$$_ClientAccountsStateCopyWithImpl<$Res>
    extends _$ClientAccountsStateCopyWithImpl<$Res, _$_ClientAccountsState>
    implements _$$_ClientAccountsStateCopyWith<$Res> {
  __$$_ClientAccountsStateCopyWithImpl(_$_ClientAccountsState _value,
      $Res Function(_$_ClientAccountsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? clientAccounts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ClientAccountsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      clientAccounts: null == clientAccounts
          ? _value.clientAccounts
          : clientAccounts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ClientAccountsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ClientAccountsState implements _ClientAccountsState {
  const _$_ClientAccountsState(
      {this.isFetching = false,
      this.clientAccounts = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<ClientAccountsModel>> clientAccounts;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ClientAccountsState(isFetching: $isFetching, clientAccounts: $clientAccounts, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientAccountsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.clientAccounts, clientAccounts) ||
                other.clientAccounts == clientAccounts) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, clientAccounts, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientAccountsStateCopyWith<_$_ClientAccountsState> get copyWith =>
      __$$_ClientAccountsStateCopyWithImpl<_$_ClientAccountsState>(
          this, _$identity);
}

abstract class _ClientAccountsState implements ClientAccountsState {
  const factory _ClientAccountsState(
      {final bool isFetching,
      final AsyncValue<List<ClientAccountsModel>> clientAccounts,
      final String? errorMessage}) = _$_ClientAccountsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<ClientAccountsModel>> get clientAccounts;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ClientAccountsStateCopyWith<_$_ClientAccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}
