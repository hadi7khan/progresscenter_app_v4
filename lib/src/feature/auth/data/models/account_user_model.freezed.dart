// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountUserModel _$AccountUserModelFromJson(Map<String, dynamic> json) {
  return _AccountUserModel.fromJson(json);
}

/// @nodoc
mixin _$AccountUserModel {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  Phone? get phone => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  AccountUserModelPreferences? get preferences =>
      throw _privateConstructorUsedError;
  Preset? get preset => throw _privateConstructorUsedError;
  Map<String, int>? get projectSortOrder => throw _privateConstructorUsedError;
  Client? get client => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountUserModelCopyWith<AccountUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUserModelCopyWith<$Res> {
  factory $AccountUserModelCopyWith(
          AccountUserModel value, $Res Function(AccountUserModel) then) =
      _$AccountUserModelCopyWithImpl<$Res, AccountUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? username,
      String? email,
      Phone? phone,
      String? designation,
      String? role,
      String? dp,
      List<String>? tags,
      AccountUserModelPreferences? preferences,
      Preset? preset,
      Map<String, int>? projectSortOrder,
      Client? client,
      String? dpUrl});

  $PhoneCopyWith<$Res>? get phone;
  $AccountUserModelPreferencesCopyWith<$Res>? get preferences;
  $PresetCopyWith<$Res>? get preset;
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class _$AccountUserModelCopyWithImpl<$Res, $Val extends AccountUserModel>
    implements $AccountUserModelCopyWith<$Res> {
  _$AccountUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? role = freezed,
    Object? dp = freezed,
    Object? tags = freezed,
    Object? preferences = freezed,
    Object? preset = freezed,
    Object? projectSortOrder = freezed,
    Object? client = freezed,
    Object? dpUrl = freezed,
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
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as AccountUserModelPreferences?,
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      projectSortOrder: freezed == projectSortOrder
          ? _value.projectSortOrder
          : projectSortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhoneCopyWith<$Res>? get phone {
    if (_value.phone == null) {
      return null;
    }

    return $PhoneCopyWith<$Res>(_value.phone!, (value) {
      return _then(_value.copyWith(phone: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountUserModelPreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $AccountUserModelPreferencesCopyWith<$Res>(_value.preferences!,
        (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get client {
    if (_value.client == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_value.client!, (value) {
      return _then(_value.copyWith(client: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountUserModelCopyWith<$Res>
    implements $AccountUserModelCopyWith<$Res> {
  factory _$$_AccountUserModelCopyWith(
          _$_AccountUserModel value, $Res Function(_$_AccountUserModel) then) =
      __$$_AccountUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      String? name,
      String? username,
      String? email,
      Phone? phone,
      String? designation,
      String? role,
      String? dp,
      List<String>? tags,
      AccountUserModelPreferences? preferences,
      Preset? preset,
      Map<String, int>? projectSortOrder,
      Client? client,
      String? dpUrl});

  @override
  $PhoneCopyWith<$Res>? get phone;
  @override
  $AccountUserModelPreferencesCopyWith<$Res>? get preferences;
  @override
  $PresetCopyWith<$Res>? get preset;
  @override
  $ClientCopyWith<$Res>? get client;
}

/// @nodoc
class __$$_AccountUserModelCopyWithImpl<$Res>
    extends _$AccountUserModelCopyWithImpl<$Res, _$_AccountUserModel>
    implements _$$_AccountUserModelCopyWith<$Res> {
  __$$_AccountUserModelCopyWithImpl(
      _$_AccountUserModel _value, $Res Function(_$_AccountUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? designation = freezed,
    Object? role = freezed,
    Object? dp = freezed,
    Object? tags = freezed,
    Object? preferences = freezed,
    Object? preset = freezed,
    Object? projectSortOrder = freezed,
    Object? client = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_$_AccountUserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as AccountUserModelPreferences?,
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
      projectSortOrder: freezed == projectSortOrder
          ? _value._projectSortOrder
          : projectSortOrder // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      client: freezed == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client?,
      dpUrl: freezed == dpUrl
          ? _value.dpUrl
          : dpUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountUserModel implements _AccountUserModel {
  const _$_AccountUserModel(
      {@JsonKey(name: "_id") this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.designation,
      this.role,
      this.dp,
      final List<String>? tags,
      this.preferences,
      this.preset,
      final Map<String, int>? projectSortOrder,
      this.client,
      this.dpUrl})
      : _tags = tags,
        _projectSortOrder = projectSortOrder;

  factory _$_AccountUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountUserModelFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final Phone? phone;
  @override
  final String? designation;
  @override
  final String? role;
  @override
  final String? dp;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AccountUserModelPreferences? preferences;
  @override
  final Preset? preset;
  final Map<String, int>? _projectSortOrder;
  @override
  Map<String, int>? get projectSortOrder {
    final value = _projectSortOrder;
    if (value == null) return null;
    if (_projectSortOrder is EqualUnmodifiableMapView) return _projectSortOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final Client? client;
  @override
  final String? dpUrl;

  @override
  String toString() {
    return 'AccountUserModel(id: $id, name: $name, username: $username, email: $email, phone: $phone, designation: $designation, role: $role, dp: $dp, tags: $tags, preferences: $preferences, preset: $preset, projectSortOrder: $projectSortOrder, client: $client, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.preset, preset) || other.preset == preset) &&
            const DeepCollectionEquality()
                .equals(other._projectSortOrder, _projectSortOrder) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      username,
      email,
      phone,
      designation,
      role,
      dp,
      const DeepCollectionEquality().hash(_tags),
      preferences,
      preset,
      const DeepCollectionEquality().hash(_projectSortOrder),
      client,
      dpUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountUserModelCopyWith<_$_AccountUserModel> get copyWith =>
      __$$_AccountUserModelCopyWithImpl<_$_AccountUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountUserModelToJson(
      this,
    );
  }
}

abstract class _AccountUserModel implements AccountUserModel {
  const factory _AccountUserModel(
      {@JsonKey(name: "_id") final String? id,
      final String? name,
      final String? username,
      final String? email,
      final Phone? phone,
      final String? designation,
      final String? role,
      final String? dp,
      final List<String>? tags,
      final AccountUserModelPreferences? preferences,
      final Preset? preset,
      final Map<String, int>? projectSortOrder,
      final Client? client,
      final String? dpUrl}) = _$_AccountUserModel;

  factory _AccountUserModel.fromJson(Map<String, dynamic> json) =
      _$_AccountUserModel.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get email;
  @override
  Phone? get phone;
  @override
  String? get designation;
  @override
  String? get role;
  @override
  String? get dp;
  @override
  List<String>? get tags;
  @override
  AccountUserModelPreferences? get preferences;
  @override
  Preset? get preset;
  @override
  Map<String, int>? get projectSortOrder;
  @override
  Client? get client;
  @override
  String? get dpUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AccountUserModelCopyWith<_$_AccountUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  String? get name => throw _privateConstructorUsedError;
  dynamic get logo => throw _privateConstructorUsedError;
  ClientPreferences? get preferences => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call(
      {String? name,
      dynamic logo,
      ClientPreferences? preferences,
      String? logoUrl});

  $ClientPreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? logo = freezed,
    Object? preferences = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ClientPreferences?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientPreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $ClientPreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$_ClientCopyWith(_$_Client value, $Res Function(_$_Client) then) =
      __$$_ClientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      dynamic logo,
      ClientPreferences? preferences,
      String? logoUrl});

  @override
  $ClientPreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$_ClientCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$_Client>
    implements _$$_ClientCopyWith<$Res> {
  __$$_ClientCopyWithImpl(_$_Client _value, $Res Function(_$_Client) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? logo = freezed,
    Object? preferences = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_$_Client(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as ClientPreferences?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Client implements _Client {
  const _$_Client({this.name, this.logo, this.preferences, this.logoUrl});

  factory _$_Client.fromJson(Map<String, dynamic> json) =>
      _$$_ClientFromJson(json);

  @override
  final String? name;
  @override
  final dynamic logo;
  @override
  final ClientPreferences? preferences;
  @override
  final String? logoUrl;

  @override
  String toString() {
    return 'Client(name: $name, logo: $logo, preferences: $preferences, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Client &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(logo), preferences, logoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientCopyWith<_$_Client> get copyWith =>
      __$$_ClientCopyWithImpl<_$_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientToJson(
      this,
    );
  }
}

abstract class _Client implements Client {
  const factory _Client(
      {final String? name,
      final dynamic logo,
      final ClientPreferences? preferences,
      final String? logoUrl}) = _$_Client;

  factory _Client.fromJson(Map<String, dynamic> json) = _$_Client.fromJson;

  @override
  String? get name;
  @override
  dynamic get logo;
  @override
  ClientPreferences? get preferences;
  @override
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ClientCopyWith<_$_Client> get copyWith =>
      throw _privateConstructorUsedError;
}

ClientPreferences _$ClientPreferencesFromJson(Map<String, dynamic> json) {
  return _ClientPreferences.fromJson(json);
}

/// @nodoc
mixin _$ClientPreferences {
  bool? get hasCdnEnabled => throw _privateConstructorUsedError;
  List<LoginImage>? get loginImages => throw _privateConstructorUsedError;
  String? get primaryColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientPreferencesCopyWith<ClientPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientPreferencesCopyWith<$Res> {
  factory $ClientPreferencesCopyWith(
          ClientPreferences value, $Res Function(ClientPreferences) then) =
      _$ClientPreferencesCopyWithImpl<$Res, ClientPreferences>;
  @useResult
  $Res call(
      {bool? hasCdnEnabled,
      List<LoginImage>? loginImages,
      String? primaryColor});
}

/// @nodoc
class _$ClientPreferencesCopyWithImpl<$Res, $Val extends ClientPreferences>
    implements $ClientPreferencesCopyWith<$Res> {
  _$ClientPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCdnEnabled = freezed,
    Object? loginImages = freezed,
    Object? primaryColor = freezed,
  }) {
    return _then(_value.copyWith(
      hasCdnEnabled: freezed == hasCdnEnabled
          ? _value.hasCdnEnabled
          : hasCdnEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_ClientPreferencesCopyWith<$Res>
    implements $ClientPreferencesCopyWith<$Res> {
  factory _$$_ClientPreferencesCopyWith(_$_ClientPreferences value,
          $Res Function(_$_ClientPreferences) then) =
      __$$_ClientPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? hasCdnEnabled,
      List<LoginImage>? loginImages,
      String? primaryColor});
}

/// @nodoc
class __$$_ClientPreferencesCopyWithImpl<$Res>
    extends _$ClientPreferencesCopyWithImpl<$Res, _$_ClientPreferences>
    implements _$$_ClientPreferencesCopyWith<$Res> {
  __$$_ClientPreferencesCopyWithImpl(
      _$_ClientPreferences _value, $Res Function(_$_ClientPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCdnEnabled = freezed,
    Object? loginImages = freezed,
    Object? primaryColor = freezed,
  }) {
    return _then(_$_ClientPreferences(
      hasCdnEnabled: freezed == hasCdnEnabled
          ? _value.hasCdnEnabled
          : hasCdnEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$_ClientPreferences implements _ClientPreferences {
  const _$_ClientPreferences(
      {this.hasCdnEnabled,
      final List<LoginImage>? loginImages,
      this.primaryColor})
      : _loginImages = loginImages;

  factory _$_ClientPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_ClientPreferencesFromJson(json);

  @override
  final bool? hasCdnEnabled;
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
    return 'ClientPreferences(hasCdnEnabled: $hasCdnEnabled, loginImages: $loginImages, primaryColor: $primaryColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientPreferences &&
            (identical(other.hasCdnEnabled, hasCdnEnabled) ||
                other.hasCdnEnabled == hasCdnEnabled) &&
            const DeepCollectionEquality()
                .equals(other._loginImages, _loginImages) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hasCdnEnabled,
      const DeepCollectionEquality().hash(_loginImages), primaryColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientPreferencesCopyWith<_$_ClientPreferences> get copyWith =>
      __$$_ClientPreferencesCopyWithImpl<_$_ClientPreferences>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientPreferencesToJson(
      this,
    );
  }
}

abstract class _ClientPreferences implements ClientPreferences {
  const factory _ClientPreferences(
      {final bool? hasCdnEnabled,
      final List<LoginImage>? loginImages,
      final String? primaryColor}) = _$_ClientPreferences;

  factory _ClientPreferences.fromJson(Map<String, dynamic> json) =
      _$_ClientPreferences.fromJson;

  @override
  bool? get hasCdnEnabled;
  @override
  List<LoginImage>? get loginImages;
  @override
  String? get primaryColor;
  @override
  @JsonKey(ignore: true)
  _$$_ClientPreferencesCopyWith<_$_ClientPreferences> get copyWith =>
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
      {String? filepath, String? id, DateTime? createdAt, DateTime? updatedAt});
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
      {String? filepath, String? id, DateTime? createdAt, DateTime? updatedAt});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginImage implements _LoginImage {
  const _$_LoginImage({this.filepath, this.id, this.createdAt, this.updatedAt});

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
  String toString() {
    return 'LoginImage(filepath: $filepath, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
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
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, filepath, id, createdAt, updatedAt);

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
      final DateTime? updatedAt}) = _$_LoginImage;

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
  @JsonKey(ignore: true)
  _$$_LoginImageCopyWith<_$_LoginImage> get copyWith =>
      throw _privateConstructorUsedError;
}

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return _Phone.fromJson(json);
}

/// @nodoc
mixin _$Phone {
  String? get dialCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get fullNumber => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneCopyWith<Phone> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneCopyWith<$Res> {
  factory $PhoneCopyWith(Phone value, $Res Function(Phone) then) =
      _$PhoneCopyWithImpl<$Res, Phone>;
  @useResult
  $Res call(
      {String? dialCode,
      String? countryCode,
      String? number,
      String? fullNumber,
      String? id});
}

/// @nodoc
class _$PhoneCopyWithImpl<$Res, $Val extends Phone>
    implements $PhoneCopyWith<$Res> {
  _$PhoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dialCode = freezed,
    Object? countryCode = freezed,
    Object? number = freezed,
    Object? fullNumber = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNumber: freezed == fullNumber
          ? _value.fullNumber
          : fullNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneCopyWith<$Res> implements $PhoneCopyWith<$Res> {
  factory _$$_PhoneCopyWith(_$_Phone value, $Res Function(_$_Phone) then) =
      __$$_PhoneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dialCode,
      String? countryCode,
      String? number,
      String? fullNumber,
      String? id});
}

/// @nodoc
class __$$_PhoneCopyWithImpl<$Res> extends _$PhoneCopyWithImpl<$Res, _$_Phone>
    implements _$$_PhoneCopyWith<$Res> {
  __$$_PhoneCopyWithImpl(_$_Phone _value, $Res Function(_$_Phone) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dialCode = freezed,
    Object? countryCode = freezed,
    Object? number = freezed,
    Object? fullNumber = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Phone(
      dialCode: freezed == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNumber: freezed == fullNumber
          ? _value.fullNumber
          : fullNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Phone implements _Phone {
  const _$_Phone(
      {this.dialCode, this.countryCode, this.number, this.fullNumber, this.id});

  factory _$_Phone.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneFromJson(json);

  @override
  final String? dialCode;
  @override
  final String? countryCode;
  @override
  final String? number;
  @override
  final String? fullNumber;
  @override
  final String? id;

  @override
  String toString() {
    return 'Phone(dialCode: $dialCode, countryCode: $countryCode, number: $number, fullNumber: $fullNumber, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Phone &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.fullNumber, fullNumber) ||
                other.fullNumber == fullNumber) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dialCode, countryCode, number, fullNumber, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneCopyWith<_$_Phone> get copyWith =>
      __$$_PhoneCopyWithImpl<_$_Phone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneToJson(
      this,
    );
  }
}

abstract class _Phone implements Phone {
  const factory _Phone(
      {final String? dialCode,
      final String? countryCode,
      final String? number,
      final String? fullNumber,
      final String? id}) = _$_Phone;

  factory _Phone.fromJson(Map<String, dynamic> json) = _$_Phone.fromJson;

  @override
  String? get dialCode;
  @override
  String? get countryCode;
  @override
  String? get number;
  @override
  String? get fullNumber;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneCopyWith<_$_Phone> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountUserModelPreferences _$AccountUserModelPreferencesFromJson(
    Map<String, dynamic> json) {
  return _AccountUserModelPreferences.fromJson(json);
}

/// @nodoc
mixin _$AccountUserModelPreferences {
  String? get primaryColor => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  bool? get isEmailNotificationEnabled => throw _privateConstructorUsedError;
  bool? get show4K => throw _privateConstructorUsedError;
  bool? get showTimestamp => throw _privateConstructorUsedError;
  bool? get showZoomed => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountUserModelPreferencesCopyWith<AccountUserModelPreferences>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUserModelPreferencesCopyWith<$Res> {
  factory $AccountUserModelPreferencesCopyWith(
          AccountUserModelPreferences value,
          $Res Function(AccountUserModelPreferences) then) =
      _$AccountUserModelPreferencesCopyWithImpl<$Res,
          AccountUserModelPreferences>;
  @useResult
  $Res call(
      {String? primaryColor,
      String? timezone,
      bool? isEmailNotificationEnabled,
      bool? show4K,
      bool? showTimestamp,
      bool? showZoomed,
      String? theme});
}

/// @nodoc
class _$AccountUserModelPreferencesCopyWithImpl<$Res,
        $Val extends AccountUserModelPreferences>
    implements $AccountUserModelPreferencesCopyWith<$Res> {
  _$AccountUserModelPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? timezone = freezed,
    Object? isEmailNotificationEnabled = freezed,
    Object? show4K = freezed,
    Object? showTimestamp = freezed,
    Object? showZoomed = freezed,
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailNotificationEnabled: freezed == isEmailNotificationEnabled
          ? _value.isEmailNotificationEnabled
          : isEmailNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      show4K: freezed == show4K
          ? _value.show4K
          : show4K // ignore: cast_nullable_to_non_nullable
              as bool?,
      showTimestamp: freezed == showTimestamp
          ? _value.showTimestamp
          : showTimestamp // ignore: cast_nullable_to_non_nullable
              as bool?,
      showZoomed: freezed == showZoomed
          ? _value.showZoomed
          : showZoomed // ignore: cast_nullable_to_non_nullable
              as bool?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountUserModelPreferencesCopyWith<$Res>
    implements $AccountUserModelPreferencesCopyWith<$Res> {
  factory _$$_AccountUserModelPreferencesCopyWith(
          _$_AccountUserModelPreferences value,
          $Res Function(_$_AccountUserModelPreferences) then) =
      __$$_AccountUserModelPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? primaryColor,
      String? timezone,
      bool? isEmailNotificationEnabled,
      bool? show4K,
      bool? showTimestamp,
      bool? showZoomed,
      String? theme});
}

/// @nodoc
class __$$_AccountUserModelPreferencesCopyWithImpl<$Res>
    extends _$AccountUserModelPreferencesCopyWithImpl<$Res,
        _$_AccountUserModelPreferences>
    implements _$$_AccountUserModelPreferencesCopyWith<$Res> {
  __$$_AccountUserModelPreferencesCopyWithImpl(
      _$_AccountUserModelPreferences _value,
      $Res Function(_$_AccountUserModelPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryColor = freezed,
    Object? timezone = freezed,
    Object? isEmailNotificationEnabled = freezed,
    Object? show4K = freezed,
    Object? showTimestamp = freezed,
    Object? showZoomed = freezed,
    Object? theme = freezed,
  }) {
    return _then(_$_AccountUserModelPreferences(
      primaryColor: freezed == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailNotificationEnabled: freezed == isEmailNotificationEnabled
          ? _value.isEmailNotificationEnabled
          : isEmailNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      show4K: freezed == show4K
          ? _value.show4K
          : show4K // ignore: cast_nullable_to_non_nullable
              as bool?,
      showTimestamp: freezed == showTimestamp
          ? _value.showTimestamp
          : showTimestamp // ignore: cast_nullable_to_non_nullable
              as bool?,
      showZoomed: freezed == showZoomed
          ? _value.showZoomed
          : showZoomed // ignore: cast_nullable_to_non_nullable
              as bool?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountUserModelPreferences implements _AccountUserModelPreferences {
  const _$_AccountUserModelPreferences(
      {this.primaryColor,
      this.timezone,
      this.isEmailNotificationEnabled,
      this.show4K,
      this.showTimestamp,
      this.showZoomed,
      this.theme});

  factory _$_AccountUserModelPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_AccountUserModelPreferencesFromJson(json);

  @override
  final String? primaryColor;
  @override
  final String? timezone;
  @override
  final bool? isEmailNotificationEnabled;
  @override
  final bool? show4K;
  @override
  final bool? showTimestamp;
  @override
  final bool? showZoomed;
  @override
  final String? theme;

  @override
  String toString() {
    return 'AccountUserModelPreferences(primaryColor: $primaryColor, timezone: $timezone, isEmailNotificationEnabled: $isEmailNotificationEnabled, show4K: $show4K, showTimestamp: $showTimestamp, showZoomed: $showZoomed, theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountUserModelPreferences &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.isEmailNotificationEnabled,
                    isEmailNotificationEnabled) ||
                other.isEmailNotificationEnabled ==
                    isEmailNotificationEnabled) &&
            (identical(other.show4K, show4K) || other.show4K == show4K) &&
            (identical(other.showTimestamp, showTimestamp) ||
                other.showTimestamp == showTimestamp) &&
            (identical(other.showZoomed, showZoomed) ||
                other.showZoomed == showZoomed) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, primaryColor, timezone,
      isEmailNotificationEnabled, show4K, showTimestamp, showZoomed, theme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountUserModelPreferencesCopyWith<_$_AccountUserModelPreferences>
      get copyWith => __$$_AccountUserModelPreferencesCopyWithImpl<
          _$_AccountUserModelPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountUserModelPreferencesToJson(
      this,
    );
  }
}

abstract class _AccountUserModelPreferences
    implements AccountUserModelPreferences {
  const factory _AccountUserModelPreferences(
      {final String? primaryColor,
      final String? timezone,
      final bool? isEmailNotificationEnabled,
      final bool? show4K,
      final bool? showTimestamp,
      final bool? showZoomed,
      final String? theme}) = _$_AccountUserModelPreferences;

  factory _AccountUserModelPreferences.fromJson(Map<String, dynamic> json) =
      _$_AccountUserModelPreferences.fromJson;

  @override
  String? get primaryColor;
  @override
  String? get timezone;
  @override
  bool? get isEmailNotificationEnabled;
  @override
  bool? get show4K;
  @override
  bool? get showTimestamp;
  @override
  bool? get showZoomed;
  @override
  String? get theme;
  @override
  @JsonKey(ignore: true)
  _$$_AccountUserModelPreferencesCopyWith<_$_AccountUserModelPreferences>
      get copyWith => throw _privateConstructorUsedError;
}

Preset _$PresetFromJson(Map<String, dynamic> json) {
  return _Preset.fromJson(json);
}

/// @nodoc
mixin _$Preset {
  int? get maxDocSize => throw _privateConstructorUsedError;
  int? get totalSpace => throw _privateConstructorUsedError;
  int? get totalSpaceUsed => throw _privateConstructorUsedError;
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
  $Res call(
      {int? maxDocSize, int? totalSpace, int? totalSpaceUsed, String? color});
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
    Object? maxDocSize = freezed,
    Object? totalSpace = freezed,
    Object? totalSpaceUsed = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      maxDocSize: freezed == maxDocSize
          ? _value.maxDocSize
          : maxDocSize // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpace: freezed == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpaceUsed: freezed == totalSpaceUsed
          ? _value.totalSpaceUsed
          : totalSpaceUsed // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {int? maxDocSize, int? totalSpace, int? totalSpaceUsed, String? color});
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
    Object? maxDocSize = freezed,
    Object? totalSpace = freezed,
    Object? totalSpaceUsed = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_Preset(
      maxDocSize: freezed == maxDocSize
          ? _value.maxDocSize
          : maxDocSize // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpace: freezed == totalSpace
          ? _value.totalSpace
          : totalSpace // ignore: cast_nullable_to_non_nullable
              as int?,
      totalSpaceUsed: freezed == totalSpaceUsed
          ? _value.totalSpaceUsed
          : totalSpaceUsed // ignore: cast_nullable_to_non_nullable
              as int?,
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
  const _$_Preset(
      {this.maxDocSize, this.totalSpace, this.totalSpaceUsed, this.color});

  factory _$_Preset.fromJson(Map<String, dynamic> json) =>
      _$$_PresetFromJson(json);

  @override
  final int? maxDocSize;
  @override
  final int? totalSpace;
  @override
  final int? totalSpaceUsed;
  @override
  final String? color;

  @override
  String toString() {
    return 'Preset(maxDocSize: $maxDocSize, totalSpace: $totalSpace, totalSpaceUsed: $totalSpaceUsed, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preset &&
            (identical(other.maxDocSize, maxDocSize) ||
                other.maxDocSize == maxDocSize) &&
            (identical(other.totalSpace, totalSpace) ||
                other.totalSpace == totalSpace) &&
            (identical(other.totalSpaceUsed, totalSpaceUsed) ||
                other.totalSpaceUsed == totalSpaceUsed) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxDocSize, totalSpace, totalSpaceUsed, color);

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
  const factory _Preset(
      {final int? maxDocSize,
      final int? totalSpace,
      final int? totalSpaceUsed,
      final String? color}) = _$_Preset;

  factory _Preset.fromJson(Map<String, dynamic> json) = _$_Preset.fromJson;

  @override
  int? get maxDocSize;
  @override
  int? get totalSpace;
  @override
  int? get totalSpaceUsed;
  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$_PresetCopyWith<_$_Preset> get copyWith =>
      throw _privateConstructorUsedError;
}
