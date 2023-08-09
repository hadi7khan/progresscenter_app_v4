// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progressline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgressLineState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<ProgressLineModel>> get progressline =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressLineStateCopyWith<ProgressLineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressLineStateCopyWith<$Res> {
  factory $ProgressLineStateCopyWith(
          ProgressLineState value, $Res Function(ProgressLineState) then) =
      _$ProgressLineStateCopyWithImpl<$Res, ProgressLineState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProgressLineModel>> progressline,
      String? errorMessage});
}

/// @nodoc
class _$ProgressLineStateCopyWithImpl<$Res, $Val extends ProgressLineState>
    implements $ProgressLineStateCopyWith<$Res> {
  _$ProgressLineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? progressline = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      progressline: null == progressline
          ? _value.progressline
          : progressline // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProgressLineModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgressLineStateCopyWith<$Res>
    implements $ProgressLineStateCopyWith<$Res> {
  factory _$$_ProgressLineStateCopyWith(_$_ProgressLineState value,
          $Res Function(_$_ProgressLineState) then) =
      __$$_ProgressLineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProgressLineModel>> progressline,
      String? errorMessage});
}

/// @nodoc
class __$$_ProgressLineStateCopyWithImpl<$Res>
    extends _$ProgressLineStateCopyWithImpl<$Res, _$_ProgressLineState>
    implements _$$_ProgressLineStateCopyWith<$Res> {
  __$$_ProgressLineStateCopyWithImpl(
      _$_ProgressLineState _value, $Res Function(_$_ProgressLineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? progressline = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ProgressLineState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      progressline: null == progressline
          ? _value.progressline
          : progressline // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProgressLineModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProgressLineState implements _ProgressLineState {
  const _$_ProgressLineState(
      {this.isFetching = false,
      this.progressline = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<ProgressLineModel>> progressline;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProgressLineState(isFetching: $isFetching, progressline: $progressline, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgressLineState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.progressline, progressline) ||
                other.progressline == progressline) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, progressline, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgressLineStateCopyWith<_$_ProgressLineState> get copyWith =>
      __$$_ProgressLineStateCopyWithImpl<_$_ProgressLineState>(
          this, _$identity);
}

abstract class _ProgressLineState implements ProgressLineState {
  const factory _ProgressLineState(
      {final bool isFetching,
      final AsyncValue<List<ProgressLineModel>> progressline,
      final String? errorMessage}) = _$_ProgressLineState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<ProgressLineModel>> get progressline;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProgressLineStateCopyWith<_$_ProgressLineState> get copyWith =>
      throw _privateConstructorUsedError;
}
