// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<ProjectImage>? get images => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<Asset>? get assets => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  bool get hasCameras => throw _privateConstructorUsedError;
  int get hierarchyLevel => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  AiStats? get aiStats => throw _privateConstructorUsedError;
  int get constructionDays => throw _privateConstructorUsedError;
  List<User>? get users => throw _privateConstructorUsedError;
  List<ProjectModel>? get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {Location? location,
      @JsonKey(name: '_id') String id,
      String? name,
      List<ProjectImage>? images,
      String coverImageUrl,
      String status,
      List<Asset>? assets,
      DateTime? lastUpdated,
      String? parentId,
      bool hasCameras,
      int hierarchyLevel,
      DateTime? createdAt,
      DateTime? updatedAt,
      AiStats? aiStats,
      int constructionDays,
      List<User>? users,
      List<ProjectModel>? children});

  $LocationCopyWith<$Res>? get location;
  $AiStatsCopyWith<$Res>? get aiStats;
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = null,
    Object? name = freezed,
    Object? images = freezed,
    Object? coverImageUrl = null,
    Object? status = null,
    Object? assets = freezed,
    Object? lastUpdated = freezed,
    Object? parentId = freezed,
    Object? hasCameras = null,
    Object? hierarchyLevel = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? aiStats = freezed,
    Object? constructionDays = null,
    Object? users = freezed,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProjectImage>?,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assets: freezed == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      constructionDays: null == constructionDays
          ? _value.constructionDays
          : constructionDays // ignore: cast_nullable_to_non_nullable
              as int,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
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
abstract class _$$_ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$_ProjectModelCopyWith(
          _$_ProjectModel value, $Res Function(_$_ProjectModel) then) =
      __$$_ProjectModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Location? location,
      @JsonKey(name: '_id') String id,
      String? name,
      List<ProjectImage>? images,
      String coverImageUrl,
      String status,
      List<Asset>? assets,
      DateTime? lastUpdated,
      String? parentId,
      bool hasCameras,
      int hierarchyLevel,
      DateTime? createdAt,
      DateTime? updatedAt,
      AiStats? aiStats,
      int constructionDays,
      List<User>? users,
      List<ProjectModel>? children});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $AiStatsCopyWith<$Res>? get aiStats;
}

