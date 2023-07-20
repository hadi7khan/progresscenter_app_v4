// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_by_cam_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImagesByCamIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<ImagesByCameraIdModel> get imagesByCamId =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImagesByCamIdStateCopyWith<ImagesByCamIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesByCamIdStateCopyWith<$Res> {
  factory $ImagesByCamIdStateCopyWith(
          ImagesByCamIdState value, $Res Function(ImagesByCamIdState) then) =
      _$ImagesByCamIdStateCopyWithImpl<$Res, ImagesByCamIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ImagesByCameraIdModel> imagesByCamId,
      String? errorMessage});
}

/// @nodoc
class _$ImagesByCamIdStateCopyWithImpl<$Res, $Val extends ImagesByCamIdState>
    implements $ImagesByCamIdStateCopyWith<$Res> {
  _$ImagesByCamIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? imagesByCamId = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      imagesByCamId: null == imagesByCamId
          ? _value.imagesByCamId
          : imagesByCamId // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ImagesByCameraIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagesByCamIdStateCopyWith<$Res>
    implements $ImagesByCamIdStateCopyWith<$Res> {
  factory _$$_ImagesByCamIdStateCopyWith(_$_ImagesByCamIdState value,
          $Res Function(_$_ImagesByCamIdState) then) =
      __$$_ImagesByCamIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ImagesByCameraIdModel> imagesByCamId,
      String? errorMessage});
}

/// @nodoc
class __$$_ImagesByCamIdStateCopyWithImpl<$Res>
    extends _$ImagesByCamIdStateCopyWithImpl<$Res, _$_ImagesByCamIdState>
    implements _$$_ImagesByCamIdStateCopyWith<$Res> {
  __$$_ImagesByCamIdStateCopyWithImpl(
      _$_ImagesByCamIdState _value, $Res Function(_$_ImagesByCamIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? imagesByCamId = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ImagesByCamIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      imagesByCamId: null == imagesByCamId
          ? _value.imagesByCamId
          : imagesByCamId // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ImagesByCameraIdModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ImagesByCamIdState implements _ImagesByCamIdState {
  const _$_ImagesByCamIdState(
      {this.isFetching = false,
      this.imagesByCamId = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<ImagesByCameraIdModel> imagesByCamId;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ImagesByCamIdState(isFetching: $isFetching, imagesByCamId: $imagesByCamId, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesByCamIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.imagesByCamId, imagesByCamId) ||
                other.imagesByCamId == imagesByCamId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, imagesByCamId, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesByCamIdStateCopyWith<_$_ImagesByCamIdState> get copyWith =>
      __$$_ImagesByCamIdStateCopyWithImpl<_$_ImagesByCamIdState>(
          this, _$identity);
}

abstract class _ImagesByCamIdState implements ImagesByCamIdState {
  const factory _ImagesByCamIdState(
      {final bool isFetching,
      final AsyncValue<ImagesByCameraIdModel> imagesByCamId,
      final String? errorMessage}) = _$_ImagesByCamIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<ImagesByCameraIdModel> get imagesByCamId;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesByCamIdStateCopyWith<_$_ImagesByCamIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
