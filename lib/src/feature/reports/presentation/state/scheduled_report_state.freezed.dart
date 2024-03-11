// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduledReportState {
  bool get isFetching => throw _privateConstructorUsedError;
  AsyncValue<ScheduledReportModel> get scheduledReport =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduledReportStateCopyWith<ScheduledReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledReportStateCopyWith<$Res> {
  factory $ScheduledReportStateCopyWith(ScheduledReportState value,
          $Res Function(ScheduledReportState) then) =
      _$ScheduledReportStateCopyWithImpl<$Res, ScheduledReportState>;
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ScheduledReportModel> scheduledReport,
      String? errorMessage});
}

/// @nodoc
class _$ScheduledReportStateCopyWithImpl<$Res,
        $Val extends ScheduledReportState>
    implements $ScheduledReportStateCopyWith<$Res> {
  _$ScheduledReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? scheduledReport = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledReport: null == scheduledReport
          ? _value.scheduledReport
          : scheduledReport // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ScheduledReportModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduledReportStateCopyWith<$Res>
    implements $ScheduledReportStateCopyWith<$Res> {
  factory _$$_ScheduledReportStateCopyWith(_$_ScheduledReportState value,
          $Res Function(_$_ScheduledReportState) then) =
      __$$_ScheduledReportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      AsyncValue<ScheduledReportModel> scheduledReport,
      String? errorMessage});
}

/// @nodoc
class __$$_ScheduledReportStateCopyWithImpl<$Res>
    extends _$ScheduledReportStateCopyWithImpl<$Res, _$_ScheduledReportState>
    implements _$$_ScheduledReportStateCopyWith<$Res> {
  __$$_ScheduledReportStateCopyWithImpl(_$_ScheduledReportState _value,
      $Res Function(_$_ScheduledReportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? scheduledReport = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ScheduledReportState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledReport: null == scheduledReport
          ? _value.scheduledReport
          : scheduledReport // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ScheduledReportModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ScheduledReportState implements _ScheduledReportState {
  const _$_ScheduledReportState(
      {this.isFetching = false,
      this.scheduledReport = const AsyncValue.loading(),
      this.errorMessage});

  @override
  @JsonKey()
  final bool isFetching;
  @override
  @JsonKey()
  final AsyncValue<ScheduledReportModel> scheduledReport;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ScheduledReportState(isFetching: $isFetching, scheduledReport: $scheduledReport, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduledReportState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.scheduledReport, scheduledReport) ||
                other.scheduledReport == scheduledReport) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, scheduledReport, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduledReportStateCopyWith<_$_ScheduledReportState> get copyWith =>
      __$$_ScheduledReportStateCopyWithImpl<_$_ScheduledReportState>(
          this, _$identity);
}

abstract class _ScheduledReportState implements ScheduledReportState {
  const factory _ScheduledReportState(
      {final bool isFetching,
      final AsyncValue<ScheduledReportModel> scheduledReport,
      final String? errorMessage}) = _$_ScheduledReportState;

  @override
  bool get isFetching;
  @override
  AsyncValue<ScheduledReportModel> get scheduledReport;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduledReportStateCopyWith<_$_ScheduledReportState> get copyWith =>
      throw _privateConstructorUsedError;
}
