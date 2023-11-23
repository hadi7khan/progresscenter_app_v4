// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_lean_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectLeanModel _$ProjectLeanModelFromJson(Map<String, dynamic> json) {
  return _ProjectLeanModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectLeanModel {
  Location get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Image> get images => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  bool get hasCameras => throw _privateConstructorUsedError;
  int get hierarchyLevel => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectLeanModelCopyWith<ProjectLeanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectLeanModelCopyWith<$Res> {
  factory $ProjectLeanModelCopyWith(
          ProjectLeanModel value, $Res Function(ProjectLeanModel) then) =
      _$ProjectLeanModelCopyWithImpl<$Res, ProjectLeanModel>;
  @useResult
  $Res call(
      {Location location,
      @JsonKey(name: '_id') String projectId,
      String name,
      List<Image> images,
      String status,
      String? parentId,
      bool hasCameras,
      int hierarchyLevel,
      String? coverImageUrl});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ProjectLeanModelCopyWithImpl<$Res, $Val extends ProjectLeanModel>
    implements $ProjectLeanModelCopyWith<$Res> {
  _$ProjectLeanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? projectId = null,
    Object? name = null,
    Object? images = null,
    Object? status = null,
    Object? parentId = freezed,
    Object? hasCameras = null,
    Object? hierarchyLevel = null,
    Object? coverImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCameras: null == hasCameras
          ? _value.hasCameras
          : hasCameras // ignore: cast_nullable_to_non_nullable
              as bool,
      hierarchyLevel: null == hierarchyLevel
          ? _value.hierarchyLevel
          : hierarchyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectLeanModelCopyWith<$Res>
    implements $ProjectLeanModelCopyWith<$Res> {
  factory _$$_ProjectLeanModelCopyWith(
          _$_ProjectLeanModel value, $Res Function(_$_ProjectLeanModel) then) =
      __$$_ProjectLeanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location location,
      @JsonKey(name: '_id') String projectId,
      String name,
      List<Image> images,
      String status,
      String? parentId,
      bool hasCameras,
      int hierarchyLevel,
      String? coverImageUrl});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_ProjectLeanModelCopyWithImpl<$Res>
    extends _$ProjectLeanModelCopyWithImpl<$Res, _$_ProjectLeanModel>
    implements _$$_ProjectLeanModelCopyWith<$Res> {
  __$$_ProjectLeanModelCopyWithImpl(
      _$_ProjectLeanModel _value, $Res Function(_$_ProjectLeanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? projectId = null,
    Object? name = null,
    Object? images = null,
    Object? status = null,
    Object? parentId = freezed,
    Object? hasCameras = null,
    Object? hierarchyLevel = null,
    Object? coverImageUrl = freezed,
  }) {
    return _then(_$_ProjectLeanModel(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCameras: null == hasCameras
          ? _value.hasCameras
          : hasCameras // ignore: cast_nullable_to_non_nullable
              as bool,
      hierarchyLevel: null == hierarchyLevel
          ? _value.hierarchyLevel
          : hierarchyLevel // ignore: cast_nullable_to_non_nullable
              as int,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectLeanModel implements _ProjectLeanModel {
  const _$_ProjectLeanModel(
      {required this.location,
      @JsonKey(name: '_id') required this.projectId,
      required this.name,
      required final List<Image> images,
      required this.status,
      required this.parentId,
      required this.hasCameras,
      required this.hierarchyLevel,
      required this.coverImageUrl})
      : _images = images;

  factory _$_ProjectLeanModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectLeanModelFromJson(json);

  @override
  final Location location;
  @override
  @JsonKey(name: '_id')
  final String projectId;
  @override
  final String name;
  final List<Image> _images;
  @override
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String status;
  @override
  final String? parentId;
  @override
  final bool hasCameras;
  @override
  final int hierarchyLevel;
  @override
  final String? coverImageUrl;

  @override
  String toString() {
    return 'ProjectLeanModel(location: $location, projectId: $projectId, name: $name, images: $images, status: $status, parentId: $parentId, hasCameras: $hasCameras, hierarchyLevel: $hierarchyLevel, coverImageUrl: $coverImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectLeanModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.hasCameras, hasCameras) ||
                other.hasCameras == hasCameras) &&
            (identical(other.hierarchyLevel, hierarchyLevel) ||
                other.hierarchyLevel == hierarchyLevel) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      projectId,
      name,
      const DeepCollectionEquality().hash(_images),
      status,
      parentId,
      hasCameras,
      hierarchyLevel,
      coverImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectLeanModelCopyWith<_$_ProjectLeanModel> get copyWith =>
      __$$_ProjectLeanModelCopyWithImpl<_$_ProjectLeanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectLeanModelToJson(
      this,
    );
  }
}

abstract class _ProjectLeanModel implements ProjectLeanModel {
  const factory _ProjectLeanModel(
      {required final Location location,
      @JsonKey(name: '_id') required final String projectId,
      required final String name,
      required final List<Image> images,
      required final String status,
      required final String? parentId,
      required final bool hasCameras,
      required final int hierarchyLevel,
      required final String? coverImageUrl}) = _$_ProjectLeanModel;

  factory _ProjectLeanModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectLeanModel.fromJson;

  @override
  Location get location;
  @override
  @JsonKey(name: '_id')
  String get projectId;
  @override
  String get name;
  @override
  List<Image> get images;
  @override
  String get status;
  @override
  String? get parentId;
  @override
  bool get hasCameras;
  @override
  int get hierarchyLevel;
  @override
  String? get coverImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectLeanModelCopyWith<_$_ProjectLeanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get imageId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
      {String name,
      @JsonKey(name: '_id') String imageId,
      DateTime createdAt,
      DateTime updatedAt});
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
    Object? name = null,
    Object? imageId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: '_id') String imageId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Image(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image(
      {required this.name,
      @JsonKey(name: '_id') required this.imageId,
      required this.createdAt,
      required this.updatedAt});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: '_id')
  final String imageId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Image(name: $name, imageId: $imageId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, imageId, createdAt, updatedAt);

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
      {required final String name,
      @JsonKey(name: '_id') required final String imageId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: '_id')
  String get imageId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get name => throw _privateConstructorUsedError;
  dynamic get latitude => throw _privateConstructorUsedError;
  dynamic get longitude => throw _privateConstructorUsedError;

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
  $Res call({String name, dynamic latitude, dynamic longitude});
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
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, dynamic latitude, dynamic longitude});
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
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Location(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_Location implements _Location {
  const _$_Location(
      {required this.name, required this.latitude, required this.longitude});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String name;
  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  @override
  String toString() {
    return 'Location(name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
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
  const factory _Location(
      {required final String name,
      required final dynamic latitude,
      required final dynamic longitude}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get name;
  @override
  dynamic get latitude;
  @override
  dynamic get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
