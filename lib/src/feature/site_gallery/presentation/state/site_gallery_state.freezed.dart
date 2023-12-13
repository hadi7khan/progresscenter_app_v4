// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SiteGalleryState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<SiteGalleryModel>> get siteGallery =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SiteGalleryStateCopyWith<SiteGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteGalleryStateCopyWith<$Res> {
  factory $SiteGalleryStateCopyWith(
          SiteGalleryState value, $Res Function(SiteGalleryState) then) =
      _$SiteGalleryStateCopyWithImpl<$Res, SiteGalleryState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<SiteGalleryModel>> siteGallery,
      String? errorMessage});
}

/// @nodoc
class _$SiteGalleryStateCopyWithImpl<$Res, $Val extends SiteGalleryState>
    implements $SiteGalleryStateCopyWith<$Res> {
  _$SiteGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? siteGallery = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      siteGallery: null == siteGallery
          ? _value.siteGallery
          : siteGallery // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SiteGalleryModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteGalleryStateCopyWith<$Res>
    implements $SiteGalleryStateCopyWith<$Res> {
  factory _$$_SiteGalleryStateCopyWith(
          _$_SiteGalleryState value, $Res Function(_$_SiteGalleryState) then) =
      __$$_SiteGalleryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<SiteGalleryModel>> siteGallery,
      String? errorMessage});
}

/// @nodoc
class __$$_SiteGalleryStateCopyWithImpl<$Res>
    extends _$SiteGalleryStateCopyWithImpl<$Res, _$_SiteGalleryState>
    implements _$$_SiteGalleryStateCopyWith<$Res> {
  __$$_SiteGalleryStateCopyWithImpl(
      _$_SiteGalleryState _value, $Res Function(_$_SiteGalleryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? siteGallery = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SiteGalleryState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      siteGallery: null == siteGallery
          ? _value.siteGallery
          : siteGallery // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<SiteGalleryModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SiteGalleryState implements _SiteGalleryState {
  const _$_SiteGalleryState(
      {this.isFetching = false,
      this.siteGallery = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<SiteGalleryModel>> siteGallery;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SiteGalleryState(isFetching: $isFetching, siteGallery: $siteGallery, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteGalleryState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.siteGallery, siteGallery) ||
                other.siteGallery == siteGallery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, siteGallery, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteGalleryStateCopyWith<_$_SiteGalleryState> get copyWith =>
      __$$_SiteGalleryStateCopyWithImpl<_$_SiteGalleryState>(this, _$identity);
}

abstract class _SiteGalleryState implements SiteGalleryState {
  const factory _SiteGalleryState(
      {final bool isFetching,
      final AsyncValue<List<SiteGalleryModel>> siteGallery,
      final String? errorMessage}) = _$_SiteGalleryState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<SiteGalleryModel>> get siteGallery;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SiteGalleryStateCopyWith<_$_SiteGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}
