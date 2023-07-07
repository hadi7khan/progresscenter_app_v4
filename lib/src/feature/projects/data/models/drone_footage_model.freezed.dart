// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drone_footage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DroneFootageModel _$DroneFootageModelFromJson(Map<String, dynamic> json) {
  return _DroneFootageModel.fromJson(json);
}

/// @nodoc
mixin _$DroneFootageModel {
  Location? get location => throw _privateConstructorUsedError;
  Details? get details => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get takenAtDate => throw _privateConstructorUsedError;
  String? get takenAtTime => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  String? get reseller => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  Project? get project => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DroneFootageModelCopyWith<DroneFootageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DroneFootageModelCopyWith<$Res> {
  factory $DroneFootageModelCopyWith(
          DroneFootageModel value, $Res Function(DroneFootageModel) then) =
      _$DroneFootageModelCopyWithImpl<$Res, DroneFootageModel>;
  @useResult
  $Res call(
      {Location? location,
      Details? details,
      String? id,
      String? name,
      String? takenAtDate,
      String? takenAtTime,
      String? coverImage,
      String? reseller,
      String? client,
      Project? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url,
      String? coverImageUrl});

  $LocationCopyWith<$Res>? get location;
  $DetailsCopyWith<$Res>? get details;
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class _$DroneFootageModelCopyWithImpl<$Res, $Val extends DroneFootageModel>
    implements $DroneFootageModelCopyWith<$Res> {
  _$DroneFootageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? details = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? takenAtDate = freezed,
    Object? takenAtTime = freezed,
    Object? coverImage = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
    Object? coverImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAtDate: freezed == takenAtDate
          ? _value.takenAtDate
          : takenAtDate // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAtTime: freezed == takenAtTime
          ? _value.takenAtTime
          : takenAtTime // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as Project?,
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
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DroneFootageModelCopyWith<$Res>
    implements $DroneFootageModelCopyWith<$Res> {
  factory _$$_DroneFootageModelCopyWith(_$_DroneFootageModel value,
          $Res Function(_$_DroneFootageModel) then) =
      __$$_DroneFootageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location? location,
      Details? details,
      String? id,
      String? name,
      String? takenAtDate,
      String? takenAtTime,
      String? coverImage,
      String? reseller,
      String? client,
      Project? project,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url,
      String? coverImageUrl});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $DetailsCopyWith<$Res>? get details;
  @override
  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$_DroneFootageModelCopyWithImpl<$Res>
    extends _$DroneFootageModelCopyWithImpl<$Res, _$_DroneFootageModel>
    implements _$$_DroneFootageModelCopyWith<$Res> {
  __$$_DroneFootageModelCopyWithImpl(
      _$_DroneFootageModel _value, $Res Function(_$_DroneFootageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? details = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? takenAtDate = freezed,
    Object? takenAtTime = freezed,
    Object? coverImage = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? project = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
    Object? coverImageUrl = freezed,
  }) {
    return _then(_$_DroneFootageModel(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAtDate: freezed == takenAtDate
          ? _value.takenAtDate
          : takenAtDate // ignore: cast_nullable_to_non_nullable
              as String?,
      takenAtTime: freezed == takenAtTime
          ? _value.takenAtTime
          : takenAtTime // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as Project?,
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
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DroneFootageModel implements _DroneFootageModel {
  const _$_DroneFootageModel(
      {this.location,
      this.details,
      this.id,
      this.name,
      this.takenAtDate,
      this.takenAtTime,
      this.coverImage,
      this.reseller,
      this.client,
      this.project,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.coverImageUrl});

  factory _$_DroneFootageModel.fromJson(Map<String, dynamic> json) =>
      _$$_DroneFootageModelFromJson(json);

  @override
  final Location? location;
  @override
  final Details? details;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? takenAtDate;
  @override
  final String? takenAtTime;
  @override
  final String? coverImage;
  @override
  final String? reseller;
  @override
  final String? client;
  @override
  final Project? project;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? url;
  @override
  final String? coverImageUrl;

  @override
  String toString() {
    return 'DroneFootageModel(location: $location, details: $details, id: $id, name: $name, takenAtDate: $takenAtDate, takenAtTime: $takenAtTime, coverImage: $coverImage, reseller: $reseller, client: $client, project: $project, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, coverImageUrl: $coverImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DroneFootageModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.takenAtDate, takenAtDate) ||
                other.takenAtDate == takenAtDate) &&
            (identical(other.takenAtTime, takenAtTime) ||
                other.takenAtTime == takenAtTime) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.reseller, reseller) ||
                other.reseller == reseller) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      details,
      id,
      name,
      takenAtDate,
      takenAtTime,
      coverImage,
      reseller,
      client,
      project,
      createdAt,
      updatedAt,
      url,
      coverImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DroneFootageModelCopyWith<_$_DroneFootageModel> get copyWith =>
      __$$_DroneFootageModelCopyWithImpl<_$_DroneFootageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DroneFootageModelToJson(
      this,
    );
  }
}

abstract class _DroneFootageModel implements DroneFootageModel {
  const factory _DroneFootageModel(
      {final Location? location,
      final Details? details,
      final String? id,
      final String? name,
      final String? takenAtDate,
      final String? takenAtTime,
      final String? coverImage,
      final String? reseller,
      final String? client,
      final Project? project,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? url,
      final String? coverImageUrl}) = _$_DroneFootageModel;

  factory _DroneFootageModel.fromJson(Map<String, dynamic> json) =
      _$_DroneFootageModel.fromJson;

  @override
  Location? get location;
  @override
  Details? get details;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get takenAtDate;
  @override
  String? get takenAtTime;
  @override
  String? get coverImage;
  @override
  String? get reseller;
  @override
  String? get client;
  @override
  Project? get project;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get url;
  @override
  String? get coverImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_DroneFootageModelCopyWith<_$_DroneFootageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String? get resolution => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsCopyWith<Details> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsCopyWith<$Res> {
  factory $DetailsCopyWith(Details value, $Res Function(Details) then) =
      _$DetailsCopyWithImpl<$Res, Details>;
  @useResult
  $Res call({String? resolution, String? provider});
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
    Object? resolution = freezed,
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? resolution, String? provider});
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
    Object? resolution = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$_Details(
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Details implements _Details {
  const _$_Details({this.resolution, this.provider});

  factory _$_Details.fromJson(Map<String, dynamic> json) =>
      _$$_DetailsFromJson(json);

  @override
  final String? resolution;
  @override
  final String? provider;

  @override
  String toString() {
    return 'Details(resolution: $resolution, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Details &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resolution, provider);

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
  const factory _Details({final String? resolution, final String? provider}) =
      _$_Details;

  factory _Details.fromJson(Map<String, dynamic> json) = _$_Details.fromJson;

  @override
  String? get resolution;
  @override
  String? get provider;
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
  String? get name => throw _privateConstructorUsedError;
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
  $Res call({String? name, dynamic latitude, dynamic longitude});
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
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, dynamic latitude, dynamic longitude});
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
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Location(
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
class _$_Location implements _Location {
  const _$_Location({this.name, this.latitude, this.longitude});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String? name;
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
      {final String? name,
      final dynamic latitude,
      final dynamic longitude}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String? get name;
  @override
  dynamic get latitude;
  @override
  dynamic get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
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
