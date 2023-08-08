// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DocsModel _$DocsModelFromJson(Map<String, dynamic> json) {
  return _DocsModel.fromJson(json);
}

/// @nodoc
mixin _$DocsModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  List<FileElement>? get files => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocsModelCopyWith<DocsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsModelCopyWith<$Res> {
  factory $DocsModelCopyWith(DocsModel value, $Res Function(DocsModel) then) =
      _$DocsModelCopyWithImpl<$Res, DocsModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      CreatedBy? createdBy,
      String? client,
      List<FileElement>? files,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class _$DocsModelCopyWithImpl<$Res, $Val extends DocsModel>
    implements $DocsModelCopyWith<$Res> {
  _$DocsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? client = freezed,
    Object? files = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileElement>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
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
abstract class _$$_DocsModelCopyWith<$Res> implements $DocsModelCopyWith<$Res> {
  factory _$$_DocsModelCopyWith(
          _$_DocsModel value, $Res Function(_$_DocsModel) then) =
      __$$_DocsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      CreatedBy? createdBy,
      String? client,
      List<FileElement>? files,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
}

/// @nodoc
class __$$_DocsModelCopyWithImpl<$Res>
    extends _$DocsModelCopyWithImpl<$Res, _$_DocsModel>
    implements _$$_DocsModelCopyWith<$Res> {
  __$$_DocsModelCopyWithImpl(
      _$_DocsModel _value, $Res Function(_$_DocsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdBy = freezed,
    Object? client = freezed,
    Object? files = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_DocsModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileElement>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocsModel implements _DocsModel {
  const _$_DocsModel(
      {this.id,
      this.name,
      this.createdBy,
      this.client,
      final List<FileElement>? files,
      this.createdAt,
      this.updatedAt})
      : _files = files;

  factory _$_DocsModel.fromJson(Map<String, dynamic> json) =>
      _$$_DocsModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final CreatedBy? createdBy;
  @override
  final String? client;
  final List<FileElement>? _files;
  @override
  List<FileElement>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DocsModel(id: $id, name: $name, createdBy: $createdBy, client: $client, files: $files, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.client, client) || other.client == client) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdBy, client,
      const DeepCollectionEquality().hash(_files), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocsModelCopyWith<_$_DocsModel> get copyWith =>
      __$$_DocsModelCopyWithImpl<_$_DocsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocsModelToJson(
      this,
    );
  }
}

abstract class _DocsModel implements DocsModel {
  const factory _DocsModel(
      {final String? id,
      final String? name,
      final CreatedBy? createdBy,
      final String? client,
      final List<FileElement>? files,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_DocsModel;

  factory _DocsModel.fromJson(Map<String, dynamic> json) =
      _$_DocsModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  CreatedBy? get createdBy;
  @override
  String? get client;
  @override
  List<FileElement>? get files;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DocsModelCopyWith<_$_DocsModel> get copyWith =>
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
  String? get email => throw _privateConstructorUsedError;

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
      String? dpUrl,
      String? email});

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
    Object? email = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
      String? dpUrl,
      String? email});

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
    Object? email = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
      this.dpUrl,
      this.email});

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
  final String? email;

  @override
  String toString() {
    return 'CreatedBy(preset: $preset, id: $id, name: $name, dp: $dp, designation: $designation, createdById: $createdById, dpUrl: $dpUrl, email: $email)';
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
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, preset, id, name, dp,
      designation, createdById, dpUrl, email);

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
      final String? dpUrl,
      final String? email}) = _$_CreatedBy;

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
  String? get email;
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

FileElement _$FileElementFromJson(Map<String, dynamic> json) {
  return _FileElement.fromJson(json);
}

