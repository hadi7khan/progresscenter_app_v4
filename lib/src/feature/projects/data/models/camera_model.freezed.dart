// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CameraModel _$CameraModelFromJson(Map<String, dynamic> json) {
  return _CameraModel.fromJson(json);
}

/// @nodoc
mixin _$CameraModel {
  Details? get details => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get installationDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  String? get orientation => throw _privateConstructorUsedError;
  dynamic get pointedTo => throw _privateConstructorUsedError;
  String? get reseller => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  LatestImage? get latestImage => throw _privateConstructorUsedError;
  List<String>? get enabledFeaturesList => throw _privateConstructorUsedError;
  bool? get hasImages => throw _privateConstructorUsedError;
  String? get cameraModelId => throw _privateConstructorUsedError;
  EnabledFeatures? get enabledFeatures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CameraModelCopyWith<CameraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraModelCopyWith<$Res> {
  factory $CameraModelCopyWith(
          CameraModel value, $Res Function(CameraModel) then) =
      _$CameraModelCopyWithImpl<$Res, CameraModel>;
  @useResult
  $Res call(
      {Details? details,
      Location? location,
      String? id,
      String? name,
      String? installationDate,
      String? status,
      DateTime? lastUpdated,
      String? orientation,
      dynamic pointedTo,
      String? reseller,
      String? client,
      String? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      LatestImage? latestImage,
      List<String>? enabledFeaturesList,
      bool? hasImages,
      String? cameraModelId,
      EnabledFeatures? enabledFeatures});

  $DetailsCopyWith<$Res>? get details;
  $LocationCopyWith<$Res>? get location;
  $LatestImageCopyWith<$Res>? get latestImage;
  $EnabledFeaturesCopyWith<$Res>? get enabledFeatures;
}

/// @nodoc
class _$CameraModelCopyWithImpl<$Res, $Val extends CameraModel>
    implements $CameraModelCopyWith<$Res> {
  _$CameraModelCopyWithImpl(this._value, this._then);

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
    Object? orientation = freezed,
    Object? pointedTo = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? latestImage = freezed,
    Object? enabledFeaturesList = freezed,
    Object? hasImages = freezed,
    Object? cameraModelId = freezed,
    Object? enabledFeatures = freezed,
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
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as String?,
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
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      enabledFeaturesList: freezed == enabledFeaturesList
          ? _value.enabledFeaturesList
          : enabledFeaturesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasImages: freezed == hasImages
          ? _value.hasImages
          : hasImages // ignore: cast_nullable_to_non_nullable
              as bool?,
      cameraModelId: freezed == cameraModelId
          ? _value.cameraModelId
          : cameraModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledFeatures: freezed == enabledFeatures
          ? _value.enabledFeatures
          : enabledFeatures // ignore: cast_nullable_to_non_nullable
              as EnabledFeatures?,
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
  $LatestImageCopyWith<$Res>? get latestImage {
    if (_value.latestImage == null) {
      return null;
    }

    return $LatestImageCopyWith<$Res>(_value.latestImage!, (value) {
      return _then(_value.copyWith(latestImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EnabledFeaturesCopyWith<$Res>? get enabledFeatures {
    if (_value.enabledFeatures == null) {
      return null;
    }

    return $EnabledFeaturesCopyWith<$Res>(_value.enabledFeatures!, (value) {
      return _then(_value.copyWith(enabledFeatures: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CameraModelCopyWith<$Res>
    implements $CameraModelCopyWith<$Res> {
  factory _$$_CameraModelCopyWith(
          _$_CameraModel value, $Res Function(_$_CameraModel) then) =
      __$$_CameraModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Details? details,
      Location? location,
      String? id,
      String? name,
      String? installationDate,
      String? status,
      DateTime? lastUpdated,
      String? orientation,
      dynamic pointedTo,
      String? reseller,
      String? client,
      String? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      LatestImage? latestImage,
      List<String>? enabledFeaturesList,
      bool? hasImages,
      String? cameraModelId,
      EnabledFeatures? enabledFeatures});

  @override
  $DetailsCopyWith<$Res>? get details;
  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $LatestImageCopyWith<$Res>? get latestImage;
  @override
  $EnabledFeaturesCopyWith<$Res>? get enabledFeatures;
}

/// @nodoc
class __$$_CameraModelCopyWithImpl<$Res>
    extends _$CameraModelCopyWithImpl<$Res, _$_CameraModel>
    implements _$$_CameraModelCopyWith<$Res> {
  __$$_CameraModelCopyWithImpl(
      _$_CameraModel _value, $Res Function(_$_CameraModel) _then)
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
    Object? orientation = freezed,
    Object? pointedTo = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? latestImage = freezed,
    Object? enabledFeaturesList = freezed,
    Object? hasImages = freezed,
    Object? cameraModelId = freezed,
    Object? enabledFeatures = freezed,
  }) {
    return _then(_$_CameraModel(
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
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as String?,
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
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      enabledFeaturesList: freezed == enabledFeaturesList
          ? _value._enabledFeaturesList
          : enabledFeaturesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hasImages: freezed == hasImages
          ? _value.hasImages
          : hasImages // ignore: cast_nullable_to_non_nullable
              as bool?,
      cameraModelId: freezed == cameraModelId
          ? _value.cameraModelId
          : cameraModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledFeatures: freezed == enabledFeatures
          ? _value.enabledFeatures
          : enabledFeatures // ignore: cast_nullable_to_non_nullable
              as EnabledFeatures?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CameraModel implements _CameraModel {
  const _$_CameraModel(
      {this.details,
      this.location,
      this.id,
      this.name,
      this.installationDate,
      this.status,
      this.lastUpdated,
      this.orientation,
      this.pointedTo,
      this.reseller,
      this.client,
      this.project,
      this.createdAt,
      this.updatedAt,
      this.latestImage,
      final List<String>? enabledFeaturesList,
      this.hasImages,
      this.cameraModelId,
      this.enabledFeatures})
      : _enabledFeaturesList = enabledFeaturesList;

  factory _$_CameraModel.fromJson(Map<String, dynamic> json) =>
      _$$_CameraModelFromJson(json);

  @override
  final Details? details;
  @override
  final Location? location;
  @override
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
  final String? orientation;
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
  final LatestImage? latestImage;
  final List<String>? _enabledFeaturesList;
  @override
  List<String>? get enabledFeaturesList {
    final value = _enabledFeaturesList;
    if (value == null) return null;
    if (_enabledFeaturesList is EqualUnmodifiableListView)
      return _enabledFeaturesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? hasImages;
  @override
  final String? cameraModelId;
  @override
  final EnabledFeatures? enabledFeatures;

  @override
  String toString() {
    return 'CameraModel(details: $details, location: $location, id: $id, name: $name, installationDate: $installationDate, status: $status, lastUpdated: $lastUpdated, orientation: $orientation, pointedTo: $pointedTo, reseller: $reseller, client: $client, project: $project, createdAt: $createdAt, updatedAt: $updatedAt, latestImage: $latestImage, enabledFeaturesList: $enabledFeaturesList, hasImages: $hasImages, cameraModelId: $cameraModelId, enabledFeatures: $enabledFeatures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraModel &&
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
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            const DeepCollectionEquality().equals(other.pointedTo, pointedTo) &&
            (identical(other.reseller, reseller) ||
                other.reseller == reseller) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.latestImage, latestImage) ||
                other.latestImage == latestImage) &&
            const DeepCollectionEquality()
                .equals(other._enabledFeaturesList, _enabledFeaturesList) &&
            (identical(other.hasImages, hasImages) ||
                other.hasImages == hasImages) &&
            (identical(other.cameraModelId, cameraModelId) ||
                other.cameraModelId == cameraModelId) &&
            (identical(other.enabledFeatures, enabledFeatures) ||
                other.enabledFeatures == enabledFeatures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        details,
        location,
        id,
        name,
        installationDate,
        status,
        lastUpdated,
        orientation,
        const DeepCollectionEquality().hash(pointedTo),
        reseller,
        client,
        project,
        createdAt,
        updatedAt,
        latestImage,
        const DeepCollectionEquality().hash(_enabledFeaturesList),
        hasImages,
        cameraModelId,
        enabledFeatures
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraModelCopyWith<_$_CameraModel> get copyWith =>
      __$$_CameraModelCopyWithImpl<_$_CameraModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CameraModelToJson(
      this,
    );
  }
}

abstract class _CameraModel implements CameraModel {
  const factory _CameraModel(
      {final Details? details,
      final Location? location,
      final String? id,
      final String? name,
      final String? installationDate,
      final String? status,
      final DateTime? lastUpdated,
      final String? orientation,
      final dynamic pointedTo,
      final String? reseller,
      final String? client,
      final String? project,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final LatestImage? latestImage,
      final List<String>? enabledFeaturesList,
      final bool? hasImages,
      final String? cameraModelId,
      final EnabledFeatures? enabledFeatures}) = _$_CameraModel;

  factory _CameraModel.fromJson(Map<String, dynamic> json) =
      _$_CameraModel.fromJson;

  @override
  Details? get details;
  @override
  Location? get location;
  @override
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
  String? get orientation;
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
  LatestImage? get latestImage;
  @override
  List<String>? get enabledFeaturesList;
  @override
  bool? get hasImages;
  @override
  String? get cameraModelId;
  @override
  EnabledFeatures? get enabledFeatures;
  @override
  @JsonKey(ignore: true)
  _$$_CameraModelCopyWith<_$_CameraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String? get type => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get unitId => throw _privateConstructorUsedError;
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
      {String? type, String? version, String? unitId, dynamic unitSecret});
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
              as String?,
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
      {String? type, String? version, String? unitId, dynamic unitSecret});
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
              as String?,
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
  final String? unitId;
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
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            const DeepCollectionEquality()
                .equals(other.unitSecret, unitSecret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, version, unitId,
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
      final String? unitId,
      final dynamic unitSecret}) = _$_Details;

  factory _Details.fromJson(Map<String, dynamic> json) = _$_Details.fromJson;

  @override
  String? get type;
  @override
  String? get version;
  @override
  String? get unitId;
  @override
  dynamic get unitSecret;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsCopyWith<_$_Details> get copyWith =>
      throw _privateConstructorUsedError;
}

EnabledFeatures _$EnabledFeaturesFromJson(Map<String, dynamic> json) {
  return _EnabledFeatures.fromJson(json);
}

/// @nodoc
mixin _$EnabledFeatures {
  Ai? get ai => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnabledFeaturesCopyWith<EnabledFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnabledFeaturesCopyWith<$Res> {
  factory $EnabledFeaturesCopyWith(
          EnabledFeatures value, $Res Function(EnabledFeatures) then) =
      _$EnabledFeaturesCopyWithImpl<$Res, EnabledFeatures>;
  @useResult
  $Res call({Ai? ai});

  $AiCopyWith<$Res>? get ai;
}

/// @nodoc
class _$EnabledFeaturesCopyWithImpl<$Res, $Val extends EnabledFeatures>
    implements $EnabledFeaturesCopyWith<$Res> {
  _$EnabledFeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ai = freezed,
  }) {
    return _then(_value.copyWith(
      ai: freezed == ai
          ? _value.ai
          : ai // ignore: cast_nullable_to_non_nullable
              as Ai?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AiCopyWith<$Res>? get ai {
    if (_value.ai == null) {
      return null;
    }

    return $AiCopyWith<$Res>(_value.ai!, (value) {
      return _then(_value.copyWith(ai: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EnabledFeaturesCopyWith<$Res>
    implements $EnabledFeaturesCopyWith<$Res> {
  factory _$$_EnabledFeaturesCopyWith(
          _$_EnabledFeatures value, $Res Function(_$_EnabledFeatures) then) =
      __$$_EnabledFeaturesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ai? ai});

  @override
  $AiCopyWith<$Res>? get ai;
}

/// @nodoc
class __$$_EnabledFeaturesCopyWithImpl<$Res>
    extends _$EnabledFeaturesCopyWithImpl<$Res, _$_EnabledFeatures>
    implements _$$_EnabledFeaturesCopyWith<$Res> {
  __$$_EnabledFeaturesCopyWithImpl(
      _$_EnabledFeatures _value, $Res Function(_$_EnabledFeatures) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ai = freezed,
  }) {
    return _then(_$_EnabledFeatures(
      ai: freezed == ai
          ? _value.ai
          : ai // ignore: cast_nullable_to_non_nullable
              as Ai?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnabledFeatures implements _EnabledFeatures {
  const _$_EnabledFeatures({this.ai});

  factory _$_EnabledFeatures.fromJson(Map<String, dynamic> json) =>
      _$$_EnabledFeaturesFromJson(json);

  @override
  final Ai? ai;

  @override
  String toString() {
    return 'EnabledFeatures(ai: $ai)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnabledFeatures &&
            (identical(other.ai, ai) || other.ai == ai));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ai);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnabledFeaturesCopyWith<_$_EnabledFeatures> get copyWith =>
      __$$_EnabledFeaturesCopyWithImpl<_$_EnabledFeatures>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnabledFeaturesToJson(
      this,
    );
  }
}

abstract class _EnabledFeatures implements EnabledFeatures {
  const factory _EnabledFeatures({final Ai? ai}) = _$_EnabledFeatures;

  factory _EnabledFeatures.fromJson(Map<String, dynamic> json) =
      _$_EnabledFeatures.fromJson;

  @override
  Ai? get ai;
  @override
  @JsonKey(ignore: true)
  _$$_EnabledFeaturesCopyWith<_$_EnabledFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

Ai _$AiFromJson(Map<String, dynamic> json) {
  return _Ai.fromJson(json);
}

/// @nodoc
mixin _$Ai {
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiCopyWith<Ai> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiCopyWith<$Res> {
  factory $AiCopyWith(Ai value, $Res Function(Ai) then) =
      _$AiCopyWithImpl<$Res, Ai>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$AiCopyWithImpl<$Res, $Val extends Ai> implements $AiCopyWith<$Res> {
  _$AiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AiCopyWith<$Res> implements $AiCopyWith<$Res> {
  factory _$$_AiCopyWith(_$_Ai value, $Res Function(_$_Ai) then) =
      __$$_AiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$_AiCopyWithImpl<$Res> extends _$AiCopyWithImpl<$Res, _$_Ai>
    implements _$$_AiCopyWith<$Res> {
  __$$_AiCopyWithImpl(_$_Ai _value, $Res Function(_$_Ai) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_Ai(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ai implements _Ai {
  const _$_Ai({this.id});

  factory _$_Ai.fromJson(Map<String, dynamic> json) => _$$_AiFromJson(json);

  @override
  final String? id;

  @override
  String toString() {
    return 'Ai(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ai &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiCopyWith<_$_Ai> get copyWith =>
      __$$_AiCopyWithImpl<_$_Ai>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiToJson(
      this,
    );
  }
}

abstract class _Ai implements Ai {
  const factory _Ai({final String? id}) = _$_Ai;

  factory _Ai.fromJson(Map<String, dynamic> json) = _$_Ai.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_AiCopyWith<_$_Ai> get copyWith => throw _privateConstructorUsedError;
}

LatestImage _$LatestImageFromJson(Map<String, dynamic> json) {
  return _LatestImage.fromJson(json);
}

/// @nodoc
mixin _$LatestImage {
  Resolution? get resolution => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get datetime => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get url4K => throw _privateConstructorUsedError;
  String get urlPreview => throw _privateConstructorUsedError;
  String get urlThumb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestImageCopyWith<LatestImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestImageCopyWith<$Res> {
  factory $LatestImageCopyWith(
          LatestImage value, $Res Function(LatestImage) then) =
      _$LatestImageCopyWithImpl<$Res, LatestImage>;
  @useResult
  $Res call(
      {Resolution? resolution,
      String? name,
      String? date,
      String? time,
      String? datetime,
      DateTime? createdAt,
      DateTime? updatedAt,
      String url4K,
      String urlPreview,
      String urlThumb});

  $ResolutionCopyWith<$Res>? get resolution;
}

/// @nodoc
class _$LatestImageCopyWithImpl<$Res, $Val extends LatestImage>
    implements $LatestImageCopyWith<$Res> {
  _$LatestImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolution = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? datetime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url4K = null,
    Object? urlPreview = null,
    Object? urlThumb = null,
  }) {
    return _then(_value.copyWith(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url4K: null == url4K
          ? _value.url4K
          : url4K // ignore: cast_nullable_to_non_nullable
              as String,
      urlPreview: null == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String,
      urlThumb: null == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResolutionCopyWith<$Res>? get resolution {
    if (_value.resolution == null) {
      return null;
    }

    return $ResolutionCopyWith<$Res>(_value.resolution!, (value) {
      return _then(_value.copyWith(resolution: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LatestImageCopyWith<$Res>
    implements $LatestImageCopyWith<$Res> {
  factory _$$_LatestImageCopyWith(
          _$_LatestImage value, $Res Function(_$_LatestImage) then) =
      __$$_LatestImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Resolution? resolution,
      String? name,
      String? date,
      String? time,
      String? datetime,
      DateTime? createdAt,
      DateTime? updatedAt,
      String url4K,
      String urlPreview,
      String urlThumb});

  @override
  $ResolutionCopyWith<$Res>? get resolution;
}

/// @nodoc
class __$$_LatestImageCopyWithImpl<$Res>
    extends _$LatestImageCopyWithImpl<$Res, _$_LatestImage>
    implements _$$_LatestImageCopyWith<$Res> {
  __$$_LatestImageCopyWithImpl(
      _$_LatestImage _value, $Res Function(_$_LatestImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolution = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? datetime = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url4K = null,
    Object? urlPreview = null,
    Object? urlThumb = null,
  }) {
    return _then(_$_LatestImage(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url4K: null == url4K
          ? _value.url4K
          : url4K // ignore: cast_nullable_to_non_nullable
              as String,
      urlPreview: null == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String,
      urlThumb: null == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatestImage implements _LatestImage {
  const _$_LatestImage(
      {this.resolution,
      this.name,
      this.date,
      this.time,
      this.datetime,
      this.createdAt,
      this.updatedAt,
      this.url4K = "",
      this.urlPreview = "",
      this.urlThumb = ""});

  factory _$_LatestImage.fromJson(Map<String, dynamic> json) =>
      _$$_LatestImageFromJson(json);

  @override
  final Resolution? resolution;
  @override
  final String? name;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? datetime;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final String url4K;
  @override
  @JsonKey()
  final String urlPreview;
  @override
  @JsonKey()
  final String urlThumb;

  @override
  String toString() {
    return 'LatestImage(resolution: $resolution, name: $name, date: $date, time: $time, datetime: $datetime, createdAt: $createdAt, updatedAt: $updatedAt, url4K: $url4K, urlPreview: $urlPreview, urlThumb: $urlThumb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatestImage &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url4K, url4K) || other.url4K == url4K) &&
            (identical(other.urlPreview, urlPreview) ||
                other.urlPreview == urlPreview) &&
            (identical(other.urlThumb, urlThumb) ||
                other.urlThumb == urlThumb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resolution, name, date, time,
      datetime, createdAt, updatedAt, url4K, urlPreview, urlThumb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatestImageCopyWith<_$_LatestImage> get copyWith =>
      __$$_LatestImageCopyWithImpl<_$_LatestImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatestImageToJson(
      this,
    );
  }
}

abstract class _LatestImage implements LatestImage {
  const factory _LatestImage(
      {final Resolution? resolution,
      final String? name,
      final String? date,
      final String? time,
      final String? datetime,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String url4K,
      final String urlPreview,
      final String urlThumb}) = _$_LatestImage;

  factory _LatestImage.fromJson(Map<String, dynamic> json) =
      _$_LatestImage.fromJson;

  @override
  Resolution? get resolution;
  @override
  String? get name;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get datetime;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String get url4K;
  @override
  String get urlPreview;
  @override
  String get urlThumb;
  @override
  @JsonKey(ignore: true)
  _$$_LatestImageCopyWith<_$_LatestImage> get copyWith =>
      throw _privateConstructorUsedError;
}

Resolution _$ResolutionFromJson(Map<String, dynamic> json) {
  return _Resolution.fromJson(json);
}

/// @nodoc
mixin _$Resolution {
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResolutionCopyWith<Resolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResolutionCopyWith<$Res> {
  factory $ResolutionCopyWith(
          Resolution value, $Res Function(Resolution) then) =
      _$ResolutionCopyWithImpl<$Res, Resolution>;
  @useResult
  $Res call({int? width, int? height});
}

/// @nodoc
class _$ResolutionCopyWithImpl<$Res, $Val extends Resolution>
    implements $ResolutionCopyWith<$Res> {
  _$ResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResolutionCopyWith<$Res>
    implements $ResolutionCopyWith<$Res> {
  factory _$$_ResolutionCopyWith(
          _$_Resolution value, $Res Function(_$_Resolution) then) =
      __$$_ResolutionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? width, int? height});
}

/// @nodoc
class __$$_ResolutionCopyWithImpl<$Res>
    extends _$ResolutionCopyWithImpl<$Res, _$_Resolution>
    implements _$$_ResolutionCopyWith<$Res> {
  __$$_ResolutionCopyWithImpl(
      _$_Resolution _value, $Res Function(_$_Resolution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$_Resolution(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Resolution implements _Resolution {
  const _$_Resolution({this.width, this.height});

  factory _$_Resolution.fromJson(Map<String, dynamic> json) =>
      _$$_ResolutionFromJson(json);

  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'Resolution(width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Resolution &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResolutionCopyWith<_$_Resolution> get copyWith =>
      __$$_ResolutionCopyWithImpl<_$_Resolution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResolutionToJson(
      this,
    );
  }
}

abstract class _Resolution implements Resolution {
  const factory _Resolution({final int? width, final int? height}) =
      _$_Resolution;

  factory _Resolution.fromJson(Map<String, dynamic> json) =
      _$_Resolution.fromJson;

  @override
  int? get width;
  @override
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$_ResolutionCopyWith<_$_Resolution> get copyWith =>
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
