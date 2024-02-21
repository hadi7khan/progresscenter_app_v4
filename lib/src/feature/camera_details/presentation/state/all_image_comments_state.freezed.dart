// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_image_comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllImageCommentsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<AllImageCommentsModel> get allImageComments =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllImageCommentsStateCopyWith<AllImageCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllImageCommentsStateCopyWith<$Res> {
  factory $AllImageCommentsStateCopyWith(AllImageCommentsState value,
          $Res Function(AllImageCommentsState) then) =
      _$AllImageCommentsStateCopyWithImpl<$Res, AllImageCommentsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<AllImageCommentsModel> allImageComments,
      String? errorMessage});
}

/// @nodoc
class _$AllImageCommentsStateCopyWithImpl<$Res,
        $Val extends AllImageCommentsState>
    implements $AllImageCommentsStateCopyWith<$Res> {
  _$AllImageCommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? allImageComments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      allImageComments: null == allImageComments
          ? _value.allImageComments
          : allImageComments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AllImageCommentsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllImageCommentsStateCopyWith<$Res>
    implements $AllImageCommentsStateCopyWith<$Res> {
  factory _$$_AllImageCommentsStateCopyWith(_$_AllImageCommentsState value,
          $Res Function(_$_AllImageCommentsState) then) =
      __$$_AllImageCommentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<AllImageCommentsModel> allImageComments,
      String? errorMessage});
}

/// @nodoc
class __$$_AllImageCommentsStateCopyWithImpl<$Res>
    extends _$AllImageCommentsStateCopyWithImpl<$Res, _$_AllImageCommentsState>
    implements _$$_AllImageCommentsStateCopyWith<$Res> {
  __$$_AllImageCommentsStateCopyWithImpl(_$_AllImageCommentsState _value,
      $Res Function(_$_AllImageCommentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? allImageComments = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AllImageCommentsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      allImageComments: null == allImageComments
          ? _value.allImageComments
          : allImageComments // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AllImageCommentsModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AllImageCommentsState implements _AllImageCommentsState {
  const _$_AllImageCommentsState(
      {this.isFetching = false,
      this.allImageComments = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<AllImageCommentsModel> allImageComments;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AllImageCommentsState(isFetching: $isFetching, allImageComments: $allImageComments, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllImageCommentsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.allImageComments, allImageComments) ||
                other.allImageComments == allImageComments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, allImageComments, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllImageCommentsStateCopyWith<_$_AllImageCommentsState> get copyWith =>
      __$$_AllImageCommentsStateCopyWithImpl<_$_AllImageCommentsState>(
          this, _$identity);
}

abstract class _AllImageCommentsState implements AllImageCommentsState {
  const factory _AllImageCommentsState(
      {final bool isFetching,
      final AsyncValue<AllImageCommentsModel> allImageComments,
      final String? errorMessage}) = _$_AllImageCommentsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<AllImageCommentsModel> get allImageComments;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AllImageCommentsStateCopyWith<_$_AllImageCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
