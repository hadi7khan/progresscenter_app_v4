// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_progressline_posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllProgressLinePostsState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<ProgressLineModel>> get allProgresslinePosts =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllProgressLinePostsStateCopyWith<AllProgressLinePostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllProgressLinePostsStateCopyWith<$Res> {
  factory $AllProgressLinePostsStateCopyWith(AllProgressLinePostsState value,
          $Res Function(AllProgressLinePostsState) then) =
      _$AllProgressLinePostsStateCopyWithImpl<$Res, AllProgressLinePostsState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProgressLineModel>> allProgresslinePosts,
      String? errorMessage});
}

/// @nodoc
class _$AllProgressLinePostsStateCopyWithImpl<$Res,
        $Val extends AllProgressLinePostsState>
    implements $AllProgressLinePostsStateCopyWith<$Res> {
  _$AllProgressLinePostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? allProgresslinePosts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      allProgresslinePosts: null == allProgresslinePosts
          ? _value.allProgresslinePosts
          : allProgresslinePosts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProgressLineModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllProgressLinePostsStateCopyWith<$Res>
    implements $AllProgressLinePostsStateCopyWith<$Res> {
  factory _$$_AllProgressLinePostsStateCopyWith(
          _$_AllProgressLinePostsState value,
          $Res Function(_$_AllProgressLinePostsState) then) =
      __$$_AllProgressLinePostsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProgressLineModel>> allProgresslinePosts,
      String? errorMessage});
}

/// @nodoc
class __$$_AllProgressLinePostsStateCopyWithImpl<$Res>
    extends _$AllProgressLinePostsStateCopyWithImpl<$Res,
        _$_AllProgressLinePostsState>
    implements _$$_AllProgressLinePostsStateCopyWith<$Res> {
  __$$_AllProgressLinePostsStateCopyWithImpl(
      _$_AllProgressLinePostsState _value,
      $Res Function(_$_AllProgressLinePostsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? allProgresslinePosts = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AllProgressLinePostsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      allProgresslinePosts: null == allProgresslinePosts
          ? _value.allProgresslinePosts
          : allProgresslinePosts // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProgressLineModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AllProgressLinePostsState implements _AllProgressLinePostsState {
  const _$_AllProgressLinePostsState(
      {this.isFetching = false,
      this.allProgresslinePosts = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<ProgressLineModel>> allProgresslinePosts;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AllProgressLinePostsState(isFetching: $isFetching, allProgresslinePosts: $allProgresslinePosts, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllProgressLinePostsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.allProgresslinePosts, allProgresslinePosts) ||
                other.allProgresslinePosts == allProgresslinePosts) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, allProgresslinePosts, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllProgressLinePostsStateCopyWith<_$_AllProgressLinePostsState>
      get copyWith => __$$_AllProgressLinePostsStateCopyWithImpl<
          _$_AllProgressLinePostsState>(this, _$identity);
}

abstract class _AllProgressLinePostsState implements AllProgressLinePostsState {
  const factory _AllProgressLinePostsState(
      {final bool isFetching,
      final AsyncValue<List<ProgressLineModel>> allProgresslinePosts,
      final String? errorMessage}) = _$_AllProgressLinePostsState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<ProgressLineModel>> get allProgresslinePosts;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AllProgressLinePostsStateCopyWith<_$_AllProgressLinePostsState>
      get copyWith => throw _privateConstructorUsedError;
}
