// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drone_footage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DroneFootageState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<List<DroneFootageModel>> get droneFootages =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DroneFootageStateCopyWith<DroneFootageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroneFootageStateCopyWith<$Res> {
  factory $DroneFootageStateCopyWith(
          DroneFootageState value, $Res Function(DroneFootageState) then) =
      _$DroneFootageStateCopyWithImpl<$Res, DroneFootageState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<DroneFootageModel>> droneFootages,
      String? errorMessage});
}

/// @nodoc
class _$DroneFootageStateCopyWithImpl<$Res, $Val extends DroneFootageState>
    implements $DroneFootageStateCopyWith<$Res> {
  _$DroneFootageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? droneFootages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      droneFootages: null == droneFootages
          ? _value.droneFootages
          : droneFootages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<DroneFootageModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DroneFootageStateCopyWith<$Res>
    implements $DroneFootageStateCopyWith<$Res> {
  factory _$$_DroneFootageStateCopyWith(_$_DroneFootageState value,
          $Res Function(_$_DroneFootageState) then) =
      __$$_DroneFootageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<List<DroneFootageModel>> droneFootages,
      String? errorMessage});
}

/// @nodoc
class __$$_DroneFootageStateCopyWithImpl<$Res>
    extends _$DroneFootageStateCopyWithImpl<$Res, _$_DroneFootageState>
    implements _$$_DroneFootageStateCopyWith<$Res> {
  __$$_DroneFootageStateCopyWithImpl(
      _$_DroneFootageState _value, $Res Function(_$_DroneFootageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? droneFootages = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_DroneFootageState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      droneFootages: null == droneFootages
          ? _value.droneFootages
          : droneFootages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<DroneFootageModel>>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DroneFootageState implements _DroneFootageState {
  const _$_DroneFootageState(
      {this.isFetching = false,
      this.droneFootages = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<List<DroneFootageModel>> droneFootages;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DroneFootageState(isFetching: $isFetching, droneFootages: $droneFootages, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DroneFootageState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.droneFootages, droneFootages) ||
                other.droneFootages == droneFootages) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, droneFootages, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DroneFootageStateCopyWith<_$_DroneFootageState> get copyWith =>
      __$$_DroneFootageStateCopyWithImpl<_$_DroneFootageState>(
          this, _$identity);
}

abstract class _DroneFootageState implements DroneFootageState {
  const factory _DroneFootageState(
      {final bool isFetching,
      final AsyncValue<List<DroneFootageModel>> droneFootages,
      final String? errorMessage}) = _$_DroneFootageState;

  @override
  bool get isFetching;
  @override
  AsyncValue<List<DroneFootageModel>> get droneFootages;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_DroneFootageStateCopyWith<_$_DroneFootageState> get copyWith =>
      throw _privateConstructorUsedError;
}
