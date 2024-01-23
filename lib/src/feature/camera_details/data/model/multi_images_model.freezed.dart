// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multi_images_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MultiImagesModel _$MultiImagesModelFromJson(Map<String, dynamic> json) {
  return _MultiImagesModel.fromJson(json);
}

/// @nodoc
mixin _$MultiImagesModel {
  Options? get options => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get filepath => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get camera => throw _privateConstructorUsedError;
  String? get project => throw _privateConstructorUsedError;
  String? get client => throw _privateConstructorUsedError;
  RequestedBy? get requestedBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get multiImagesModelId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiImagesModelCopyWith<MultiImagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiImagesModelCopyWith<$Res> {
  factory $MultiImagesModelCopyWith(
          MultiImagesModel value, $Res Function(MultiImagesModel) then) =
      _$MultiImagesModelCopyWithImpl<$Res, MultiImagesModel>;
  @useResult
  $Res call(
      {Options? options,
      String? id,
      String? filepath,
      String? name,
      String? startDate,
      String? endDate,
      String? startTime,
      String? endTime,
      String? status,
      String? camera,
      String? project,
      String? client,
      RequestedBy? requestedBy,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? multiImagesModelId,
      String? url});

  $OptionsCopyWith<$Res>? get options;
  $RequestedByCopyWith<$Res>? get requestedBy;
}

/// @nodoc
class _$MultiImagesModelCopyWithImpl<$Res, $Val extends MultiImagesModel>
    implements $MultiImagesModelCopyWith<$Res> {
  _$MultiImagesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = freezed,
    Object? id = freezed,
    Object? filepath = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? camera = freezed,
    Object? project = freezed,
    Object? client = freezed,
    Object? requestedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? multiImagesModelId = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedBy: freezed == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as RequestedBy?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      multiImagesModelId: freezed == multiImagesModelId
          ? _value.multiImagesModelId
          : multiImagesModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionsCopyWith<$Res>? get options {
    if (_value.options == null) {
      return null;
    }

    return $OptionsCopyWith<$Res>(_value.options!, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestedByCopyWith<$Res>? get requestedBy {
    if (_value.requestedBy == null) {
      return null;
    }

    return $RequestedByCopyWith<$Res>(_value.requestedBy!, (value) {
      return _then(_value.copyWith(requestedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MultiImagesModelCopyWith<$Res>
    implements $MultiImagesModelCopyWith<$Res> {
  factory _$$_MultiImagesModelCopyWith(
          _$_MultiImagesModel value, $Res Function(_$_MultiImagesModel) then) =
      __$$_MultiImagesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Options? options,
      String? id,
      String? filepath,
      String? name,
      String? startDate,
      String? endDate,
      String? startTime,
      String? endTime,
      String? status,
      String? camera,
      String? project,
      String? client,
      RequestedBy? requestedBy,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? multiImagesModelId,
      String? url});

  @override
  $OptionsCopyWith<$Res>? get options;
  @override
  $RequestedByCopyWith<$Res>? get requestedBy;
}

/// @nodoc
class __$$_MultiImagesModelCopyWithImpl<$Res>
    extends _$MultiImagesModelCopyWithImpl<$Res, _$_MultiImagesModel>
    implements _$$_MultiImagesModelCopyWith<$Res> {
  __$$_MultiImagesModelCopyWithImpl(
      _$_MultiImagesModel _value, $Res Function(_$_MultiImagesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? options = freezed,
    Object? id = freezed,
    Object? filepath = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? status = freezed,
    Object? camera = freezed,
    Object? project = freezed,
    Object? client = freezed,
    Object? requestedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? multiImagesModelId = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_MultiImagesModel(
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Options?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedBy: freezed == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as RequestedBy?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      multiImagesModelId: freezed == multiImagesModelId
          ? _value.multiImagesModelId
          : multiImagesModelId // ignore: cast_nullable_to_non_nullable
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
class _$_MultiImagesModel implements _MultiImagesModel {
  const _$_MultiImagesModel(
      {this.options,
      this.id,
      this.filepath,
      this.name,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.status,
      this.camera,
      this.project,
      this.client,
      this.requestedBy,
      this.createdAt,
      this.updatedAt,
      this.multiImagesModelId,
      this.url});

  factory _$_MultiImagesModel.fromJson(Map<String, dynamic> json) =>
      _$$_MultiImagesModelFromJson(json);

  @override
  final Options? options;
  @override
  final String? id;
  @override
  final String? filepath;
  @override
  final String? name;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final String? status;
  @override
  final String? camera;
  @override
  final String? project;
  @override
  final String? client;
  @override
  final RequestedBy? requestedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? multiImagesModelId;
  @override
  final String? url;

  @override
  String toString() {
    return 'MultiImagesModel(options: $options, id: $id, filepath: $filepath, name: $name, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, status: $status, camera: $camera, project: $project, client: $client, requestedBy: $requestedBy, createdAt: $createdAt, updatedAt: $updatedAt, multiImagesModelId: $multiImagesModelId, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MultiImagesModel &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.multiImagesModelId, multiImagesModelId) ||
                other.multiImagesModelId == multiImagesModelId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      options,
      id,
      filepath,
      name,
      startDate,
      endDate,
      startTime,
      endTime,
      status,
      camera,
      project,
      client,
      requestedBy,
      createdAt,
      updatedAt,
      multiImagesModelId,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MultiImagesModelCopyWith<_$_MultiImagesModel> get copyWith =>
      __$$_MultiImagesModelCopyWithImpl<_$_MultiImagesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MultiImagesModelToJson(
      this,
    );
  }
}

abstract class _MultiImagesModel implements MultiImagesModel {
  const factory _MultiImagesModel(
      {final Options? options,
      final String? id,
      final String? filepath,
      final String? name,
      final String? startDate,
      final String? endDate,
      final String? startTime,
      final String? endTime,
      final String? status,
      final String? camera,
      final String? project,
      final String? client,
      final RequestedBy? requestedBy,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? multiImagesModelId,
      final String? url}) = _$_MultiImagesModel;

  factory _MultiImagesModel.fromJson(Map<String, dynamic> json) =
      _$_MultiImagesModel.fromJson;

  @override
  Options? get options;
  @override
  String? get id;
  @override
  String? get filepath;
  @override
  String? get name;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  String? get status;
  @override
  String? get camera;
  @override
  String? get project;
  @override
  String? get client;
  @override
  RequestedBy? get requestedBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get multiImagesModelId;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_MultiImagesModelCopyWith<_$_MultiImagesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return _Options.fromJson(json);
}

/// @nodoc
mixin _$Options {
  bool? get hasTimestamp => throw _privateConstructorUsedError;
  String? get imageQuality => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res, Options>;
  @useResult
  $Res call({bool? hasTimestamp, String? imageQuality});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res, $Val extends Options>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasTimestamp = freezed,
    Object? imageQuality = freezed,
  }) {
    return _then(_value.copyWith(
      hasTimestamp: freezed == hasTimestamp
          ? _value.hasTimestamp
          : hasTimestamp // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageQuality: freezed == imageQuality
          ? _value.imageQuality
          : imageQuality // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionsCopyWith<$Res> implements $OptionsCopyWith<$Res> {
  factory _$$_OptionsCopyWith(
          _$_Options value, $Res Function(_$_Options) then) =
      __$$_OptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? hasTimestamp, String? imageQuality});
}

/// @nodoc
class __$$_OptionsCopyWithImpl<$Res>
    extends _$OptionsCopyWithImpl<$Res, _$_Options>
    implements _$$_OptionsCopyWith<$Res> {
  __$$_OptionsCopyWithImpl(_$_Options _value, $Res Function(_$_Options) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasTimestamp = freezed,
    Object? imageQuality = freezed,
  }) {
    return _then(_$_Options(
      hasTimestamp: freezed == hasTimestamp
          ? _value.hasTimestamp
          : hasTimestamp // ignore: cast_nullable_to_non_nullable
              as bool?,
      imageQuality: freezed == imageQuality
          ? _value.imageQuality
          : imageQuality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Options implements _Options {
  const _$_Options({this.hasTimestamp, this.imageQuality});

  factory _$_Options.fromJson(Map<String, dynamic> json) =>
      _$$_OptionsFromJson(json);

  @override
  final bool? hasTimestamp;
  @override
  final String? imageQuality;

  @override
  String toString() {
    return 'Options(hasTimestamp: $hasTimestamp, imageQuality: $imageQuality)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Options &&
            (identical(other.hasTimestamp, hasTimestamp) ||
                other.hasTimestamp == hasTimestamp) &&
            (identical(other.imageQuality, imageQuality) ||
                other.imageQuality == imageQuality));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hasTimestamp, imageQuality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionsCopyWith<_$_Options> get copyWith =>
      __$$_OptionsCopyWithImpl<_$_Options>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionsToJson(
      this,
    );
  }
}

abstract class _Options implements Options {
  const factory _Options(
      {final bool? hasTimestamp, final String? imageQuality}) = _$_Options;

  factory _Options.fromJson(Map<String, dynamic> json) = _$_Options.fromJson;

  @override
  bool? get hasTimestamp;
  @override
  String? get imageQuality;
  @override
  @JsonKey(ignore: true)
  _$$_OptionsCopyWith<_$_Options> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestedBy _$RequestedByFromJson(Map<String, dynamic> json) {
  return _RequestedBy.fromJson(json);
}

/// @nodoc
mixin _$RequestedBy {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get requestedById => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestedByCopyWith<RequestedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestedByCopyWith<$Res> {
  factory $RequestedByCopyWith(
          RequestedBy value, $Res Function(RequestedBy) then) =
      _$RequestedByCopyWithImpl<$Res, RequestedBy>;
  @useResult
  $Res call({String? id, String? name, String? requestedById});
}

/// @nodoc
class _$RequestedByCopyWithImpl<$Res, $Val extends RequestedBy>
    implements $RequestedByCopyWith<$Res> {
  _$RequestedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? requestedById = freezed,
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
      requestedById: freezed == requestedById
          ? _value.requestedById
          : requestedById // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestedByCopyWith<$Res>
    implements $RequestedByCopyWith<$Res> {
  factory _$$_RequestedByCopyWith(
          _$_RequestedBy value, $Res Function(_$_RequestedBy) then) =
      __$$_RequestedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? requestedById});
}

/// @nodoc
class __$$_RequestedByCopyWithImpl<$Res>
    extends _$RequestedByCopyWithImpl<$Res, _$_RequestedBy>
    implements _$$_RequestedByCopyWith<$Res> {
  __$$_RequestedByCopyWithImpl(
      _$_RequestedBy _value, $Res Function(_$_RequestedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? requestedById = freezed,
  }) {
    return _then(_$_RequestedBy(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedById: freezed == requestedById
          ? _value.requestedById
          : requestedById // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestedBy implements _RequestedBy {
  const _$_RequestedBy({this.id, this.name, this.requestedById});

  factory _$_RequestedBy.fromJson(Map<String, dynamic> json) =>
      _$$_RequestedByFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? requestedById;

  @override
  String toString() {
    return 'RequestedBy(id: $id, name: $name, requestedById: $requestedById)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.requestedById, requestedById) ||
                other.requestedById == requestedById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, requestedById);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestedByCopyWith<_$_RequestedBy> get copyWith =>
      __$$_RequestedByCopyWithImpl<_$_RequestedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestedByToJson(
      this,
    );
  }
}

abstract class _RequestedBy implements RequestedBy {
  const factory _RequestedBy(
      {final String? id,
      final String? name,
      final String? requestedById}) = _$_RequestedBy;

  factory _RequestedBy.fromJson(Map<String, dynamic> json) =
      _$_RequestedBy.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get requestedById;
  @override
  @JsonKey(ignore: true)
  _$$_RequestedByCopyWith<_$_RequestedBy> get copyWith =>
      throw _privateConstructorUsedError;
}
