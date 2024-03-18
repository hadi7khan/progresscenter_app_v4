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
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get installationDate => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // DateTime? lastUpdated,
  String? get orientation => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  LatestImage? get latestImage => throw _privateConstructorUsedError;
  bool? get hasImages => throw _privateConstructorUsedError;
  List<String>? get enabledFeaturesList => throw _privateConstructorUsedError;

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
      {Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? status,
      String? orientation,
      String? project,
      LatestImage? latestImage,
      bool? hasImages,
      List<String>? enabledFeaturesList});

  $LocationCopyWith<$Res>? get location;
  $LatestImageCopyWith<$Res>? get latestImage;
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
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? status = freezed,
    Object? orientation = freezed,
    Object? project = freezed,
    Object? latestImage = freezed,
    Object? hasImages = freezed,
    Object? enabledFeaturesList = freezed,
  }) {
    return _then(_value.copyWith(
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
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      hasImages: freezed == hasImages
          ? _value.hasImages
          : hasImages // ignore: cast_nullable_to_non_nullable
              as bool?,
      enabledFeaturesList: freezed == enabledFeaturesList
          ? _value.enabledFeaturesList
          : enabledFeaturesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$_CameraModelCopyWith<$Res>
    implements $CameraModelCopyWith<$Res> {
  factory _$$_CameraModelCopyWith(
          _$_CameraModel value, $Res Function(_$_CameraModel) then) =
      __$$_CameraModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? installationDate,
      String? status,
      String? orientation,
      String? project,
      LatestImage? latestImage,
      bool? hasImages,
      List<String>? enabledFeaturesList});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $LatestImageCopyWith<$Res>? get latestImage;
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
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? installationDate = freezed,
    Object? status = freezed,
    Object? orientation = freezed,
    Object? project = freezed,
    Object? latestImage = freezed,
    Object? hasImages = freezed,
    Object? enabledFeaturesList = freezed,
  }) {
    return _then(_$_CameraModel(
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
      orientation: freezed == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      latestImage: freezed == latestImage
          ? _value.latestImage
          : latestImage // ignore: cast_nullable_to_non_nullable
              as LatestImage?,
      hasImages: freezed == hasImages
          ? _value.hasImages
          : hasImages // ignore: cast_nullable_to_non_nullable
              as bool?,
      enabledFeaturesList: freezed == enabledFeaturesList
          ? _value._enabledFeaturesList
          : enabledFeaturesList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CameraModel implements _CameraModel {
  const _$_CameraModel(
      {this.location = const Location(),
      @JsonKey(name: '_id') this.id,
      this.name = '',
      this.installationDate = '',
      this.status = '',
      this.orientation = '',
      this.project = '',
      this.latestImage = null,
      this.hasImages = false,
      final List<String>? enabledFeaturesList = const []})
      : _enabledFeaturesList = enabledFeaturesList;

  factory _$_CameraModel.fromJson(Map<String, dynamic> json) =>
      _$$_CameraModelFromJson(json);

  @override
  @JsonKey()
  final Location? location;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? installationDate;
  @override
  @JsonKey()
  final String? status;
// DateTime? lastUpdated,
  @override
  @JsonKey()
  final String? orientation;
  @override
  @JsonKey()
  final String? project;
  @override
  @JsonKey()
  final LatestImage? latestImage;
  @override
  @JsonKey()
  final bool? hasImages;
  final List<String>? _enabledFeaturesList;
  @override
  @JsonKey()
  List<String>? get enabledFeaturesList {
    final value = _enabledFeaturesList;
    if (value == null) return null;
    if (_enabledFeaturesList is EqualUnmodifiableListView)
      return _enabledFeaturesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CameraModel(location: $location, id: $id, name: $name, installationDate: $installationDate, status: $status, orientation: $orientation, project: $project, latestImage: $latestImage, hasImages: $hasImages, enabledFeaturesList: $enabledFeaturesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.installationDate, installationDate) ||
                other.installationDate == installationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.latestImage, latestImage) ||
                other.latestImage == latestImage) &&
            (identical(other.hasImages, hasImages) ||
                other.hasImages == hasImages) &&
            const DeepCollectionEquality()
                .equals(other._enabledFeaturesList, _enabledFeaturesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      id,
      name,
      installationDate,
      status,
      orientation,
      project,
      latestImage,
      hasImages,
      const DeepCollectionEquality().hash(_enabledFeaturesList));

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
      {final Location? location,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final String? installationDate,
      final String? status,
      final String? orientation,
      final String? project,
      final LatestImage? latestImage,
      final bool? hasImages,
      final List<String>? enabledFeaturesList}) = _$_CameraModel;

  factory _CameraModel.fromJson(Map<String, dynamic> json) =
      _$_CameraModel.fromJson;

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
  @override // DateTime? lastUpdated,
  String? get orientation;
  @override
  String? get project;
  @override
  LatestImage? get latestImage;
  @override
  bool? get hasImages;
  @override
  List<String>? get enabledFeaturesList;
  @override
  @JsonKey(ignore: true)
  _$$_CameraModelCopyWith<_$_CameraModel> get copyWith =>
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
      {this.resolution = const Resolution(),
      this.name = '',
      this.date = '',
      this.time = '',
      this.datetime = '',
      this.url4K = "",
      this.urlPreview = "",
      this.urlThumb = ""});

  factory _$_LatestImage.fromJson(Map<String, dynamic> json) =>
      _$$_LatestImageFromJson(json);

  @override
  @JsonKey()
  final Resolution? resolution;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? date;
  @override
  @JsonKey()
  final String? time;
  @override
  @JsonKey()
  final String? datetime;
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
    return 'LatestImage(resolution: $resolution, name: $name, date: $date, time: $time, datetime: $datetime, url4K: $url4K, urlPreview: $urlPreview, urlThumb: $urlThumb)';
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
            (identical(other.url4K, url4K) || other.url4K == url4K) &&
            (identical(other.urlPreview, urlPreview) ||
                other.urlPreview == urlPreview) &&
            (identical(other.urlThumb, urlThumb) ||
                other.urlThumb == urlThumb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resolution, name, date, time,
      datetime, url4K, urlPreview, urlThumb);

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
  const _$_Resolution({this.width = 0, this.height = 0});

  factory _$_Resolution.fromJson(Map<String, dynamic> json) =>
      _$$_ResolutionFromJson(json);

  @override
  @JsonKey()
  final int? width;
  @override
  @JsonKey()
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
  const _$_Location({this.latitude = '', this.longitude = ''});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  @JsonKey()
  final String? latitude;
  @override
  @JsonKey()
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
