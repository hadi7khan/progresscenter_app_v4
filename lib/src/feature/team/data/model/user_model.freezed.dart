// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  Preset? get preset => throw _privateConstructorUsedError;
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<Project>? get projects => throw _privateConstructorUsedError;
  String? get lastActive => throw _privateConstructorUsedError;
  String? get userModelId => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {Preset? preset,
      CreatedBy? createdBy,
      String? id,
      String? name,
      String? email,
      String? role,
      String? status,
      String? dp,
      String? designation,
      List<String>? tags,
      List<Project>? projects,
      String? lastActive,
      String? userModelId,
      String? dpUrl});

  $PresetCopyWith<$Res>? get preset;
  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? createdBy = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? tags = freezed,
    Object? projects = freezed,
    Object? lastActive = freezed,
    Object? userModelId = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_value.copyWith(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>?,
      lastActive: freezed == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as String?,
      userModelId: freezed == userModelId
          ? _value.userModelId
          : userModelId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preset? preset,
      CreatedBy? createdBy,
      String? id,
      String? name,
      String? email,
      String? role,
      String? status,
      String? dp,
      String? designation,
      List<String>? tags,
      List<Project>? projects,
      String? lastActive,
      String? userModelId,
      String? dpUrl});

  @override
  $PresetCopyWith<$Res>? get preset;
  @override
  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? createdBy = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? tags = freezed,
    Object? projects = freezed,
    Object? lastActive = freezed,
    Object? userModelId = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_$_UserModel(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>?,
      lastActive: freezed == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as String?,
      userModelId: freezed == userModelId
          ? _value.userModelId
          : userModelId // ignore: cast_nullable_to_non_nullable
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
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.preset,
      this.createdBy,
      this.id,
      this.name,
      this.email,
      this.role,
      this.status,
      this.dp,
      this.designation,
      final List<String>? tags,
      final List<Project>? projects,
      this.lastActive,
      this.userModelId,
      this.dpUrl})
      : _tags = tags,
        _projects = projects;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final Preset? preset;
  @override
  final CreatedBy? createdBy;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? role;
  @override
  final String? status;
  @override
  final String? dp;
  @override
  final String? designation;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Project>? _projects;
  @override
  List<Project>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? lastActive;
  @override
  final String? userModelId;
  @override
  final String? dpUrl;

  @override
  String toString() {
    return 'UserModel(preset: $preset, createdBy: $createdBy, id: $id, name: $name, email: $email, role: $role, status: $status, dp: $dp, designation: $designation, tags: $tags, projects: $projects, lastActive: $lastActive, userModelId: $userModelId, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.preset, preset) || other.preset == preset) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.userModelId, userModelId) ||
                other.userModelId == userModelId) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      preset,
      createdBy,
      id,
      name,
      email,
      role,
      status,
      dp,
      designation,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_projects),
      lastActive,
      userModelId,
      dpUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final Preset? preset,
      final CreatedBy? createdBy,
      final String? id,
      final String? name,
      final String? email,
      final String? role,
      final String? status,
      final String? dp,
      final String? designation,
      final List<String>? tags,
      final List<Project>? projects,
      final String? lastActive,
      final String? userModelId,
      final String? dpUrl}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  Preset? get preset;
  @override
  CreatedBy? get createdBy;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get role;
  @override
  String? get status;
  @override
  String? get dp;
  @override
  String? get designation;
  @override
  List<String>? get tags;
  @override
  List<Project>? get projects;
  @override
  String? get lastActive;
  @override
  String? get userModelId;
  @override
  String? get dpUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
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
  dynamic get dp => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  dynamic get dpUrl => throw _privateConstructorUsedError;

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
      dynamic dp,
      String? designation,
      String? createdById,
      dynamic dpUrl});

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
              as dynamic,
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
              as dynamic,
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
      dynamic dp,
      String? designation,
      String? createdById,
      dynamic dpUrl});

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
              as dynamic,
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
              as dynamic,
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
  final dynamic dp;
  @override
  final String? designation;
  @override
  final String? createdById;
  @override
  final dynamic dpUrl;

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
            const DeepCollectionEquality().equals(other.dp, dp) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            const DeepCollectionEquality().equals(other.dpUrl, dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      preset,
      id,
      name,
      const DeepCollectionEquality().hash(dp),
      designation,
      createdById,
      const DeepCollectionEquality().hash(dpUrl));

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
      final dynamic dp,
      final String? designation,
      final String? createdById,
      final dynamic dpUrl}) = _$_CreatedBy;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$_CreatedBy.fromJson;

  @override
  Preset? get preset;
  @override
  String? get id;
  @override
  String? get name;
  @override
  dynamic get dp;
  @override
  String? get designation;
  @override
  String? get createdById;
  @override
  dynamic get dpUrl;
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

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call({String? id, String? name, String? projectId});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? projectId});
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$_Project>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_$_Project(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  const _$_Project({this.id, this.name, this.projectId});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? projectId;

  @override
  String toString() {
    return 'Project(id: $id, name: $name, projectId: $projectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Project &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {final String? id,
      final String? name,
      final String? projectId}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get projectId;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
