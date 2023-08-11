// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<CommentsModel>> get comments =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res, CommentsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<CommentsModel>> comments,
      String? errorMessage});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res, $Val extends CommentsState>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? comments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CommentsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentsStateCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$_CommentsStateCopyWith(
          _$_CommentsState value, $Res Function(_$_CommentsState) then) =
      __$$_CommentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<CommentsModel>> comments,
      String? errorMessage});
}

/// @nodoc
class __$$_CommentsStateCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res, _$_CommentsState>
    implements _$$_CommentsStateCopyWith<$Res> {
  __$$_CommentsStateCopyWithImpl(
      _$_CommentsState _value, $Res Function(_$_CommentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? comments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CommentsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<CommentsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CommentsState implements _CommentsState {
  const _$_CommentsState(
      {this.isFetching = false,
      this.comments = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<CommentsModel>> comments;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CommentsState(isFetching: $isFetching, comments: $comments, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, comments, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      __$$_CommentsStateCopyWithImpl<_$_CommentsState>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {final bool isFetching,
      final AsyncValue<List<CommentsModel>> comments,
      final String? errorMessage}) = _$_CommentsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<CommentsModel>> get comments;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
