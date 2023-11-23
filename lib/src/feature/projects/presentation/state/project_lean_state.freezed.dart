// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_lean_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectLeanState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<ProjectLeanModel>> get projectlean =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectLeanStateCopyWith<ProjectLeanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectLeanStateCopyWith<$Res> {
  factory $ProjectLeanStateCopyWith(
          ProjectLeanState value, $Res Function(ProjectLeanState) then) =
      _$ProjectLeanStateCopyWithImpl<$Res, ProjectLeanState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProjectLeanModel>> projectlean,
      String? errorMessage});
}

/// @nodoc
class _$ProjectLeanStateCopyWithImpl<$Res, $Val extends ProjectLeanState>
    implements $ProjectLeanStateCopyWith<$Res> {
  _$ProjectLeanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? projectlean = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      projectlean: null == projectlean
          ? _value.projectlean
          : projectlean // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProjectLeanModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectLeanStateCopyWith<$Res>
    implements $ProjectLeanStateCopyWith<$Res> {
  factory _$$_ProjectLeanStateCopyWith(
          _$_ProjectLeanState value, $Res Function(_$_ProjectLeanState) then) =
      __$$_ProjectLeanStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<ProjectLeanModel>> projectlean,
      String? errorMessage});
}

/// @nodoc
class __$$_ProjectLeanStateCopyWithImpl<$Res>
    extends _$ProjectLeanStateCopyWithImpl<$Res, _$_ProjectLeanState>
    implements _$$_ProjectLeanStateCopyWith<$Res> {
  __$$_ProjectLeanStateCopyWithImpl(
      _$_ProjectLeanState _value, $Res Function(_$_ProjectLeanState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? projectlean = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ProjectLeanState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      projectlean: null == projectlean
          ? _value.projectlean
          : projectlean // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ProjectLeanModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProjectLeanState implements _ProjectLeanState {
  const _$_ProjectLeanState(
      {this.isFetching = false,
      this.projectlean = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<ProjectLeanModel>> projectlean;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProjectLeanState(isFetching: $isFetching, projectlean: $projectlean, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectLeanState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.projectlean, projectlean) ||
                other.projectlean == projectlean) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, projectlean, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectLeanStateCopyWith<_$_ProjectLeanState> get copyWith =>
      __$$_ProjectLeanStateCopyWithImpl<_$_ProjectLeanState>(this, _$identity);
}

abstract class _ProjectLeanState implements ProjectLeanState {
  const factory _ProjectLeanState(
      {final bool isFetching,
      final AsyncValue<List<ProjectLeanModel>> projectlean,
      final String? errorMessage}) = _$_ProjectLeanState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<ProjectLeanModel>> get projectlean;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectLeanStateCopyWith<_$_ProjectLeanState> get copyWith =>
      throw _privateConstructorUsedError;
}
