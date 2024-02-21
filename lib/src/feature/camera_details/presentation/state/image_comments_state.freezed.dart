// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageCommentsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<ImageCommentsModel> get imageComments =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageCommentsStateCopyWith<ImageCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCommentsStateCopyWith<$Res> {
  factory $ImageCommentsStateCopyWith(
          ImageCommentsState value, $Res Function(ImageCommentsState) then) =
      _$ImageCommentsStateCopyWithImpl<$Res, ImageCommentsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ImageCommentsModel> imageComments,
      String? errorMessage});
}

/// @nodoc
class _$ImageCommentsStateCopyWithImpl<$Res, $Val extends ImageCommentsState>
    implements $ImageCommentsStateCopyWith<$Res> {
  _$ImageCommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? imageComments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      imageComments: null == imageComments
          ? _value.imageComments
          : imageComments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ImageCommentsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageCommentsStateCopyWith<$Res>
    implements $ImageCommentsStateCopyWith<$Res> {
  factory _$$_ImageCommentsStateCopyWith(_$_ImageCommentsState value,
          $Res Function(_$_ImageCommentsState) then) =
      __$$_ImageCommentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ImageCommentsModel> imageComments,
      String? errorMessage});
}

/// @nodoc
class __$$_ImageCommentsStateCopyWithImpl<$Res>
    extends _$ImageCommentsStateCopyWithImpl<$Res, _$_ImageCommentsState>
    implements _$$_ImageCommentsStateCopyWith<$Res> {
  __$$_ImageCommentsStateCopyWithImpl(
      _$_ImageCommentsState _value, $Res Function(_$_ImageCommentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? imageComments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ImageCommentsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      imageComments: null == imageComments
          ? _value.imageComments
          : imageComments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ImageCommentsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ImageCommentsState implements _ImageCommentsState {
  const _$_ImageCommentsState(
      {this.isFetching = false,
      this.imageComments = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<ImageCommentsModel> imageComments;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ImageCommentsState(isFetching: $isFetching, imageComments: $imageComments, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageCommentsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.imageComments, imageComments) ||
                other.imageComments == imageComments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, imageComments, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCommentsStateCopyWith<_$_ImageCommentsState> get copyWith =>
      __$$_ImageCommentsStateCopyWithImpl<_$_ImageCommentsState>(
          this, _$identity);
}

abstract class _ImageCommentsState implements ImageCommentsState {
  const factory _ImageCommentsState(
      {final bool isFetching,
      final AsyncValue<ImageCommentsModel> imageComments,
      final String? errorMessage}) = _$_ImageCommentsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<ImageCommentsModel> get imageComments;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCommentsStateCopyWith<_$_ImageCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
