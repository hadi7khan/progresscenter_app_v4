// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cctv_camera_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CctvCameraModel _$CctvCameraModelFromJson(Map<String, dynamic> json) {
  return _CctvCameraModel.fromJson(json);
}

/// @nodoc
mixin _$CctvCameraModel {
  Details? get details => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get installationDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  AvailablePlugins? get availablePlugins => throw _privateConstructorUsedError;
  dynamic get pointedTo => throw _privateConstructorUsedError;
  String? get reseller => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get streamingUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CctvCameraModelCopyWith<CctvCameraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CctvCameraModelCopyWith<$Res> {
  factory $CctvCameraModelCopyWith(
          CctvCameraModel value, $Res Function(CctvCameraModel) then) =
      _$CctvCameraModelCopyWithImpl<$Res, CctvCameraModel>;
  @useResult
  $Res call(
      {Details? details,
      Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? status,
      DateTime? lastUpdated,
      AvailablePlugins? availablePlugins,
      dynamic pointedTo,
      String? reseller,
      String? client,
      String? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? streamingUrl});

  $DetailsCopyWith<$Res>? get details;
  $LocationCopyWith<$Res>? get location;
  $AvailablePluginsCopyWith<$Res>? get availablePlugins;
}

/// @nodoc
class _$CctvCameraModelCopyWithImpl<$Res, $Val extends CctvCameraModel>
    implements $CctvCameraModelCopyWith<$Res> {
  _$CctvCameraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? status = freezed,
    Object? lastUpdated = freezed,
    Object? availablePlugins = freezed,
    Object? pointedTo = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? streamingUrl = freezed,
  }) {
    return _then(_value.copyWith(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      installationDate: freezed == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availablePlugins: freezed == availablePlugins
          ? _value.availablePlugins
          : availablePlugins // ignore: cast_nullable_to_non_nullable
              as AvailablePlugins?,
      pointedTo: freezed == pointedTo
          ? _value.pointedTo
          : pointedTo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      streamingUrl: freezed == streamingUrl
          ? _value.streamingUrl
          : streamingUrl // ignore: cast_nullable_to_non_nullable
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
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailablePluginsCopyWith<$Res>? get availablePlugins {
    if (_value.availablePlugins == null) {
      return null;
    }

    return $AvailablePluginsCopyWith<$Res>(_value.availablePlugins!, (value) {
      return _then(_value.copyWith(availablePlugins: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CctvCameraModelCopyWith<$Res>
    implements $CctvCameraModelCopyWith<$Res> {
  factory _$$_CctvCameraModelCopyWith(
          _$_CctvCameraModel value, $Res Function(_$_CctvCameraModel) then) =
      __$$_CctvCameraModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Details? details,
      Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? status,
      DateTime? lastUpdated,
      AvailablePlugins? availablePlugins,
      dynamic pointedTo,
      String? reseller,
      String? client,
      String? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? streamingUrl});

  @override
  $DetailsCopyWith<$Res>? get details;
  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $AvailablePluginsCopyWith<$Res>? get availablePlugins;
}

/// @nodoc
class __$$_CctvCameraModelCopyWithImpl<$Res>
    extends _$CctvCameraModelCopyWithImpl<$Res, _$_CctvCameraModel>
    implements _$$_CctvCameraModelCopyWith<$Res> {
  __$$_CctvCameraModelCopyWithImpl(
      _$_CctvCameraModel _value, $Res Function(_$_CctvCameraModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = freezed,
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? status = freezed,
    Object? lastUpdated = freezed,
    Object? availablePlugins = freezed,
    Object? pointedTo = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? streamingUrl = freezed,
  }) {
    return _then(_$_CctvCameraModel(
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      installationDate: freezed == installationDate
          ? _value.installationDate
          : installationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availablePlugins: freezed == availablePlugins
          ? _value.availablePlugins
          : availablePlugins // ignore: cast_nullable_to_non_nullable
              as AvailablePlugins?,
      pointedTo: freezed == pointedTo
          ? _value.pointedTo
          : pointedTo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      streamingUrl: freezed == streamingUrl
          ? _value.streamingUrl
          : streamingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CctvCameraModel implements _CctvCameraModel {
  const _$_CctvCameraModel(
      {this.details,
      this.location,
      @JsonKey(name: '_id') this.id,
      this.name,
      this.installationDate,
      this.status,
      this.lastUpdated,
      this.availablePlugins,
      this.pointedTo,
      this.reseller,
      this.client,
      this.project,
      this.createdAt,
      this.updatedAt,
      this.streamingUrl});

  factory _$_CctvCameraModel.fromJson(Map<String, dynamic> json) =>
      _$$_CctvCameraModelFromJson(json);

  @override
  final Details? details;
  @override
  final Location? location;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? installationDate;
  @override
  final String? status;
  @override
  final DateTime? lastUpdated;
  @override
  final AvailablePlugins? availablePlugins;
  @override
  final dynamic pointedTo;
  @override
  final String? reseller;
  @override
  final String? client;
  @override
  final String? project;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? streamingUrl;

  @override
  String toString() {
    return 'CctvCameraModel(details: $details, location: $location, id: $id, name: $name, installationDate: $installationDate, status: $status, lastUpdated: $lastUpdated, availablePlugins: $availablePlugins, pointedTo: $pointedTo, reseller: $reseller, client: $client, project: $project, createdAt: $createdAt, updatedAt: $updatedAt, streamingUrl: $streamingUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CctvCameraModel &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.installationDate, installationDate) ||
                other.installationDate == installationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.availablePlugins, availablePlugins) ||
                other.availablePlugins == availablePlugins) &&
            const DeepCollectionEquality().equals(other.pointedTo, pointedTo) &&
            (identical(other.reseller, reseller) ||
                other.reseller == reseller) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.streamingUrl, streamingUrl) ||
                other.streamingUrl == streamingUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      details,
      location,
      id,
      name,
      installationDate,
      status,
      lastUpdated,
      availablePlugins,
      const DeepCollectionEquality().hash(pointedTo),
      reseller,
      client,
      project,
      createdAt,
      updatedAt,
      streamingUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CctvCameraModelCopyWith<_$_CctvCameraModel> get copyWith =>
      __$$_CctvCameraModelCopyWithImpl<_$_CctvCameraModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CctvCameraModelToJson(
      this,
    );
  }
}

abstract class _CctvCameraModel implements CctvCameraModel {
  const factory _CctvCameraModel(
      {final Details? details,
      final Location? location,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final String? installationDate,
      final String? status,
      final DateTime? lastUpdated,
      final AvailablePlugins? availablePlugins,
      final dynamic pointedTo,
      final String? reseller,
      final String? client,
      final String? project,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? streamingUrl}) = _$_CctvCameraModel;

  factory _CctvCameraModel.fromJson(Map<String, dynamic> json) =
      _$_CctvCameraModel.fromJson;

  @override
  Details? get details;
  @override
  Location? get location;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get installationDate;
  @override
  String? get status;
  @override
  DateTime? get lastUpdated;
  @override
  AvailablePlugins? get availablePlugins;
  @override
  dynamic get pointedTo;
  @override
  String? get reseller;
  @override
  String? get client;
  @override
  String? get project;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get streamingUrl;
  @override
  @JsonKey(ignore: true)
  _$$_CctvCameraModelCopyWith<_$_CctvCameraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailablePlugins _$AvailablePluginsFromJson(Map<String, dynamic> json) {
  return _AvailablePlugins.fromJson(json);
}

/// @nodoc
mixin _$AvailablePlugins {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailablePluginsCopyWith<$Res> {
  factory $AvailablePluginsCopyWith(
          AvailablePlugins value, $Res Function(AvailablePlugins) then) =
      _$AvailablePluginsCopyWithImpl<$Res, AvailablePlugins>;
}

/// @nodoc
class _$AvailablePluginsCopyWithImpl<$Res, $Val extends AvailablePlugins>
    implements $AvailablePluginsCopyWith<$Res> {
  _$AvailablePluginsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AvailablePluginsCopyWith<$Res> {
  factory _$$_AvailablePluginsCopyWith(
          _$_AvailablePlugins value, $Res Function(_$_AvailablePlugins) then) =
      __$$_AvailablePluginsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AvailablePluginsCopyWithImpl<$Res>
    extends _$AvailablePluginsCopyWithImpl<$Res, _$_AvailablePlugins>
    implements _$$_AvailablePluginsCopyWith<$Res> {
  __$$_AvailablePluginsCopyWithImpl(
      _$_AvailablePlugins _value, $Res Function(_$_AvailablePlugins) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_AvailablePlugins implements _AvailablePlugins {
  const _$_AvailablePlugins();

  factory _$_AvailablePlugins.fromJson(Map<String, dynamic> json) =>
      _$$_AvailablePluginsFromJson(json);

  @override
  String toString() {
    return 'AvailablePlugins()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AvailablePlugins);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvailablePluginsToJson(
      this,
    );
  }
}

abstract class _AvailablePlugins implements AvailablePlugins {
  const factory _AvailablePlugins() = _$_AvailablePlugins;

  factory _AvailablePlugins.fromJson(Map<String, dynamic> json) =
      _$_AvailablePlugins.fromJson;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String? get type => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  dynamic get unitId => throw _privateConstructorUsedError;
  dynamic get unitSecret => throw _privateConstructorUsedError;

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
      {String? type, String? version, dynamic unitId, dynamic unitSecret});
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
    Object? type = freezed,
    Object? version = freezed,
    Object? unitId = freezed,
    Object? unitSecret = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unitSecret: freezed == unitSecret
          ? _value.unitSecret
          : unitSecret // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
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
      {String? type, String? version, dynamic unitId, dynamic unitSecret});
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
    Object? type = freezed,
    Object? version = freezed,
    Object? unitId = freezed,
    Object? unitSecret = freezed,
  }) {
    return _then(_$_Details(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      unitSecret: freezed == unitSecret
          ? _value.unitSecret
          : unitSecret // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Details implements _Details {
  const _$_Details({this.type, this.version, this.unitId, this.unitSecret});

  factory _$_Details.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsFromJson(json);

  @override
  final String? type;
  @override
  final String? version;
  @override
  final dynamic unitId;
  @override
  final dynamic unitSecret;

  @override
  String toString() {
    return 'Details(type: $type, version: $version, unitId: $unitId, unitSecret: $unitSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Details &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.unitId, unitId) &&
            const DeepCollectionEquality()
                .equals(other.unitSecret, unitSecret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      version,
      const DeepCollectionEquality().hash(unitId),
      const DeepCollectionEquality().hash(unitSecret));

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
      {final String? type,
      final String? version,
      final dynamic unitId,
      final dynamic unitSecret}) = _$_Details;

  factory _Details.fromJson(Map<String, dynamic> json) = _$_Details.fromJson;

  @override
  String? get type;
  @override
  String? get version;
  @override
  dynamic get unitId;
  @override
  dynamic get unitSecret;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsCopyWith<_$_Details> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Location(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location({this.latitude, this.longitude});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String? latitude;
  @override
  final String? longitude;

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location({final String? latitude, final String? longitude}) =
      _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
