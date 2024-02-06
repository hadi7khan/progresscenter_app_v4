// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) {
  return _NotificationsModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationsModel {
  int? get count => throw _privateConstructorUsedError;
  List<Notification>? get notifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
          NotificationsModel value, $Res Function(NotificationsModel) then) =
      _$NotificationsModelCopyWithImpl<$Res, NotificationsModel>;
  @useResult
  $Res call({int? count, List<Notification>? notifications});
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res, $Val extends NotificationsModel>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationsModelCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$$_NotificationsModelCopyWith(_$_NotificationsModel value,
          $Res Function(_$_NotificationsModel) then) =
      __$$_NotificationsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<Notification>? notifications});
}

/// @nodoc
class __$$_NotificationsModelCopyWithImpl<$Res>
    extends _$NotificationsModelCopyWithImpl<$Res, _$_NotificationsModel>
    implements _$$_NotificationsModelCopyWith<$Res> {
  __$$_NotificationsModelCopyWithImpl(
      _$_NotificationsModel _value, $Res Function(_$_NotificationsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationsModel(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsModel implements _NotificationsModel {
  const _$_NotificationsModel(
      {this.count, final List<Notification>? notifications})
      : _notifications = notifications;

  factory _$_NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsModelFromJson(json);

  @override
  final int? count;
  final List<Notification>? _notifications;
  @override
  List<Notification>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NotificationsModel(count: $count, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsModel &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationsModelCopyWith<_$_NotificationsModel> get copyWith =>
      __$$_NotificationsModelCopyWithImpl<_$_NotificationsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsModelToJson(
      this,
    );
  }
}

abstract class _NotificationsModel implements NotificationsModel {
  const factory _NotificationsModel(
      {final int? count,
      final List<Notification>? notifications}) = _$_NotificationsModel;

  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationsModel.fromJson;

  @override
  int? get count;
  @override
  List<Notification>? get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsModelCopyWith<_$_NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String? get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Details? get details => throw _privateConstructorUsedError;
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;
  String? get notificationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String? id,
      String? user,
      String? type,
      String? message,
      Details? details,
      CreatedBy? createdBy,
      DateTime? readAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? read,
      String? notificationId});

  $DetailsCopyWith<$Res>? get details;
  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? details = freezed,
    Object? createdBy = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? notificationId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailsCopyWith<$Res>? get details {
    if (_value.details == null) {
      return null;
    }

    return $DetailsCopyWith<$Res>(_value.details!, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? user,
      String? type,
      String? message,
      Details? details,
      CreatedBy? createdBy,
      DateTime? readAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      bool? read,
      String? notificationId});

  @override
  $DetailsCopyWith<$Res>? get details;
  @override
  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? details = freezed,
    Object? createdBy = freezed,
    Object? readAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? read = freezed,
    Object? notificationId = freezed,
  }) {
    return _then(_$_Notification(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification implements _Notification {
  const _$_Notification(
      {this.id,
      this.user,
      this.type,
      this.message,
      this.details,
      this.createdBy,
      this.readAt,
      this.createdAt,
      this.updatedAt,
      this.read,
      this.notificationId});

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override
  final String? id;
  @override
  final String? user;
  @override
  final String? type;
  @override
  final String? message;
  @override
  final Details? details;
  @override
  final CreatedBy? createdBy;
  @override
  final DateTime? readAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? read;
  @override
  final String? notificationId;

  @override
  String toString() {
    return 'Notification(id: $id, user: $user, type: $type, message: $message, details: $details, createdBy: $createdBy, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt, read: $read, notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, type, message, details,
      createdBy, readAt, createdAt, updatedAt, read, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {final String? id,
      final String? user,
      final String? type,
      final String? message,
      final Details? details,
      final CreatedBy? createdBy,
      final DateTime? readAt,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final bool? read,
      final String? notificationId}) = _$_Notification;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  String? get id;
  @override
  String? get user;
  @override
  String? get type;
  @override
  String? get message;
  @override
  Details? get details;
  @override
  CreatedBy? get createdBy;
  @override
  DateTime? get readAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  bool? get read;
  @override
  String? get notificationId;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
  Preset? get preset => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
  @useResult
  $Res call(
      {Preset? preset,
      String? id,
      String? name,
      String? dp,
      String? designation,
      String? createdById,
      String? dpUrl});

  $PresetCopyWith<$Res>? get preset;
}

/// @nodoc
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? createdById = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_value.copyWith(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String?,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PresetCopyWith<$Res>? get preset {
    if (_value.preset == null) {
      return null;
    }

    return $PresetCopyWith<$Res>(_value.preset!, (value) {
      return _then(_value.copyWith(preset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreatedByCopyWith<$Res> implements $CreatedByCopyWith<$Res> {
  factory _$$_CreatedByCopyWith(
          _$_CreatedBy value, $Res Function(_$_CreatedBy) then) =
      __$$_CreatedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preset? preset,
      String? id,
      String? name,
      String? dp,
      String? designation,
      String? createdById,
      String? dpUrl});

  @override
  $PresetCopyWith<$Res>? get preset;
}

/// @nodoc
class __$$_CreatedByCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$_CreatedBy>
    implements _$$_CreatedByCopyWith<$Res> {
  __$$_CreatedByCopyWithImpl(
      _$_CreatedBy _value, $Res Function(_$_CreatedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? createdById = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_$_CreatedBy(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as String?,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatedBy implements _CreatedBy {
  const _$_CreatedBy(
      {this.preset,
      this.id,
      this.name,
      this.dp,
      this.designation,
      this.createdById,
      this.dpUrl});

  factory _$_CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$$_CreatedByFromJson(json);

  @override
  final Preset? preset;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? dp;
  @override
  final String? designation;
  @override
  final String? createdById;
  @override
  final String? dpUrl;

  @override
  String toString() {
    return 'CreatedBy(preset: $preset, id: $id, name: $name, dp: $dp, designation: $designation, createdById: $createdById, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedBy &&
            (identical(other.preset, preset) || other.preset == preset) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, preset, id, name, dp, designation, createdById, dpUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      __$$_CreatedByCopyWithImpl<_$_CreatedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatedByToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
      {final Preset? preset,
      final String? id,
      final String? name,
      final String? dp,
      final String? designation,
      final String? createdById,
      final String? dpUrl}) = _$_CreatedBy;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$_CreatedBy.fromJson;

  @override
  Preset? get preset;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get dp;
  @override
  String? get designation;
  @override
  String? get createdById;
  @override
  String? get dpUrl;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

Preset _$PresetFromJson(Map<String, dynamic> json) {
  return _Preset.fromJson(json);
}

/// @nodoc
mixin _$Preset {
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresetCopyWith<Preset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresetCopyWith<$Res> {
  factory $PresetCopyWith(Preset value, $Res Function(Preset) then) =
      _$PresetCopyWithImpl<$Res, Preset>;
  @useResult
  $Res call({String? color});
}

/// @nodoc
class _$PresetCopyWithImpl<$Res, $Val extends Preset>
    implements $PresetCopyWith<$Res> {
  _$PresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PresetCopyWith<$Res> implements $PresetCopyWith<$Res> {
  factory _$$_PresetCopyWith(_$_Preset value, $Res Function(_$_Preset) then) =
      __$$_PresetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? color});
}

/// @nodoc
class __$$_PresetCopyWithImpl<$Res>
    extends _$PresetCopyWithImpl<$Res, _$_Preset>
    implements _$$_PresetCopyWith<$Res> {
  __$$_PresetCopyWithImpl(_$_Preset _value, $Res Function(_$_Preset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_$_Preset(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Preset implements _Preset {
  const _$_Preset({this.color});

  factory _$_Preset.fromJson(Map<String, dynamic> json) =>
      _$$_PresetFromJson(json);

  @override
  final String? color;

  @override
  String toString() {
    return 'Preset(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preset &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresetCopyWith<_$_Preset> get copyWith =>
      __$$_PresetCopyWithImpl<_$_Preset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PresetToJson(
      this,
    );
  }
}

abstract class _Preset implements Preset {
  const factory _Preset({final String? color}) = _$_Preset;

  factory _Preset.fromJson(Map<String, dynamic> json) = _$_Preset.fromJson;

  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$_PresetCopyWith<_$_Preset> get copyWith =>
      throw _privateConstructorUsedError;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String? get projectId => throw _privateConstructorUsedError;
  String? get progressLinePostId => throw _privateConstructorUsedError;
  String? get cameraId => throw _privateConstructorUsedError;
  String? get cameraName => throw _privateConstructorUsedError;
  String? get projectName => throw _privateConstructorUsedError;
  String? get cameraImageName => throw _privateConstructorUsedError;
  String? get cameraImageCommentId => throw _privateConstructorUsedError;
  String? get progressLineCommentId => throw _privateConstructorUsedError;
  String? get cameraImageCommentReplyId => throw _privateConstructorUsedError;
  String? get folderId => throw _privateConstructorUsedError;
  String? get fileId => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  DateTime? get fileCreatedAt => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  String? get multiImageDownloadId => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get livelapseId => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  ProjectLocation? get projectLocation => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  dynamic get projectImageFilePath => throw _privateConstructorUsedError;
  String? get invitationId => throw _privateConstructorUsedError;
  String? get supportTicketId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsCopyWith<Details> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsCopyWith<$Res> {
  factory $DetailsCopyWith(Details value, $Res Function(Details) then) =
      _$DetailsCopyWithImpl<$Res, Details>;
  @useResult
  $Res call(
      {String? projectId,
      String? progressLinePostId,
      String? cameraId,
      String? cameraName,
      String? projectName,
      String? cameraImageName,
      String? cameraImageCommentId,
      String? progressLineCommentId,
      String? cameraImageCommentReplyId,
      String? folderId,
      String? fileId,
      String? fileName,
      String? filePath,
      DateTime? fileCreatedAt,
      String? filename,
      String? multiImageDownloadId,
      String? startDate,
      String? endDate,
      String? livelapseId,
      int? duration,
      ProjectLocation? projectLocation,
      String? userId,
      dynamic projectImageFilePath,
      String? invitationId,
      String? supportTicketId});

  $ProjectLocationCopyWith<$Res>? get projectLocation;
}

/// @nodoc
class _$DetailsCopyWithImpl<$Res, $Val extends Details>
    implements $DetailsCopyWith<$Res> {
  _$DetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? progressLinePostId = freezed,
    Object? cameraId = freezed,
    Object? cameraName = freezed,
    Object? projectName = freezed,
    Object? cameraImageName = freezed,
    Object? cameraImageCommentId = freezed,
    Object? progressLineCommentId = freezed,
    Object? cameraImageCommentReplyId = freezed,
    Object? folderId = freezed,
    Object? fileId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileCreatedAt = freezed,
    Object? filename = freezed,
    Object? multiImageDownloadId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? livelapseId = freezed,
    Object? duration = freezed,
    Object? projectLocation = freezed,
    Object? userId = freezed,
    Object? projectImageFilePath = freezed,
    Object? invitationId = freezed,
    Object? supportTicketId = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLinePostId: freezed == progressLinePostId
          ? _value.progressLinePostId
          : progressLinePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraId: freezed == cameraId
          ? _value.cameraId
          : cameraId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraName: freezed == cameraName
          ? _value.cameraName
          : cameraName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageName: freezed == cameraImageName
          ? _value.cameraImageName
          : cameraImageName // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageCommentId: freezed == cameraImageCommentId
          ? _value.cameraImageCommentId
          : cameraImageCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLineCommentId: freezed == progressLineCommentId
          ? _value.progressLineCommentId
          : progressLineCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageCommentReplyId: freezed == cameraImageCommentReplyId
          ? _value.cameraImageCommentReplyId
          : cameraImageCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCreatedAt: freezed == fileCreatedAt
          ? _value.fileCreatedAt
          : fileCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      multiImageDownloadId: freezed == multiImageDownloadId
          ? _value.multiImageDownloadId
          : multiImageDownloadId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      livelapseId: freezed == livelapseId
          ? _value.livelapseId
          : livelapseId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      projectLocation: freezed == projectLocation
          ? _value.projectLocation
          : projectLocation // ignore: cast_nullable_to_non_nullable
              as ProjectLocation?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectImageFilePath: freezed == projectImageFilePath
          ? _value.projectImageFilePath
          : projectImageFilePath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      invitationId: freezed == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String?,
      supportTicketId: freezed == supportTicketId
          ? _value.supportTicketId
          : supportTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectLocationCopyWith<$Res>? get projectLocation {
    if (_value.projectLocation == null) {
      return null;
    }

    return $ProjectLocationCopyWith<$Res>(_value.projectLocation!, (value) {
      return _then(_value.copyWith(projectLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailsCopyWith<$Res> implements $DetailsCopyWith<$Res> {
  factory _$$_DetailsCopyWith(
          _$_Details value, $Res Function(_$_Details) then) =
      __$$_DetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? projectId,
      String? progressLinePostId,
      String? cameraId,
      String? cameraName,
      String? projectName,
      String? cameraImageName,
      String? cameraImageCommentId,
      String? progressLineCommentId,
      String? cameraImageCommentReplyId,
      String? folderId,
      String? fileId,
      String? fileName,
      String? filePath,
      DateTime? fileCreatedAt,
      String? filename,
      String? multiImageDownloadId,
      String? startDate,
      String? endDate,
      String? livelapseId,
      int? duration,
      ProjectLocation? projectLocation,
      String? userId,
      dynamic projectImageFilePath,
      String? invitationId,
      String? supportTicketId});

  @override
  $ProjectLocationCopyWith<$Res>? get projectLocation;
}

/// @nodoc
class __$$_DetailsCopyWithImpl<$Res>
    extends _$DetailsCopyWithImpl<$Res, _$_Details>
    implements _$$_DetailsCopyWith<$Res> {
  __$$_DetailsCopyWithImpl(_$_Details _value, $Res Function(_$_Details) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? progressLinePostId = freezed,
    Object? cameraId = freezed,
    Object? cameraName = freezed,
    Object? projectName = freezed,
    Object? cameraImageName = freezed,
    Object? cameraImageCommentId = freezed,
    Object? progressLineCommentId = freezed,
    Object? cameraImageCommentReplyId = freezed,
    Object? folderId = freezed,
    Object? fileId = freezed,
    Object? fileName = freezed,
    Object? filePath = freezed,
    Object? fileCreatedAt = freezed,
    Object? filename = freezed,
    Object? multiImageDownloadId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? livelapseId = freezed,
    Object? duration = freezed,
    Object? projectLocation = freezed,
    Object? userId = freezed,
    Object? projectImageFilePath = freezed,
    Object? invitationId = freezed,
    Object? supportTicketId = freezed,
  }) {
    return _then(_$_Details(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLinePostId: freezed == progressLinePostId
          ? _value.progressLinePostId
          : progressLinePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraId: freezed == cameraId
          ? _value.cameraId
          : cameraId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraName: freezed == cameraName
          ? _value.cameraName
          : cameraName // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageName: freezed == cameraImageName
          ? _value.cameraImageName
          : cameraImageName // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageCommentId: freezed == cameraImageCommentId
          ? _value.cameraImageCommentId
          : cameraImageCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLineCommentId: freezed == progressLineCommentId
          ? _value.progressLineCommentId
          : progressLineCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraImageCommentReplyId: freezed == cameraImageCommentReplyId
          ? _value.cameraImageCommentReplyId
          : cameraImageCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileId: freezed == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileCreatedAt: freezed == fileCreatedAt
          ? _value.fileCreatedAt
          : fileCreatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      multiImageDownloadId: freezed == multiImageDownloadId
          ? _value.multiImageDownloadId
          : multiImageDownloadId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      livelapseId: freezed == livelapseId
          ? _value.livelapseId
          : livelapseId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      projectLocation: freezed == projectLocation
          ? _value.projectLocation
          : projectLocation // ignore: cast_nullable_to_non_nullable
              as ProjectLocation?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectImageFilePath: freezed == projectImageFilePath
          ? _value.projectImageFilePath
          : projectImageFilePath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      invitationId: freezed == invitationId
          ? _value.invitationId
          : invitationId // ignore: cast_nullable_to_non_nullable
              as String?,
      supportTicketId: freezed == supportTicketId
          ? _value.supportTicketId
          : supportTicketId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Details implements _Details {
  const _$_Details(
      {this.projectId,
      this.progressLinePostId,
      this.cameraId,
      this.cameraName,
      this.projectName,
      this.cameraImageName,
      this.cameraImageCommentId,
      this.progressLineCommentId,
      this.cameraImageCommentReplyId,
      this.folderId,
      this.fileId,
      this.fileName,
      this.filePath,
      this.fileCreatedAt,
      this.filename,
      this.multiImageDownloadId,
      this.startDate,
      this.endDate,
      this.livelapseId,
      this.duration,
      this.projectLocation,
      this.userId,
      this.projectImageFilePath,
      this.invitationId,
      this.supportTicketId});

  factory _$_Details.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsFromJson(json);

  @override
  final String? projectId;
  @override
  final String? progressLinePostId;
  @override
  final String? cameraId;
  @override
  final String? cameraName;
  @override
  final String? projectName;
  @override
  final String? cameraImageName;
  @override
  final String? cameraImageCommentId;
  @override
  final String? progressLineCommentId;
  @override
  final String? cameraImageCommentReplyId;
  @override
  final String? folderId;
  @override
  final String? fileId;
  @override
  final String? fileName;
  @override
  final String? filePath;
  @override
  final DateTime? fileCreatedAt;
  @override
  final String? filename;
  @override
  final String? multiImageDownloadId;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? livelapseId;
  @override
  final int? duration;
  @override
  final ProjectLocation? projectLocation;
  @override
  final String? userId;
  @override
  final dynamic projectImageFilePath;
  @override
  final String? invitationId;
  @override
  final String? supportTicketId;

  @override
  String toString() {
    return 'Details(projectId: $projectId, progressLinePostId: $progressLinePostId, cameraId: $cameraId, cameraName: $cameraName, projectName: $projectName, cameraImageName: $cameraImageName, cameraImageCommentId: $cameraImageCommentId, progressLineCommentId: $progressLineCommentId, cameraImageCommentReplyId: $cameraImageCommentReplyId, folderId: $folderId, fileId: $fileId, fileName: $fileName, filePath: $filePath, fileCreatedAt: $fileCreatedAt, filename: $filename, multiImageDownloadId: $multiImageDownloadId, startDate: $startDate, endDate: $endDate, livelapseId: $livelapseId, duration: $duration, projectLocation: $projectLocation, userId: $userId, projectImageFilePath: $projectImageFilePath, invitationId: $invitationId, supportTicketId: $supportTicketId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Details &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.progressLinePostId, progressLinePostId) ||
                other.progressLinePostId == progressLinePostId) &&
            (identical(other.cameraId, cameraId) ||
                other.cameraId == cameraId) &&
            (identical(other.cameraName, cameraName) ||
                other.cameraName == cameraName) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.cameraImageName, cameraImageName) ||
                other.cameraImageName == cameraImageName) &&
            (identical(other.cameraImageCommentId, cameraImageCommentId) ||
                other.cameraImageCommentId == cameraImageCommentId) &&
            (identical(other.progressLineCommentId, progressLineCommentId) ||
                other.progressLineCommentId == progressLineCommentId) &&
            (identical(other.cameraImageCommentReplyId,
                    cameraImageCommentReplyId) ||
                other.cameraImageCommentReplyId == cameraImageCommentReplyId) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileCreatedAt, fileCreatedAt) ||
                other.fileCreatedAt == fileCreatedAt) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.multiImageDownloadId, multiImageDownloadId) ||
                other.multiImageDownloadId == multiImageDownloadId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.livelapseId, livelapseId) ||
                other.livelapseId == livelapseId) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.projectLocation, projectLocation) ||
                other.projectLocation == projectLocation) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other.projectImageFilePath, projectImageFilePath) &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.supportTicketId, supportTicketId) ||
                other.supportTicketId == supportTicketId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        projectId,
        progressLinePostId,
        cameraId,
        cameraName,
        projectName,
        cameraImageName,
        cameraImageCommentId,
        progressLineCommentId,
        cameraImageCommentReplyId,
        folderId,
        fileId,
        fileName,
        filePath,
        fileCreatedAt,
        filename,
        multiImageDownloadId,
        startDate,
        endDate,
        livelapseId,
        duration,
        projectLocation,
        userId,
        const DeepCollectionEquality().hash(projectImageFilePath),
        invitationId,
        supportTicketId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsCopyWith<_$_Details> get copyWith =>
      __$$_DetailsCopyWithImpl<_$_Details>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailsToJson(
      this,
    );
  }
}

abstract class _Details implements Details {
  const factory _Details(
      {final String? projectId,
      final String? progressLinePostId,
      final String? cameraId,
      final String? cameraName,
      final String? projectName,
      final String? cameraImageName,
      final String? cameraImageCommentId,
      final String? progressLineCommentId,
      final String? cameraImageCommentReplyId,
      final String? folderId,
      final String? fileId,
      final String? fileName,
      final String? filePath,
      final DateTime? fileCreatedAt,
      final String? filename,
      final String? multiImageDownloadId,
      final String? startDate,
      final String? endDate,
      final String? livelapseId,
      final int? duration,
      final ProjectLocation? projectLocation,
      final String? userId,
      final dynamic projectImageFilePath,
      final String? invitationId,
      final String? supportTicketId}) = _$_Details;

  factory _Details.fromJson(Map<String, dynamic> json) = _$_Details.fromJson;

  @override
  String? get projectId;
  @override
  String? get progressLinePostId;
  @override
  String? get cameraId;
  @override
  String? get cameraName;
  @override
  String? get projectName;
  @override
  String? get cameraImageName;
  @override
  String? get cameraImageCommentId;
  @override
  String? get progressLineCommentId;
  @override
  String? get cameraImageCommentReplyId;
  @override
  String? get folderId;
  @override
  String? get fileId;
  @override
  String? get fileName;
  @override
  String? get filePath;
  @override
  DateTime? get fileCreatedAt;
  @override
  String? get filename;
  @override
  String? get multiImageDownloadId;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String? get livelapseId;
  @override
  int? get duration;
  @override
  ProjectLocation? get projectLocation;
  @override
  String? get userId;
  @override
  dynamic get projectImageFilePath;
  @override
  String? get invitationId;
  @override
  String? get supportTicketId;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsCopyWith<_$_Details> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectLocation _$ProjectLocationFromJson(Map<String, dynamic> json) {
  return _ProjectLocation.fromJson(json);
}

/// @nodoc
mixin _$ProjectLocation {
  String? get name => throw _privateConstructorUsedError;
  dynamic get latitude => throw _privateConstructorUsedError;
  dynamic get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectLocationCopyWith<ProjectLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectLocationCopyWith<$Res> {
  factory $ProjectLocationCopyWith(
          ProjectLocation value, $Res Function(ProjectLocation) then) =
      _$ProjectLocationCopyWithImpl<$Res, ProjectLocation>;
  @useResult
  $Res call({String? name, dynamic latitude, dynamic longitude});
}

/// @nodoc
class _$ProjectLocationCopyWithImpl<$Res, $Val extends ProjectLocation>
    implements $ProjectLocationCopyWith<$Res> {
  _$ProjectLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectLocationCopyWith<$Res>
    implements $ProjectLocationCopyWith<$Res> {
  factory _$$_ProjectLocationCopyWith(
          _$_ProjectLocation value, $Res Function(_$_ProjectLocation) then) =
      __$$_ProjectLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, dynamic latitude, dynamic longitude});
}

/// @nodoc
class __$$_ProjectLocationCopyWithImpl<$Res>
    extends _$ProjectLocationCopyWithImpl<$Res, _$_ProjectLocation>
    implements _$$_ProjectLocationCopyWith<$Res> {
  __$$_ProjectLocationCopyWithImpl(
      _$_ProjectLocation _value, $Res Function(_$_ProjectLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_ProjectLocation(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectLocation implements _ProjectLocation {
  const _$_ProjectLocation({this.name, this.latitude, this.longitude});

  factory _$_ProjectLocation.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectLocationFromJson(json);

  @override
  final String? name;
  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  @override
  String toString() {
    return 'ProjectLocation(name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectLocation &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectLocationCopyWith<_$_ProjectLocation> get copyWith =>
      __$$_ProjectLocationCopyWithImpl<_$_ProjectLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectLocationToJson(
      this,
    );
  }
}

abstract class _ProjectLocation implements ProjectLocation {
  const factory _ProjectLocation(
      {final String? name,
      final dynamic latitude,
      final dynamic longitude}) = _$_ProjectLocation;

  factory _ProjectLocation.fromJson(Map<String, dynamic> json) =
      _$_ProjectLocation.fromJson;

  @override
  String? get name;
  @override
  dynamic get latitude;
  @override
  dynamic get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectLocationCopyWith<_$_ProjectLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
