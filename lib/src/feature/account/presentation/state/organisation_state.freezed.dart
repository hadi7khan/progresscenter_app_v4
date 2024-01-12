// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organisation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrganisationState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<OrganisationModel> get organisation =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrganisationStateCopyWith<OrganisationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationStateCopyWith<$Res> {
  factory $OrganisationStateCopyWith(
          OrganisationState value, $Res Function(OrganisationState) then) =
      _$OrganisationStateCopyWithImpl<$Res, OrganisationState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<OrganisationModel> organisation,
      String? errorMessage});
}

/// @nodoc
class _$OrganisationStateCopyWithImpl<$Res, $Val extends OrganisationState>
    implements $OrganisationStateCopyWith<$Res> {
  _$OrganisationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? organisation = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      organisation: null == organisation
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as AsyncValue<OrganisationModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrganisationStateCopyWith<$Res>
    implements $OrganisationStateCopyWith<$Res> {
  factory _$$_OrganisationStateCopyWith(_$_OrganisationState value,
          $Res Function(_$_OrganisationState) then) =
      __$$_OrganisationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<OrganisationModel> organisation,
      String? errorMessage});
}

/// @nodoc
class __$$_OrganisationStateCopyWithImpl<$Res>
    extends _$OrganisationStateCopyWithImpl<$Res, _$_OrganisationState>
    implements _$$_OrganisationStateCopyWith<$Res> {
  __$$_OrganisationStateCopyWithImpl(
      _$_OrganisationState _value, $Res Function(_$_OrganisationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? organisation = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_OrganisationState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      organisation: null == organisation
          ? _value.organisation
          : organisation // ignore: cast_nullable_to_non_nullable
              as AsyncValue<OrganisationModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_OrganisationState implements _OrganisationState {
  const _$_OrganisationState(
      {this.isFetching = false,
      this.organisation = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<OrganisationModel> organisation;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OrganisationState(isFetching: $isFetching, organisation: $organisation, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganisationState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.organisation, organisation) ||
                other.organisation == organisation) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, organisation, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganisationStateCopyWith<_$_OrganisationState> get copyWith =>
      __$$_OrganisationStateCopyWithImpl<_$_OrganisationState>(
          this, _$identity);
}

abstract class _OrganisationState implements OrganisationState {
  const factory _OrganisationState(
      {final bool isFetching,
      final AsyncValue<OrganisationModel> organisation,
      final String? errorMessage}) = _$_OrganisationState;

  @override
  bool get isFetching;
  @override
  AsyncValue<OrganisationModel> get organisation;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_OrganisationStateCopyWith<_$_OrganisationState> get copyWith =>
      throw _privateConstructorUsedError;
}
