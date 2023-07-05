// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectByIdState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<ProjectModel> get projectDetails =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectByIdStateCopyWith<ProjectByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectByIdStateCopyWith<$Res> {
  factory $ProjectByIdStateCopyWith(
          ProjectByIdState value, $Res Function(ProjectByIdState) then) =
      _$ProjectByIdStateCopyWithImpl<$Res, ProjectByIdState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ProjectModel> projectDetails,
      String? errorMessage});
}

/// @nodoc
class _$ProjectByIdStateCopyWithImpl<$Res, $Val extends ProjectByIdState>
    implements $ProjectByIdStateCopyWith<$Res> {
  _$ProjectByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? projectDetails = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      projectDetails: null == projectDetails
          ? _value.projectDetails
          : projectDetails // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ProjectModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectByIdStateCopyWith<$Res>
    implements $ProjectByIdStateCopyWith<$Res> {
  factory _$$_ProjectByIdStateCopyWith(
          _$_ProjectByIdState value, $Res Function(_$_ProjectByIdState) then) =
      __$$_ProjectByIdStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ProjectModel> projectDetails,
      String? errorMessage});
}

/// @nodoc
class __$$_ProjectByIdStateCopyWithImpl<$Res>
    extends _$ProjectByIdStateCopyWithImpl<$Res, _$_ProjectByIdState>
    implements _$$_ProjectByIdStateCopyWith<$Res> {
  __$$_ProjectByIdStateCopyWithImpl(
      _$_ProjectByIdState _value, $Res Function(_$_ProjectByIdState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? projectDetails = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ProjectByIdState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      projectDetails: null == projectDetails
          ? _value.projectDetails
          : projectDetails // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ProjectModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProjectByIdState implements _ProjectByIdState {
  const _$_ProjectByIdState(
      {this.isFetching = false,
      this.projectDetails = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<ProjectModel> projectDetails;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProjectByIdState(isFetching: $isFetching, projectDetails: $projectDetails, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectByIdState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.projectDetails, projectDetails) ||
                other.projectDetails == projectDetails) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, projectDetails, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectByIdStateCopyWith<_$_ProjectByIdState> get copyWith =>
      __$$_ProjectByIdStateCopyWithImpl<_$_ProjectByIdState>(this, _$identity);
}

abstract class _ProjectByIdState implements ProjectByIdState {
  const factory _ProjectByIdState(
      {final bool isFetching,
      final AsyncValue<ProjectModel> projectDetails,
      final String? errorMessage}) = _$_ProjectByIdState;

  @override
  bool get isFetching;
  @override
  AsyncValue<ProjectModel> get projectDetails;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectByIdStateCopyWith<_$_ProjectByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}
