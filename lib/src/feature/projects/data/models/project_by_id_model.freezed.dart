// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_by_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectByIdModel _$ProjectByIdModelFromJson(Map<String, dynamic> json) {
  return _ProjectByIdModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectByIdModel {
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<Asset>? get assets => throw _privateConstructorUsedError;
  String? get activity => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  dynamic get parentId => throw _privateConstructorUsedError;
  bool? get hasCameras => throw _privateConstructorUsedError;
  int? get hierarchyLevel => throw _privateConstructorUsedError;
  String? get reseller => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  AiStats? get aiStats => throw _privateConstructorUsedError;
  int? get constructionDays => throw _privateConstructorUsedError;
  String? get projectByIdModelId => throw _privateConstructorUsedError;
  List<User>? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectByIdModelCopyWith<ProjectByIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectByIdModelCopyWith<$Res> {
  factory $ProjectByIdModelCopyWith(
          ProjectByIdModel value, $Res Function(ProjectByIdModel) then) =
      _$ProjectByIdModelCopyWithImpl<$Res, ProjectByIdModel>;
  @useResult
  $Res call(
      {Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      List<Image>? images,
      String? status,
      List<Asset>? assets,
      String? activity,
      DateTime? lastUpdated,
      dynamic parentId,
      bool? hasCameras,
      int? hierarchyLevel,
      String? reseller,
      String? client,
      DateTime? createdAt,
      DateTime? updatedAt,
      AiStats? aiStats,
      int? constructionDays,
      String? projectByIdModelId,
      List<User>? users});

  $LocationCopyWith<$Res>? get location;
  $AiStatsCopyWith<$Res>? get aiStats;
}

/// @nodoc
class _$ProjectByIdModelCopyWithImpl<$Res, $Val extends ProjectByIdModel>
    implements $ProjectByIdModelCopyWith<$Res> {
  _$ProjectByIdModelCopyWithImpl(this._value, this._then);

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
    Object? images = freezed,
    Object? status = freezed,
    Object? assets = freezed,
    Object? activity = freezed,
    Object? lastUpdated = freezed,
    Object? parentId = freezed,
    Object? hasCameras = freezed,
    Object? hierarchyLevel = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? aiStats = freezed,
    Object? constructionDays = freezed,
    Object? projectByIdModelId = freezed,
    Object? users = freezed,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      assets: freezed == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasCameras: freezed == hasCameras
          ? _value.hasCameras
          : hasCameras // ignore: cast_nullable_to_non_nullable
              as bool?,
      hierarchyLevel: freezed == hierarchyLevel
          ? _value.hierarchyLevel
          : hierarchyLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      aiStats: freezed == aiStats
          ? _value.aiStats
          : aiStats // ignore: cast_nullable_to_non_nullable
              as AiStats?,
      constructionDays: freezed == constructionDays
          ? _value.constructionDays
          : constructionDays // ignore: cast_nullable_to_non_nullable
              as int?,
      projectByIdModelId: freezed == projectByIdModelId
          ? _value.projectByIdModelId
          : projectByIdModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
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
  $AiStatsCopyWith<$Res>? get aiStats {
    if (_value.aiStats == null) {
      return null;
    }

    return $AiStatsCopyWith<$Res>(_value.aiStats!, (value) {
      return _then(_value.copyWith(aiStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectByIdModelCopyWith<$Res>
    implements $ProjectByIdModelCopyWith<$Res> {
  factory _$$_ProjectByIdModelCopyWith(
          _$_ProjectByIdModel value, $Res Function(_$_ProjectByIdModel) then) =
      __$$_ProjectByIdModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location? location,
      @JsonKey(name: '_id') String? id,
      String? name,
      List<Image>? images,
      String? status,
      List<Asset>? assets,
      String? activity,
      DateTime? lastUpdated,
      dynamic parentId,
      bool? hasCameras,
      int? hierarchyLevel,
      String? reseller,
      String? client,
      DateTime? createdAt,
      DateTime? updatedAt,
      AiStats? aiStats,
      int? constructionDays,
      String? projectByIdModelId,
      List<User>? users});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $AiStatsCopyWith<$Res>? get aiStats;
}

/// @nodoc
class __$$_ProjectByIdModelCopyWithImpl<$Res>
    extends _$ProjectByIdModelCopyWithImpl<$Res, _$_ProjectByIdModel>
    implements _$$_ProjectByIdModelCopyWith<$Res> {
  __$$_ProjectByIdModelCopyWithImpl(
      _$_ProjectByIdModel _value, $Res Function(_$_ProjectByIdModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? images = freezed,
    Object? status = freezed,
    Object? assets = freezed,
    Object? activity = freezed,
    Object? lastUpdated = freezed,
    Object? parentId = freezed,
    Object? hasCameras = freezed,
    Object? hierarchyLevel = freezed,
    Object? reseller = freezed,
    Object? client = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? aiStats = freezed,
    Object? constructionDays = freezed,
    Object? projectByIdModelId = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_ProjectByIdModel(
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
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      assets: freezed == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasCameras: freezed == hasCameras
          ? _value.hasCameras
          : hasCameras // ignore: cast_nullable_to_non_nullable
              as bool?,
      hierarchyLevel: freezed == hierarchyLevel
          ? _value.hierarchyLevel
          : hierarchyLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      reseller: freezed == reseller
          ? _value.reseller
          : reseller // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      aiStats: freezed == aiStats
          ? _value.aiStats
          : aiStats // ignore: cast_nullable_to_non_nullable
              as AiStats?,
      constructionDays: freezed == constructionDays
          ? _value.constructionDays
          : constructionDays // ignore: cast_nullable_to_non_nullable
              as int?,
      projectByIdModelId: freezed == projectByIdModelId
          ? _value.projectByIdModelId
          : projectByIdModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectByIdModel implements _ProjectByIdModel {
  const _$_ProjectByIdModel(
      {this.location,
      @JsonKey(name: '_id') this.id,
      this.name,
      final List<Image>? images,
      this.status,
      final List<Asset>? assets,
      this.activity,
      this.lastUpdated,
      this.parentId,
      this.hasCameras,
      this.hierarchyLevel,
      this.reseller,
      this.client,
      this.createdAt,
      this.updatedAt,
      this.aiStats,
      this.constructionDays,
      this.projectByIdModelId,
      final List<User>? users})
      : _images = images,
        _assets = assets,
        _users = users;

  factory _$_ProjectByIdModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectByIdModelFromJson(json);

  @override
  final Location? location;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
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
  final String? status;
  final List<Asset>? _assets;
  @override
  List<Asset>? get assets {
    final value = _assets;
    if (value == null) return null;
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? activity;
  @override
  final DateTime? lastUpdated;
  @override
  final dynamic parentId;
  @override
  final bool? hasCameras;
  @override
  final int? hierarchyLevel;
  @override
  final String? reseller;
  @override
  final String? client;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final AiStats? aiStats;
  @override
  final int? constructionDays;
  @override
  final String? projectByIdModelId;
  final List<User>? _users;
  @override
  List<User>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectByIdModel(location: $location, id: $id, name: $name, images: $images, status: $status, assets: $assets, activity: $activity, lastUpdated: $lastUpdated, parentId: $parentId, hasCameras: $hasCameras, hierarchyLevel: $hierarchyLevel, reseller: $reseller, client: $client, createdAt: $createdAt, updatedAt: $updatedAt, aiStats: $aiStats, constructionDays: $constructionDays, projectByIdModelId: $projectByIdModelId, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectByIdModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            (identical(other.hasCameras, hasCameras) ||
                other.hasCameras == hasCameras) &&
            (identical(other.hierarchyLevel, hierarchyLevel) ||
                other.hierarchyLevel == hierarchyLevel) &&
            (identical(other.reseller, reseller) ||
                other.reseller == reseller) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.aiStats, aiStats) || other.aiStats == aiStats) &&
            (identical(other.constructionDays, constructionDays) ||
                other.constructionDays == constructionDays) &&
            (identical(other.projectByIdModelId, projectByIdModelId) ||
                other.projectByIdModelId == projectByIdModelId) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        location,
        id,
        name,
        const DeepCollectionEquality().hash(_images),
        status,
        const DeepCollectionEquality().hash(_assets),
        activity,
        lastUpdated,
        const DeepCollectionEquality().hash(parentId),
        hasCameras,
        hierarchyLevel,
        reseller,
        client,
        createdAt,
        updatedAt,
        aiStats,
        constructionDays,
        projectByIdModelId,
        const DeepCollectionEquality().hash(_users)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectByIdModelCopyWith<_$_ProjectByIdModel> get copyWith =>
      __$$_ProjectByIdModelCopyWithImpl<_$_ProjectByIdModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectByIdModelToJson(
      this,
    );
  }
}

abstract class _ProjectByIdModel implements ProjectByIdModel {
  const factory _ProjectByIdModel(
      {final Location? location,
      @JsonKey(name: '_id') final String? id,
      final String? name,
      final List<Image>? images,
      final String? status,
      final List<Asset>? assets,
      final String? activity,
      final DateTime? lastUpdated,
      final dynamic parentId,
      final bool? hasCameras,
      final int? hierarchyLevel,
      final String? reseller,
      final String? client,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final AiStats? aiStats,
      final int? constructionDays,
      final String? projectByIdModelId,
      final List<User>? users}) = _$_ProjectByIdModel;

  factory _ProjectByIdModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectByIdModel.fromJson;

  @override
  Location? get location;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  List<Image>? get images;
  @override
  String? get status;
  @override
  List<Asset>? get assets;
  @override
  String? get activity;
  @override
  DateTime? get lastUpdated;
  @override
  dynamic get parentId;
  @override
  bool? get hasCameras;
  @override
  int? get hierarchyLevel;
  @override
  String? get reseller;
  @override
  String? get client;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  AiStats? get aiStats;
  @override
  int? get constructionDays;
  @override
  String? get projectByIdModelId;
  @override
  List<User>? get users;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectByIdModelCopyWith<_$_ProjectByIdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AiStats _$AiStatsFromJson(Map<String, dynamic> json) {
  return _AiStats.fromJson(json);
}

/// @nodoc
mixin _$AiStats {
  int? get activityScore => throw _privateConstructorUsedError;
  double? get ppeScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiStatsCopyWith<AiStats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiStatsCopyWith<$Res> {
  factory $AiStatsCopyWith(AiStats value, $Res Function(AiStats) then) =
      _$AiStatsCopyWithImpl<$Res, AiStats>;
  @useResult
  $Res call({int? activityScore, double? ppeScore});
}

/// @nodoc
class _$AiStatsCopyWithImpl<$Res, $Val extends AiStats>
    implements $AiStatsCopyWith<$Res> {
  _$AiStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityScore = freezed,
    Object? ppeScore = freezed,
  }) {
    return _then(_value.copyWith(
      activityScore: freezed == activityScore
          ? _value.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int?,
      ppeScore: freezed == ppeScore
          ? _value.ppeScore
          : ppeScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AiStatsCopyWith<$Res> implements $AiStatsCopyWith<$Res> {
  factory _$$_AiStatsCopyWith(
          _$_AiStats value, $Res Function(_$_AiStats) then) =
      __$$_AiStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? activityScore, double? ppeScore});
}

/// @nodoc
class __$$_AiStatsCopyWithImpl<$Res>
    extends _$AiStatsCopyWithImpl<$Res, _$_AiStats>
    implements _$$_AiStatsCopyWith<$Res> {
  __$$_AiStatsCopyWithImpl(_$_AiStats _value, $Res Function(_$_AiStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityScore = freezed,
    Object? ppeScore = freezed,
  }) {
    return _then(_$_AiStats(
      activityScore: freezed == activityScore
          ? _value.activityScore
          : activityScore // ignore: cast_nullable_to_non_nullable
              as int?,
      ppeScore: freezed == ppeScore
          ? _value.ppeScore
          : ppeScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AiStats implements _AiStats {
  const _$_AiStats({this.activityScore, this.ppeScore});

  factory _$_AiStats.fromJson(Map<String, dynamic> json) =>
      _$$_AiStatsFromJson(json);

  @override
  final int? activityScore;
  @override
  final double? ppeScore;

  @override
  String toString() {
    return 'AiStats(activityScore: $activityScore, ppeScore: $ppeScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiStats &&
            (identical(other.activityScore, activityScore) ||
                other.activityScore == activityScore) &&
            (identical(other.ppeScore, ppeScore) ||
                other.ppeScore == ppeScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, activityScore, ppeScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiStatsCopyWith<_$_AiStats> get copyWith =>
      __$$_AiStatsCopyWithImpl<_$_AiStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiStatsToJson(
      this,
    );
  }
}

abstract class _AiStats implements AiStats {
  const factory _AiStats({final int? activityScore, final double? ppeScore}) =
      _$_AiStats;

  factory _AiStats.fromJson(Map<String, dynamic> json) = _$_AiStats.fromJson;

  @override
  int? get activityScore;
  @override
  double? get ppeScore;
  @override
  @JsonKey(ignore: true)
  _$$_AiStatsCopyWith<_$_AiStats> get copyWith =>
      throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String? get name => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call({String? name, int? count});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$_AssetCopyWith(_$_Asset value, $Res Function(_$_Asset) then) =
      __$$_AssetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? count});
}

/// @nodoc
class __$$_AssetCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res, _$_Asset>
    implements _$$_AssetCopyWith<$Res> {
  __$$_AssetCopyWithImpl(_$_Asset _value, $Res Function(_$_Asset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_Asset(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Asset implements _Asset {
  const _$_Asset({this.name, this.count});

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  final String? name;
  @override
  final int? count;

  @override
  String toString() {
    return 'Asset(name: $name, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      __$$_AssetCopyWithImpl<_$_Asset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  const factory _Asset({final String? name, final int? count}) = _$_Asset;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  String? get name;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

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
      {String? name,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});
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
    Object? name = freezed,
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
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Image(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_Image implements _Image {
  const _$_Image(
      {this.name, this.id, this.createdAt, this.updatedAt, this.url});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final String? name;
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
    return 'Image(name: $name, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, id, createdAt, updatedAt, url);

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
      {final String? name,
      final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? url}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  String? get name;
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
  _$$_ImageCopyWith<_$_Image> get copyWith =>
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

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  Preset? get preset => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {Preset? preset,
      String? id,
      String? name,
      String? email,
      String? role,
      String? dp,
      String? userId,
      String? dpUrl});

  $PresetCopyWith<$Res>? get preset;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? email = freezed,
    Object? role = freezed,
    Object? dp = freezed,
    Object? userId = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preset? preset,
      String? id,
      String? name,
      String? email,
      String? role,
      String? dp,
      String? userId,
      String? dpUrl});

  @override
  $PresetCopyWith<$Res>? get preset;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? dp = freezed,
    Object? userId = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_$_User(
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
class _$_User implements _User {
  const _$_User(
      {this.preset,
      this.id,
      this.name,
      this.email,
      this.role,
      this.dp,
      this.userId,
      this.dpUrl});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final Preset? preset;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? role;
  @override
  final String? dp;
  @override
  final String? userId;
  @override
  final String? dpUrl;

  @override
  String toString() {
    return 'User(preset: $preset, id: $id, name: $name, email: $email, role: $role, dp: $dp, userId: $userId, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.preset, preset) || other.preset == preset) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, preset, id, name, email, role, dp, userId, dpUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final Preset? preset,
      final String? id,
      final String? name,
      final String? email,
      final String? role,
      final String? dp,
      final String? userId,
      final String? dpUrl}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  Preset? get preset;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get role;
  @override
  String? get dp;
  @override
  String? get userId;
  @override
  String? get dpUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
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