/// @nodoc
mixin _$FileElement {
  String? get name => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get fileSize => throw _privateConstructorUsedError;
  UploadedBy? get uploadedBy => throw _privateConstructorUsedError;
  List<CreatedBy>? get users => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileElementCopyWith<FileElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileElementCopyWith<$Res> {
  factory $FileElementCopyWith(
          FileElement value, $Res Function(FileElement) then) =
      _$FileElementCopyWithImpl<$Res, FileElement>;
  @useResult
  $Res call(
      {String? name,
      String? path,
      String? fileSize,
      UploadedBy? uploadedBy,
      List<CreatedBy>? users,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});

  $UploadedByCopyWith<$Res>? get uploadedBy;
}

/// @nodoc
class _$FileElementCopyWithImpl<$Res, $Val extends FileElement>
    implements $FileElementCopyWith<$Res> {
  _$FileElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = freezed,
    Object? fileSize = freezed,
    Object? uploadedBy = freezed,
    Object? users = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as UploadedBy?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CreatedBy>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UploadedByCopyWith<$Res>? get uploadedBy {
    if (_value.uploadedBy == null) {
      return null;
    }

    return $UploadedByCopyWith<$Res>(_value.uploadedBy!, (value) {
      return _then(_value.copyWith(uploadedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FileElementCopyWith<$Res>
    implements $FileElementCopyWith<$Res> {
  factory _$$_FileElementCopyWith(
          _$_FileElement value, $Res Function(_$_FileElement) then) =
      __$$_FileElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? path,
      String? fileSize,
      UploadedBy? uploadedBy,
      List<CreatedBy>? users,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});

  @override
  $UploadedByCopyWith<$Res>? get uploadedBy;
}

/// @nodoc
class __$$_FileElementCopyWithImpl<$Res>
    extends _$FileElementCopyWithImpl<$Res, _$_FileElement>
    implements _$$_FileElementCopyWith<$Res> {
  __$$_FileElementCopyWithImpl(
      _$_FileElement _value, $Res Function(_$_FileElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = freezed,
    Object? fileSize = freezed,
    Object? uploadedBy = freezed,
    Object? users = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_FileElement(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedBy: freezed == uploadedBy
          ? _value.uploadedBy
          : uploadedBy // ignore: cast_nullable_to_non_nullable
              as UploadedBy?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<CreatedBy>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileElement implements _FileElement {
  const _$_FileElement(
      {this.name,
      this.path,
      this.fileSize,
      this.uploadedBy,
      final List<CreatedBy>? users,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.url})
      : _users = users;

  factory _$_FileElement.fromJson(Map<String, dynamic> json) =>
      _$$_FileElementFromJson(json);

  @override
  final String? name;
  @override
  final String? path;
  @override
  final String? fileSize;
  @override
  final UploadedBy? uploadedBy;
  final List<CreatedBy>? _users;
  @override
  List<CreatedBy>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? url;

  @override
  String toString() {
    return 'FileElement(name: $name, path: $path, fileSize: $fileSize, uploadedBy: $uploadedBy, users: $users, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileElement &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.uploadedBy, uploadedBy) ||
                other.uploadedBy == uploadedBy) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      path,
      fileSize,
      uploadedBy,
      const DeepCollectionEquality().hash(_users),
      id,
      createdAt,
      updatedAt,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileElementCopyWith<_$_FileElement> get copyWith =>
      __$$_FileElementCopyWithImpl<_$_FileElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileElementToJson(
      this,
    );
  }
}

abstract class _FileElement implements FileElement {
  const factory _FileElement(
      {final String? name,
      final String? path,
      final String? fileSize,
      final UploadedBy? uploadedBy,
      final List<CreatedBy>? users,
      final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? url}) = _$_FileElement;

  factory _FileElement.fromJson(Map<String, dynamic> json) =
      _$_FileElement.fromJson;

  @override
  String? get name;
  @override
  String? get path;
  @override
  String? get fileSize;
  @override
  UploadedBy? get uploadedBy;
  @override
  List<CreatedBy>? get users;
  @override
  String? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_FileElementCopyWith<_$_FileElement> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadedBy _$UploadedByFromJson(Map<String, dynamic> json) {
  return _UploadedBy.fromJson(json);
}

/// @nodoc
mixin _$UploadedBy {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get uploadedById => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedByCopyWith<UploadedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedByCopyWith<$Res> {
  factory $UploadedByCopyWith(
          UploadedBy value, $Res Function(UploadedBy) then) =
      _$UploadedByCopyWithImpl<$Res, UploadedBy>;
  @useResult
  $Res call({String? id, String? name, String? uploadedById});
}

/// @nodoc
class _$UploadedByCopyWithImpl<$Res, $Val extends UploadedBy>
    implements $UploadedByCopyWith<$Res> {
  _$UploadedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? uploadedById = freezed,
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
      uploadedById: freezed == uploadedById
          ? _value.uploadedById
          : uploadedById // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadedByCopyWith<$Res>
    implements $UploadedByCopyWith<$Res> {
  factory _$$_UploadedByCopyWith(
          _$_UploadedBy value, $Res Function(_$_UploadedBy) then) =
      __$$_UploadedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? uploadedById});
}

/// @nodoc
class __$$_UploadedByCopyWithImpl<$Res>
    extends _$UploadedByCopyWithImpl<$Res, _$_UploadedBy>
    implements _$$_UploadedByCopyWith<$Res> {
  __$$_UploadedByCopyWithImpl(
      _$_UploadedBy _value, $Res Function(_$_UploadedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? uploadedById = freezed,
  }) {
    return _then(_$_UploadedBy(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedById: freezed == uploadedById
          ? _value.uploadedById
          : uploadedById // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadedBy implements _UploadedBy {
  const _$_UploadedBy({this.id, this.name, this.uploadedById});

  factory _$_UploadedBy.fromJson(Map<String, dynamic> json) =>
      _$$_UploadedByFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? uploadedById;

  @override
  String toString() {
    return 'UploadedBy(id: $id, name: $name, uploadedById: $uploadedById)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uploadedById, uploadedById) ||
                other.uploadedById == uploadedById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, uploadedById);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadedByCopyWith<_$_UploadedBy> get copyWith =>
      __$$_UploadedByCopyWithImpl<_$_UploadedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadedByToJson(
      this,
    );
  }
}

abstract class _UploadedBy implements UploadedBy {
  const factory _UploadedBy(
      {final String? id,
      final String? name,
      final String? uploadedById}) = _$_UploadedBy;

  factory _UploadedBy.fromJson(Map<String, dynamic> json) =
      _$_UploadedBy.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get uploadedById;
  @override
  @JsonKey(ignore: true)
  _$$_UploadedByCopyWith<_$_UploadedBy> get copyWith =>
      throw _privateConstructorUsedError;
}
