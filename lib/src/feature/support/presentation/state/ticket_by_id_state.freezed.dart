// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketByIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<TicketByIdModel> get ticketById =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketByIdStateCopyWith<TicketByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketByIdStateCopyWith<$Res> {
  factory $TicketByIdStateCopyWith(
          TicketByIdState value, $Res Function(TicketByIdState) then) =
      _$TicketByIdStateCopyWithImpl<$Res, TicketByIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<TicketByIdModel> ticketById,
      String? errorMessage});
}

/// @nodoc
class _$TicketByIdStateCopyWithImpl<$Res, $Val extends TicketByIdState>
    implements $TicketByIdStateCopyWith<$Res> {
  _$TicketByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? ticketById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketById: null == ticketById
          ? _value.ticketById
          : ticketById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TicketByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketByIdStateCopyWith<$Res>
    implements $TicketByIdStateCopyWith<$Res> {
  factory _$$_TicketByIdStateCopyWith(
          _$_TicketByIdState value, $Res Function(_$_TicketByIdState) then) =
      __$$_TicketByIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<TicketByIdModel> ticketById,
      String? errorMessage});
}

/// @nodoc
class __$$_TicketByIdStateCopyWithImpl<$Res>
    extends _$TicketByIdStateCopyWithImpl<$Res, _$_TicketByIdState>
    implements _$$_TicketByIdStateCopyWith<$Res> {
  __$$_TicketByIdStateCopyWithImpl(
      _$_TicketByIdState _value, $Res Function(_$_TicketByIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? ticketById = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_TicketByIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketById: null == ticketById
          ? _value.ticketById
          : ticketById // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TicketByIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TicketByIdState implements _TicketByIdState {
  const _$_TicketByIdState(
      {this.isFetching = false,
      this.ticketById = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<TicketByIdModel> ticketById;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TicketByIdState(isFetching: $isFetching, ticketById: $ticketById, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketByIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.ticketById, ticketById) ||
                other.ticketById == ticketById) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, ticketById, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketByIdStateCopyWith<_$_TicketByIdState> get copyWith =>
      __$$_TicketByIdStateCopyWithImpl<_$_TicketByIdState>(this, _$identity);
}

abstract class _TicketByIdState implements TicketByIdState {
  const factory _TicketByIdState(
      {final bool isFetching,
      final AsyncValue<TicketByIdModel> ticketById,
      final String? errorMessage}) = _$_TicketByIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<TicketByIdModel> get ticketById;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TicketByIdStateCopyWith<_$_TicketByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
