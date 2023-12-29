// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_by_camera_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImagesByCameraIdModel _$ImagesByCameraIdModelFromJson(
    Map<String, dynamic> json) {
  return _ImagesByCameraIdModel.fromJson(json);
}

/// @nodoc
mixin _$ImagesByCameraIdModel {
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  Image? get currentImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesByCameraIdModelCopyWith<ImagesByCameraIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesByCameraIdModelCopyWith<$Res> {
  factory $ImagesByCameraIdModelCopyWith(ImagesByCameraIdModel value,
          $Res Function(ImagesByCameraIdModel) then) =
      _$ImagesByCameraIdModelCopyWithImpl<$Res, ImagesByCameraIdModel>;
  @useResult
  $Res call(
      {String? startDate,
      String? endDate,
      List<Image>? images,
      Image? currentImage});

  $ImageCopyWith<$Res>? get currentImage;
}

/// @nodoc
class _$ImagesByCameraIdModelCopyWithImpl<$Res,
        $Val extends ImagesByCameraIdModel>
    implements $ImagesByCameraIdModelCopyWith<$Res> {
  _$ImagesByCameraIdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? images = freezed,
    Object? currentImage = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get currentImage {
    if (_value.currentImage == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.currentImage!, (value) {
      return _then(_value.copyWith(currentImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImagesByCameraIdModelCopyWith<$Res>
    implements $ImagesByCameraIdModelCopyWith<$Res> {
  factory _$$_ImagesByCameraIdModelCopyWith(_$_ImagesByCameraIdModel value,
          $Res Function(_$_ImagesByCameraIdModel) then) =
      __$$_ImagesByCameraIdModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startDate,
      String? endDate,
      List<Image>? images,
      Image? currentImage});

  @override
  $ImageCopyWith<$Res>? get currentImage;
}

/// @nodoc
class __$$_ImagesByCameraIdModelCopyWithImpl<$Res>
    extends _$ImagesByCameraIdModelCopyWithImpl<$Res, _$_ImagesByCameraIdModel>
    implements _$$_ImagesByCameraIdModelCopyWith<$Res> {
  __$$_ImagesByCameraIdModelCopyWithImpl(_$_ImagesByCameraIdModel _value,
      $Res Function(_$_ImagesByCameraIdModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? images = freezed,
    Object? currentImage = freezed,
  }) {
    return _then(_$_ImagesByCameraIdModel(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagesByCameraIdModel implements _ImagesByCameraIdModel {
  const _$_ImagesByCameraIdModel(
      {this.startDate,
      this.endDate,
      final List<Image>? images,
      this.currentImage})
      : _images = images;

  factory _$_ImagesByCameraIdModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesByCameraIdModelFromJson(json);

  @override
  final String? startDate;
  @override
  final String? endDate;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Image? currentImage;

  @override
  String toString() {
    return 'ImagesByCameraIdModel(startDate: $startDate, endDate: $endDate, images: $images, currentImage: $currentImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesByCameraIdModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.currentImage, currentImage) ||
                other.currentImage == currentImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate,
      const DeepCollectionEquality().hash(_images), currentImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesByCameraIdModelCopyWith<_$_ImagesByCameraIdModel> get copyWith =>
      __$$_ImagesByCameraIdModelCopyWithImpl<_$_ImagesByCameraIdModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagesByCameraIdModelToJson(
      this,
    );
  }
}

abstract class _ImagesByCameraIdModel implements ImagesByCameraIdModel {
  const factory _ImagesByCameraIdModel(
      {final String? startDate,
      final String? endDate,
      final List<Image>? images,
      final Image? currentImage}) = _$_ImagesByCameraIdModel;

  factory _ImagesByCameraIdModel.fromJson(Map<String, dynamic> json) =
      _$_ImagesByCameraIdModel.fromJson;

  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  List<Image>? get images;
  @override
  Image? get currentImage;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesByCameraIdModelCopyWith<_$_ImagesByCameraIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  Resolution? get resolution => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get datetime => throw _privateConstructorUsedError;
  String? get camera => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  String? get urlThumb => throw _privateConstructorUsedError;
  String? get urlPreview => throw _privateConstructorUsedError;
  String? get url4K => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {Resolution? resolution,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? date,
      String? time,
      String? datetime,
      String? camera,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? imageId,
      String? urlThumb,
      String? urlPreview,
      String? url4K});

  $ResolutionCopyWith<$Res>? get resolution;
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolution = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? datetime = freezed,
    Object? camera = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageId = freezed,
    Object? urlThumb = freezed,
    Object? urlPreview = freezed,
    Object? url4K = freezed,
  }) {
    return _then(_value.copyWith(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumb: freezed == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlPreview: freezed == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      url4K: freezed == url4K
          ? _value.url4K
          : url4K // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Resolution? resolution,
      @JsonKey(name: '_id') String? id,
      String? name,
      String? date,
      String? time,
      String? datetime,
      String? camera,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? imageId,
      String? urlThumb,
      String? urlPreview,
      String? url4K});

  @override
  $ResolutionCopyWith<$Res>? get resolution;
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resolution = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? datetime = freezed,
    Object? camera = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? imageId = freezed,
    Object? urlThumb = freezed,
    Object? urlPreview = freezed,
    Object? url4K = freezed,
  }) {
    return _then(_$_Image(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as Resolution?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      urlThumb: freezed == urlThumb
          ? _value.urlThumb
          : urlThumb // ignore: cast_nullable_to_non_nullable
              as String?,
      urlPreview: freezed == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      url4K: freezed == url4K
          ? _value.url4K
          : url4K // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image(
      {this.resolution,
      @JsonKey(name: '_id') this.id,
      this.name,
      this.date,
      this.time,
      this.datetime,
      this.camera,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.urlThumb,
      this.urlPreview,
      this.url4K});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final Resolution? resolution;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? datetime;
  @override
  final String? camera;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? imageId;
  @override
  final String? urlThumb;
  @override
  final String? urlPreview;
  @override
  final String? url4K;

  @override
  String toString() {
    return 'Image(resolution: $resolution, id: $id, name: $name, date: $date, time: $time, datetime: $datetime, camera: $camera, createdAt: $createdAt, updatedAt: $updatedAt, imageId: $imageId, urlThumb: $urlThumb, urlPreview: $urlPreview, url4K: $url4K)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.urlThumb, urlThumb) ||
                other.urlThumb == urlThumb) &&
            (identical(other.urlPreview, urlPreview) ||
                other.urlPreview == urlPreview) &&
            (identical(other.url4K, url4K) || other.url4K == url4K));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resolution,
      id,
      name,
      date,
      time,
      datetime,
      camera,
      createdAt,
      updatedAt,
      imageId,
      urlThumb,
      urlPreview,
      url4K);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {final Resolution? resolution,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final String? date,
      final String? time,
      final String? datetime,
      final String? camera,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? imageId,
      final String? urlThumb,
      final String? urlPreview,
      final String? url4K}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  Resolution? get resolution;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get date;
  @override
  String? get time;
  @override
  String? get datetime;
  @override
  String? get camera;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get imageId;
  @override
  String? get urlThumb;
  @override
  String? get urlPreview;
  @override
  String? get url4K;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
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
