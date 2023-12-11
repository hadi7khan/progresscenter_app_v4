// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_ticket_reply_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostTicketReplyState {
  bool get isLoading => throw _privateConstructorUsedError;
  AsyncValue<dynamic> get result => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostTicketReplyStateCopyWith<PostTicketReplyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostTicketReplyStateCopyWith<$Res> {
  factory $PostTicketReplyStateCopyWith(PostTicketReplyState value,
          $Res Function(PostTicketReplyState) then) =
      _$PostTicketReplyStateCopyWithImpl<$Res, PostTicketReplyState>;
  @useResult
  $Res call({bool isLoading, AsyncValue<dynamic> result, String? errorMessage});
}

/// @nodoc
class _$PostTicketReplyStateCopyWithImpl<$Res,
        $Val extends PostTicketReplyState>
    implements $PostTicketReplyStateCopyWith<$Res> {
  _$PostTicketReplyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostTicketReplyStateCopyWith<$Res>
    implements $PostTicketReplyStateCopyWith<$Res> {
  factory _$$_PostTicketReplyStateCopyWith(_$_PostTicketReplyState value,
          $Res Function(_$_PostTicketReplyState) then) =
      __$$_PostTicketReplyStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, AsyncValue<dynamic> result, String? errorMessage});
}

/// @nodoc
class __$$_PostTicketReplyStateCopyWithImpl<$Res>
    extends _$PostTicketReplyStateCopyWithImpl<$Res, _$_PostTicketReplyState>
    implements _$$_PostTicketReplyStateCopyWith<$Res> {
  __$$_PostTicketReplyStateCopyWithImpl(_$_PostTicketReplyState _value,
      $Res Function(_$_PostTicketReplyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_PostTicketReplyState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AsyncValue<dynamic>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PostTicketReplyState implements _PostTicketReplyState {
  const _$_PostTicketReplyState(
      {this.isLoading = false,
      this.result = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final AsyncValue<dynamic> result;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PostTicketReplyState(isLoading: $isLoading, result: $result, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostTicketReplyState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, result, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostTicketReplyStateCopyWith<_$_PostTicketReplyState> get copyWith =>
      __$$_PostTicketReplyStateCopyWithImpl<_$_PostTicketReplyState>(
          this, _$identity);
}

abstract class _PostTicketReplyState implements PostTicketReplyState {
  const factory _PostTicketReplyState(
      {final bool isLoading,
      final AsyncValue<dynamic> result,
      final String? errorMessage}) = _$_PostTicketReplyState;

  @override
  bool get isLoading;
  @override
  AsyncValue<dynamic> get result;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_PostTicketReplyStateCopyWith<_$_PostTicketReplyState> get copyWith =>
      throw _privateConstructorUsedError;
}
