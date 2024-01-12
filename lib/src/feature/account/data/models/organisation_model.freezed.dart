// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrganisationModel _$OrganisationModelFromJson(Map<String, dynamic> json) {
  return _OrganisationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganisationModel {
  Preferences? get preferences => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get domain => throw _privateConstructorUsedError;
  String? get organisationModelId => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get emailHeaderLogoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganisationModelCopyWith<OrganisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationModelCopyWith<$Res> {
  factory $OrganisationModelCopyWith(
          OrganisationModel value, $Res Function(OrganisationModel) then) =
      _$OrganisationModelCopyWithImpl<$Res, OrganisationModel>;
  @useResult
  $Res call(
      {Preferences? preferences,
      @JsonKey(name: "_id") String? id,
      String? name,
      String? domain,
      String? organisationModelId,
      String? logoUrl,
      String? emailHeaderLogoUrl});

  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$OrganisationModelCopyWithImpl<$Res, $Val extends OrganisationModel>
    implements $OrganisationModelCopyWith<$Res> {
  _$OrganisationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? domain = freezed,
    Object? organisationModelId = freezed,
    Object? logoUrl = freezed,
    Object? emailHeaderLogoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preferences?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      organisationModelId: freezed == organisationModelId
          ? _value.organisationModelId
          : organisationModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHeaderLogoUrl: freezed == emailHeaderLogoUrl
          ? _value.emailHeaderLogoUrl
          : emailHeaderLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $PreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrganisationModelCopyWith<$Res>
    implements $OrganisationModelCopyWith<$Res> {
  factory _$$_OrganisationModelCopyWith(_$_OrganisationModel value,
          $Res Function(_$_OrganisationModel) then) =
      __$$_OrganisationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preferences? preferences,
      @JsonKey(name: "_id") String? id,
      String? name,
      String? domain,
      String? organisationModelId,
      String? logoUrl,
      String? emailHeaderLogoUrl});

  @override
  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$_OrganisationModelCopyWithImpl<$Res>
    extends _$OrganisationModelCopyWithImpl<$Res, _$_OrganisationModel>
    implements _$$_OrganisationModelCopyWith<$Res> {
  __$$_OrganisationModelCopyWithImpl(
      _$_OrganisationModel _value, $Res Function(_$_OrganisationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? domain = freezed,
    Object? organisationModelId = freezed,
    Object? logoUrl = freezed,
    Object? emailHeaderLogoUrl = freezed,
  }) {
    return _then(_$_OrganisationModel(
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preferences?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      organisationModelId: freezed == organisationModelId
          ? _value.organisationModelId
          : organisationModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      emailHeaderLogoUrl: freezed == emailHeaderLogoUrl
          ? _value.emailHeaderLogoUrl
          : emailHeaderLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrganisationModel implements _OrganisationModel {
  const _$_OrganisationModel(
      {this.preferences,
      @JsonKey(name: "_id") this.id,
      this.name,
      this.domain,
      this.organisationModelId,
      this.logoUrl,
      this.emailHeaderLogoUrl});

  factory _$_OrganisationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrganisationModelFromJson(json);

  @override
  final Preferences? preferences;
  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final String? domain;
  @override
  final String? organisationModelId;
  @override
  final String? logoUrl;
  @override
  final String? emailHeaderLogoUrl;

  @override
  String toString() {
    return 'OrganisationModel(preferences: $preferences, id: $id, name: $name, domain: $domain, organisationModelId: $organisationModelId, logoUrl: $logoUrl, emailHeaderLogoUrl: $emailHeaderLogoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganisationModel &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.organisationModelId, organisationModelId) ||
                other.organisationModelId == organisationModelId) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.emailHeaderLogoUrl, emailHeaderLogoUrl) ||
                other.emailHeaderLogoUrl == emailHeaderLogoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, preferences, id, name, domain,
      organisationModelId, logoUrl, emailHeaderLogoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganisationModelCopyWith<_$_OrganisationModel> get copyWith =>
      __$$_OrganisationModelCopyWithImpl<_$_OrganisationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganisationModelToJson(
      this,
    );
  }
}

abstract class _OrganisationModel implements OrganisationModel {
  const factory _OrganisationModel(
      {final Preferences? preferences,
      @JsonKey(name: "_id") final String? id,
      final String? name,
      final String? domain,
      final String? organisationModelId,
      final String? logoUrl,
      final String? emailHeaderLogoUrl}) = _$_OrganisationModel;

  factory _OrganisationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganisationModel.fromJson;

  @override
  Preferences? get preferences;
  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  String? get domain;
  @override
  String? get organisationModelId;
  @override
  String? get logoUrl;
  @override
  String? get emailHeaderLogoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_OrganisationModelCopyWith<_$_OrganisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
  List<LoginImage>? get loginImages => throw _privateConstructorUsedError;
  String? get primaryColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferencesCopyWith<Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesCopyWith<$Res> {
  factory $PreferencesCopyWith(
          Preferences value, $Res Function(Preferences) then) =
      _$PreferencesCopyWithImpl<$Res, Preferences>;
  @useResult
  $Res call({List<LoginImage>? loginImages, String? primaryColor});
}

/// @nodoc
class _$PreferencesCopyWithImpl<$Res, $Val extends Preferences>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginImages = freezed,
    Object? primaryColor = freezed,
  }) {
    return _then(_value.copyWith(
      loginImages: freezed == loginImages
          ? _value.loginImages
          : loginImages // ignore: cast_nullable_to_non_nullable
              as List<LoginImage>?,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PreferencesCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$_PreferencesCopyWith(
          _$_Preferences value, $Res Function(_$_Preferences) then) =
      __$$_PreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LoginImage>? loginImages, String? primaryColor});
}

/// @nodoc
class __$$_PreferencesCopyWithImpl<$Res>
    extends _$PreferencesCopyWithImpl<$Res, _$_Preferences>
    implements _$$_PreferencesCopyWith<$Res> {
  __$$_PreferencesCopyWithImpl(
      _$_Preferences _value, $Res Function(_$_Preferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginImages = freezed,
    Object? primaryColor = freezed,
  }) {
    return _then(_$_Preferences(
      loginImages: freezed == loginImages
          ? _value._loginImages
          : loginImages // ignore: cast_nullable_to_non_nullable
              as List<LoginImage>?,
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Preferences implements _Preferences {
  const _$_Preferences({final List<LoginImage>? loginImages, this.primaryColor})
      : _loginImages = loginImages;

  factory _$_Preferences.fromJson(Map<String, dynamic> json) =>
      _$$_PreferencesFromJson(json);

  final List<LoginImage>? _loginImages;
  @override
  List<LoginImage>? get loginImages {
    final value = _loginImages;
    if (value == null) return null;
    if (_loginImages is EqualUnmodifiableListView) return _loginImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? primaryColor;

  @override
  String toString() {
    return 'Preferences(loginImages: $loginImages, primaryColor: $primaryColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preferences &&
            const DeepCollectionEquality()
                .equals(other._loginImages, _loginImages) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_loginImages), primaryColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      __$$_PreferencesCopyWithImpl<_$_Preferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreferencesToJson(
      this,
    );
  }
}

abstract class _Preferences implements Preferences {
  const factory _Preferences(
      {final List<LoginImage>? loginImages,
      final String? primaryColor}) = _$_Preferences;

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$_Preferences.fromJson;

  @override
  List<LoginImage>? get loginImages;
  @override
  String? get primaryColor;
  @override
  @JsonKey(ignore: true)
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginImage _$LoginImageFromJson(Map<String, dynamic> json) {
  return _LoginImage.fromJson(json);
}

/// @nodoc
mixin _$LoginImage {
  String? get filepath => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginImageCopyWith<LoginImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginImageCopyWith<$Res> {
  factory $LoginImageCopyWith(
          LoginImage value, $Res Function(LoginImage) then) =
      _$LoginImageCopyWithImpl<$Res, LoginImage>;
  @useResult
  $Res call(
      {String? filepath,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});
}

/// @nodoc
class _$LoginImageCopyWithImpl<$Res, $Val extends LoginImage>
    implements $LoginImageCopyWith<$Res> {
  _$LoginImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filepath = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_LoginImageCopyWith<$Res>
    implements $LoginImageCopyWith<$Res> {
  factory _$$_LoginImageCopyWith(
          _$_LoginImage value, $Res Function(_$_LoginImage) then) =
      __$$_LoginImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? filepath,
      String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? url});
}

/// @nodoc
class __$$_LoginImageCopyWithImpl<$Res>
    extends _$LoginImageCopyWithImpl<$Res, _$_LoginImage>
    implements _$$_LoginImageCopyWith<$Res> {
  __$$_LoginImageCopyWithImpl(
      _$_LoginImage _value, $Res Function(_$_LoginImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filepath = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_LoginImage(
      filepath: freezed == filepath
          ? _value.filepath
          : filepath // ignore: cast_nullable_to_non_nullable
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
class _$_LoginImage implements _LoginImage {
  const _$_LoginImage(
      {this.filepath, this.id, this.createdAt, this.updatedAt, this.url});

  factory _$_LoginImage.fromJson(Map<String, dynamic> json) =>
      _$$_LoginImageFromJson(json);

  @override
  final String? filepath;
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
    return 'LoginImage(filepath: $filepath, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginImage &&
            (identical(other.filepath, filepath) ||
                other.filepath == filepath) &&
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
      Object.hash(runtimeType, filepath, id, createdAt, updatedAt, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginImageCopyWith<_$_LoginImage> get copyWith =>
      __$$_LoginImageCopyWithImpl<_$_LoginImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginImageToJson(
      this,
    );
  }
}

abstract class _LoginImage implements LoginImage {
  const factory _LoginImage(
      {final String? filepath,
      final String? id,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? url}) = _$_LoginImage;

  factory _LoginImage.fromJson(Map<String, dynamic> json) =
      _$_LoginImage.fromJson;

  @override
  String? get filepath;
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
  _$$_LoginImageCopyWith<_$_LoginImage> get copyWith =>
      throw _privateConstructorUsedError;
}
