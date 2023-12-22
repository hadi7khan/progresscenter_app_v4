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
  Location? get location => throw _privateConstructorUsedError;
  dynamic get folderId => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  dynamic get camera => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get installationDate => throw _privateConstructorUsedError;
  String? get streamingUrl => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get reseller => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  String? get qLiveUnit => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  LatestImage? get latestImage => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      {Location? location,
      dynamic folderId,
      String? timezone,
      dynamic camera,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? streamingUrl,
      String? status,
      String? reseller,
      String? client,
      String? qLiveUnit,
      String? project,
      DateTime? createdAt,
      DateTime? lastUpdated,
      LatestImage? latestImage,
      DateTime? updatedAt});

  $LocationCopyWith<$Res>? get location;
  $LatestImageCopyWith<$Res>? get latestImage;
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
    Object? location = freezed,
    Object? folderId = freezed,
    Object? timezone = freezed,
    Object? camera = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? streamingUrl = freezed,
    Object? status = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? qLiveUnit = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? lastUpdated = freezed,
    Object? latestImage = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      streamingUrl: freezed == streamingUrl
          ? _value.streamingUrl
          : streamingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      qLiveUnit: freezed == qLiveUnit
          ? _value.qLiveUnit
          : qLiveUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
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
      {Location? location,
      dynamic folderId,
      String? timezone,
      dynamic camera,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? streamingUrl,
      String? status,
      String? reseller,
      String? client,
      String? qLiveUnit,
      String? project,
      DateTime? createdAt,
      DateTime? lastUpdated,
      LatestImage? latestImage,
      DateTime? updatedAt});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $LatestImageCopyWith<$Res>? get latestImage;
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
    Object? location = freezed,
    Object? folderId = freezed,
    Object? timezone = freezed,
    Object? camera = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? streamingUrl = freezed,
    Object? status = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? qLiveUnit = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? lastUpdated = freezed,
    Object? latestImage = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_CctvCameraModel(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      streamingUrl: freezed == streamingUrl
          ? _value.streamingUrl
          : streamingUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      qLiveUnit: freezed == qLiveUnit
          ? _value.qLiveUnit
          : qLiveUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CctvCameraModel implements _CctvCameraModel {
  const _$_CctvCameraModel(
      {this.location,
      this.folderId,
      this.timezone,
      this.camera,
      @JsonKey(name: '_id') this.id,
      this.name,
      this.installationDate,
      this.streamingUrl,
      this.status,
      this.reseller,
      this.client,
      this.qLiveUnit,
      this.project,
      this.createdAt,
      this.lastUpdated,
      this.latestImage,
      this.updatedAt});

  factory _$_CctvCameraModel.fromJson(Map<String, dynamic> json) =>
      _$$_CctvCameraModelFromJson(json);

  @override
  final Location? location;
  @override
  final dynamic folderId;
  @override
  final String? timezone;
  @override
  final dynamic camera;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? installationDate;
  @override
  final String? streamingUrl;
  @override
  final String? status;
  @override
  final String? reseller;
  @override
  final String? client;
  @override
  final String? qLiveUnit;
  @override
  final String? project;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastUpdated;
  @override
  final LatestImage? latestImage;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CctvCameraModel(location: $location, folderId: $folderId, timezone: $timezone, camera: $camera, id: $id, name: $name, installationDate: $installationDate, streamingUrl: $streamingUrl, status: $status, reseller: $reseller, client: $client, qLiveUnit: $qLiveUnit, project: $project, createdAt: $createdAt, lastUpdated: $lastUpdated, latestImage: $latestImage, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CctvCameraModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other.folderId, folderId) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(other.camera, camera) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.installationDate, installationDate) ||
                other.installationDate == installationDate) &&
            (identical(other.streamingUrl, streamingUrl) ||
                other.streamingUrl == streamingUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reseller, reseller) ||
                other.reseller == reseller) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.qLiveUnit, qLiveUnit) ||
                other.qLiveUnit == qLiveUnit) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.latestImage, latestImage) ||
                other.latestImage == latestImage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      const DeepCollectionEquality().hash(folderId),
      timezone,
      const DeepCollectionEquality().hash(camera),
      id,
      name,
      installationDate,
      streamingUrl,
      status,
      reseller,
      client,
      qLiveUnit,
      project,
      createdAt,
      lastUpdated,
      latestImage,
      updatedAt);

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
      {final Location? location,
      final dynamic folderId,
      final String? timezone,
      final dynamic camera,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final String? installationDate,
      final String? streamingUrl,
      final String? status,
      final String? reseller,
      final String? client,
      final String? qLiveUnit,
      final String? project,
      final DateTime? createdAt,
      final DateTime? lastUpdated,
      final LatestImage? latestImage,
      final DateTime? updatedAt}) = _$_CctvCameraModel;

  factory _CctvCameraModel.fromJson(Map<String, dynamic> json) =
      _$_CctvCameraModel.fromJson;

  @override
  Location? get location;
  @override
  dynamic get folderId;
  @override
  String? get timezone;
  @override
  dynamic get camera;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get installationDate;
  @override
  String? get streamingUrl;
  @override
  String? get status;
  @override
  String? get reseller;
  @override
  String? get client;
  @override
  String? get qLiveUnit;
  @override
  String? get project;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastUpdated;
  @override
  LatestImage? get latestImage;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CctvCameraModelCopyWith<_$_CctvCameraModel> get copyWith =>
      throw _privateConstructorUsedError;
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
  String? get url => throw _privateConstructorUsedError;

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
      String? url});

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
    Object? url = freezed,
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
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? url});

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
    Object? url = freezed,
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
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.url});

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
  final String? url;

  @override
  String toString() {
    return 'LatestImage(resolution: $resolution, name: $name, date: $date, time: $time, datetime: $datetime, createdAt: $createdAt, updatedAt: $updatedAt, url: $url)';
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
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resolution, name, date, time,
      datetime, createdAt, updatedAt, url);

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
      final String? url}) = _$_LatestImage;

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
  String? get url;
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