/// @nodoc
class __$$_ProjectModelCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$_ProjectModel>
    implements _$$_ProjectModelCopyWith<$Res> {
  __$$_ProjectModelCopyWithImpl(
      _$_ProjectModel _value, $Res Function(_$_ProjectModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = null,
    Object? name = freezed,
    Object? images = freezed,
    Object? coverImageUrl = null,
    Object? status = null,
    Object? assets = freezed,
    Object? lastUpdated = freezed,
    Object? parentId = freezed,
    Object? hasCameras = null,
    Object? hierarchyLevel = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? aiStats = freezed,
    Object? constructionDays = null,
    Object? users = freezed,
    Object? children = freezed,
  }) {
    return _then(_$_ProjectModel(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProjectImage>?,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assets: freezed == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      constructionDays: null == constructionDays
          ? _value.constructionDays
          : constructionDays // ignore: cast_nullable_to_non_nullable
              as int,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectModel implements _ProjectModel {
  const _$_ProjectModel(
      {this.location = const Location(),
      @JsonKey(name: '_id') required this.id,
      this.name,
      final List<ProjectImage>? images = const [],
      this.coverImageUrl = '',
      this.status = '',
      final List<Asset>? assets = const [],
      this.lastUpdated = null,
      this.parentId = '',
      this.hasCameras = false,
      this.hierarchyLevel = 0,
      this.createdAt = null,
      this.updatedAt = null,
      this.aiStats = const AiStats(),
      this.constructionDays = 0,
      final List<User>? users = const [],
      final List<ProjectModel>? children = const []})
      : _images = images,
        _assets = assets,
        _users = users,
        _children = children;

  factory _$_ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectModelFromJson(json);

  @override
  @JsonKey()
  final Location? location;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? name;
  final List<ProjectImage>? _images;
  @override
  @JsonKey()
  List<ProjectImage>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String coverImageUrl;
  @override
  @JsonKey()
  final String status;
  final List<Asset>? _assets;
  @override
  @JsonKey()
  List<Asset>? get assets {
    final value = _assets;
    if (value == null) return null;
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final DateTime? lastUpdated;
  @override
  @JsonKey()
  final String? parentId;
  @override
  @JsonKey()
  final bool hasCameras;
  @override
  @JsonKey()
  final int hierarchyLevel;
  @override
  @JsonKey()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final AiStats? aiStats;
  @override
  @JsonKey()
  final int constructionDays;
  final List<User>? _users;
  @override
  @JsonKey()
  List<User>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectModel>? _children;
  @override
  @JsonKey()
  List<ProjectModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectModel(location: $location, id: $id, name: $name, images: $images, coverImageUrl: $coverImageUrl, status: $status, assets: $assets, lastUpdated: $lastUpdated, parentId: $parentId, hasCameras: $hasCameras, hierarchyLevel: $hierarchyLevel, createdAt: $createdAt, updatedAt: $updatedAt, aiStats: $aiStats, constructionDays: $constructionDays, users: $users, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectModel &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.hasCameras, hasCameras) ||
                other.hasCameras == hasCameras) &&
            (identical(other.hierarchyLevel, hierarchyLevel) ||
                other.hierarchyLevel == hierarchyLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.aiStats, aiStats) || other.aiStats == aiStats) &&
            (identical(other.constructionDays, constructionDays) ||
                other.constructionDays == constructionDays) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      id,
      name,
      const DeepCollectionEquality().hash(_images),
      coverImageUrl,
      status,
      const DeepCollectionEquality().hash(_assets),
      lastUpdated,
      parentId,
      hasCameras,
      hierarchyLevel,
      createdAt,
      updatedAt,
      aiStats,
      constructionDays,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
      __$$_ProjectModelCopyWithImpl<_$_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectModelToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
      {final Location? location,
      @JsonKey(name: '_id') required final String id,
      final String? name,
      final List<ProjectImage>? images,
      final String coverImageUrl,
      final String status,
      final List<Asset>? assets,
      final DateTime? lastUpdated,
      final String? parentId,
      final bool hasCameras,
      final int hierarchyLevel,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final AiStats? aiStats,
      final int constructionDays,
      final List<User>? users,
      final List<ProjectModel>? children}) = _$_ProjectModel;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectModel.fromJson;

  @override
  Location? get location;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get name;
  @override
  List<ProjectImage>? get images;
  @override
  String get coverImageUrl;
  @override
  String get status;
  @override
  List<Asset>? get assets;
  @override
  DateTime? get lastUpdated;
  @override
  String? get parentId;
  @override
  bool get hasCameras;
  @override
  int get hierarchyLevel;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  AiStats? get aiStats;
  @override
  int get constructionDays;
  @override
  List<User>? get users;
  @override
  List<ProjectModel>? get children;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectModelCopyWith<_$_ProjectModel> get copyWith =>
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
  const _$_AiStats({this.activityScore = 0, this.ppeScore = 0.0});

  factory _$_AiStats.fromJson(Map<String, dynamic> json) =>
      _$$_AiStatsFromJson(json);

  @override
  @JsonKey()
  final int? activityScore;
  @override
  @JsonKey()
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

ProjectImage _$ProjectImageFromJson(Map<String, dynamic> json) {
  return _ProjectImage.fromJson(json);
}

/// @nodoc
mixin _$ProjectImage {
  @JsonKey(name: '_id')
  String? get imageId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectImageCopyWith<ProjectImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectImageCopyWith<$Res> {
  factory $ProjectImageCopyWith(
          ProjectImage value, $Res Function(ProjectImage) then) =
      _$ProjectImageCopyWithImpl<$Res, ProjectImage>;
  @useResult
  $Res call({@JsonKey(name: '_id') String? imageId, String? url});
}

/// @nodoc
class _$ProjectImageCopyWithImpl<$Res, $Val extends ProjectImage>
    implements $ProjectImageCopyWith<$Res> {
  _$ProjectImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProjectImageCopyWith<$Res>
    implements $ProjectImageCopyWith<$Res> {
  factory _$$_ProjectImageCopyWith(
          _$_ProjectImage value, $Res Function(_$_ProjectImage) then) =
      __$$_ProjectImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String? imageId, String? url});
}

/// @nodoc
class __$$_ProjectImageCopyWithImpl<$Res>
    extends _$ProjectImageCopyWithImpl<$Res, _$_ProjectImage>
    implements _$$_ProjectImageCopyWith<$Res> {
  __$$_ProjectImageCopyWithImpl(
      _$_ProjectImage _value, $Res Function(_$_ProjectImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_ProjectImage(
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectImage implements _ProjectImage {
  const _$_ProjectImage({@JsonKey(name: '_id') this.imageId, this.url = ''});

  factory _$_ProjectImage.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectImageFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? imageId;
  @override
  @JsonKey()
  final String? url;

  @override
  String toString() {
    return 'ProjectImage(imageId: $imageId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectImage &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectImageCopyWith<_$_ProjectImage> get copyWith =>
      __$$_ProjectImageCopyWithImpl<_$_ProjectImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectImageToJson(
      this,
    );
  }
}

abstract class _ProjectImage implements ProjectImage {
  const factory _ProjectImage(
      {@JsonKey(name: '_id') final String? imageId,
      final String? url}) = _$_ProjectImage;

  factory _ProjectImage.fromJson(Map<String, dynamic> json) =
      _$_ProjectImage.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get imageId;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectImageCopyWith<_$_ProjectImage> get copyWith =>
      throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
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
  $Res call({String? name, @JsonKey(name: '_id') String? id, int? count});
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
    Object? id = freezed,
    Object? count = freezed,
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
  $Res call({String? name, @JsonKey(name: '_id') String? id, int? count});
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
    Object? id = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_Asset(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
  const _$_Asset(
      {this.name = '', @JsonKey(name: '_id') this.id, this.count = 0});

  factory _$_Asset.fromJson(Map<String, dynamic> json) =>
      _$$_AssetFromJson(json);

  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey()
  final int? count;

  @override
  String toString() {
    return 'Asset(name: $name, id: $id, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Asset &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, count);

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
  const factory _Asset(
      {final String? name,
      @JsonKey(name: '_id') final String? id,
      final int? count}) = _$_Asset;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$_Asset.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_AssetCopyWith<_$_Asset> get copyWith =>
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
  const _$_Location({this.name = '', this.latitude = '', this.longitude = ''});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final dynamic latitude;
  @override
  @JsonKey()
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
  @JsonKey(name: '_id')
  String? get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get dp => throw _privateConstructorUsedError;
  String get dpUrl => throw _privateConstructorUsedError;

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
      @JsonKey(name: '_id') String? userId,
      String name,
      String email,
      String role,
      String dp,
      String dpUrl});

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
    Object? userId = freezed,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? dp = null,
    Object? dpUrl = null,
  }) {
    return _then(_value.copyWith(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      dp: null == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String,
      dpUrl: null == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: '_id') String? userId,
      String name,
      String email,
      String role,
      String dp,
      String dpUrl});

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
    Object? userId = freezed,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? dp = null,
    Object? dpUrl = null,
  }) {
    return _then(_$_User(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      dp: null == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String,
      dpUrl: null == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.preset = const Preset(),
      @JsonKey(name: '_id') this.userId,
      this.name = '',
      this.email = '',
      this.role = '',
      this.dp = '',
      this.dpUrl = ''});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey()
  final Preset? preset;
  @override
  @JsonKey(name: '_id')
  final String? userId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final String dp;
  @override
  @JsonKey()
  final String dpUrl;

  @override
  String toString() {
    return 'User(preset: $preset, userId: $userId, name: $name, email: $email, role: $role, dp: $dp, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.preset, preset) || other.preset == preset) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, preset, userId, name, email, role, dp, dpUrl);

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
      @JsonKey(name: '_id') final String? userId,
      final String name,
      final String email,
      final String role,
      final String dp,
      final String dpUrl}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  Preset? get preset;
  @override
  @JsonKey(name: '_id')
  String? get userId;
  @override
  String get name;
  @override
  String get email;
  @override
  String get role;
  @override
  String get dp;
  @override
  String get dpUrl;
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
  const _$_Preset({this.color = ''});

  factory _$_Preset.fromJson(Map<String, dynamic> json) =>
      _$$_PresetFromJson(json);

  @override
  @JsonKey()
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
