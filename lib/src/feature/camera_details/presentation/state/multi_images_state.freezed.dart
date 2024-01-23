// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multi_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultiImagesState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<MultiImagesModel>> get multiImages =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultiImagesStateCopyWith<MultiImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiImagesStateCopyWith<$Res> {
  factory $MultiImagesStateCopyWith(
          MultiImagesState value, $Res Function(MultiImagesState) then) =
      _$MultiImagesStateCopyWithImpl<$Res, MultiImagesState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<MultiImagesModel>> multiImages,
      String? errorMessage});
}

/// @nodoc
class _$MultiImagesStateCopyWithImpl<$Res, $Val extends MultiImagesState>
    implements $MultiImagesStateCopyWith<$Res> {
  _$MultiImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? multiImages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      multiImages: null == multiImages
          ? _value.multiImages
          : multiImages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MultiImagesModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MultiImagesStateCopyWith<$Res>
    implements $MultiImagesStateCopyWith<$Res> {
  factory _$$_MultiImagesStateCopyWith(
          _$_MultiImagesState value, $Res Function(_$_MultiImagesState) then) =
      __$$_MultiImagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<MultiImagesModel>> multiImages,
      String? errorMessage});
}

/// @nodoc
class __$$_MultiImagesStateCopyWithImpl<$Res>
    extends _$MultiImagesStateCopyWithImpl<$Res, _$_MultiImagesState>
    implements _$$_MultiImagesStateCopyWith<$Res> {
  __$$_MultiImagesStateCopyWithImpl(
      _$_MultiImagesState _value, $Res Function(_$_MultiImagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? multiImages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_MultiImagesState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      multiImages: null == multiImages
          ? _value.multiImages
          : multiImages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MultiImagesModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MultiImagesState implements _MultiImagesState {
  const _$_MultiImagesState(
      {this.isFetching = false,
      this.multiImages = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<MultiImagesModel>> multiImages;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MultiImagesState(isFetching: $isFetching, multiImages: $multiImages, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultiImagesState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.multiImages, multiImages) ||
                other.multiImages == multiImages) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, multiImages, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultiImagesStateCopyWith<_$_MultiImagesState> get copyWith =>
      __$$_MultiImagesStateCopyWithImpl<_$_MultiImagesState>(this, _$identity);
}

abstract class _MultiImagesState implements MultiImagesState {
  const factory _MultiImagesState(
      {final bool isFetching,
      final AsyncValue<List<MultiImagesModel>> multiImages,
      final String? errorMessage}) = _$_MultiImagesState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<MultiImagesModel>> get multiImages;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_MultiImagesStateCopyWith<_$_MultiImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
