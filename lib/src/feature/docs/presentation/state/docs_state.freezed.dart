// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DocsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<DocsModel>> get docs => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocsStateCopyWith<DocsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsStateCopyWith<$Res> {
  factory $DocsStateCopyWith(DocsState value, $Res Function(DocsState) then) =
      _$DocsStateCopyWithImpl<$Res, DocsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<DocsModel>> docs,
      String? errorMessage});
}

/// @nodoc
class _$DocsStateCopyWithImpl<$Res, $Val extends DocsState>
    implements $DocsStateCopyWith<$Res> {
  _$DocsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? docs = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<DocsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocsStateCopyWith<$Res> implements $DocsStateCopyWith<$Res> {
  factory _$$_DocsStateCopyWith(
          _$_DocsState value, $Res Function(_$_DocsState) then) =
      __$$_DocsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<DocsModel>> docs,
      String? errorMessage});
}

/// @nodoc
class __$$_DocsStateCopyWithImpl<$Res>
    extends _$DocsStateCopyWithImpl<$Res, _$_DocsState>
    implements _$$_DocsStateCopyWith<$Res> {
  __$$_DocsStateCopyWithImpl(
      _$_DocsState _value, $Res Function(_$_DocsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? docs = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_DocsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      docs: null == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<DocsModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DocsState implements _DocsState {
  const _$_DocsState(
      {this.isFetching = false,
      this.docs = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<DocsModel>> docs;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DocsState(isFetching: $isFetching, docs: $docs, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.docs, docs) || other.docs == docs) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching, docs, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocsStateCopyWith<_$_DocsState> get copyWith =>
      __$$_DocsStateCopyWithImpl<_$_DocsState>(this, _$identity);
}

abstract class _DocsState implements DocsState {
  const factory _DocsState(
      {final bool isFetching,
      final AsyncValue<List<DocsModel>> docs,
      final String? errorMessage}) = _$_DocsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<DocsModel>> get docs;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_DocsStateCopyWith<_$_DocsState> get copyWith =>
      throw _privateConstructorUsedError;
}
