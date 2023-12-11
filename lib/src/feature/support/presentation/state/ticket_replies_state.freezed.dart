// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_replies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketRepliesState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<TicketRepliesModel>> get replies =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketRepliesStateCopyWith<TicketRepliesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketRepliesStateCopyWith<$Res> {
  factory $TicketRepliesStateCopyWith(
          TicketRepliesState value, $Res Function(TicketRepliesState) then) =
      _$TicketRepliesStateCopyWithImpl<$Res, TicketRepliesState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<TicketRepliesModel>> replies,
      String? errorMessage});
}

/// @nodoc
class _$TicketRepliesStateCopyWithImpl<$Res, $Val extends TicketRepliesState>
    implements $TicketRepliesStateCopyWith<$Res> {
  _$TicketRepliesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? replies = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TicketRepliesModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketRepliesStateCopyWith<$Res>
    implements $TicketRepliesStateCopyWith<$Res> {
  factory _$$_TicketRepliesStateCopyWith(_$_TicketRepliesState value,
          $Res Function(_$_TicketRepliesState) then) =
      __$$_TicketRepliesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<TicketRepliesModel>> replies,
      String? errorMessage});
}

/// @nodoc
class __$$_TicketRepliesStateCopyWithImpl<$Res>
    extends _$TicketRepliesStateCopyWithImpl<$Res, _$_TicketRepliesState>
    implements _$$_TicketRepliesStateCopyWith<$Res> {
  __$$_TicketRepliesStateCopyWithImpl(
      _$_TicketRepliesState _value, $Res Function(_$_TicketRepliesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? replies = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_TicketRepliesState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TicketRepliesModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TicketRepliesState implements _TicketRepliesState {
  const _$_TicketRepliesState(
      {this.isFetching = false,
      this.replies = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<TicketRepliesModel>> replies;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TicketRepliesState(isFetching: $isFetching, replies: $replies, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketRepliesState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, replies, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketRepliesStateCopyWith<_$_TicketRepliesState> get copyWith =>
      __$$_TicketRepliesStateCopyWithImpl<_$_TicketRepliesState>(
          this, _$identity);
}

abstract class _TicketRepliesState implements TicketRepliesState {
  const factory _TicketRepliesState(
      {final bool isFetching,
      final AsyncValue<List<TicketRepliesModel>> replies,
      final String? errorMessage}) = _$_TicketRepliesState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<TicketRepliesModel>> get replies;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TicketRepliesStateCopyWith<_$_TicketRepliesState> get copyWith =>
      throw _privateConstructorUsedError;
}
