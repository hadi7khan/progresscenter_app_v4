// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountsModel _$AccountsModelFromJson(Map<String, dynamic> json) {
  return _AccountsModel.fromJson(json);
}

/// @nodoc
mixin _$AccountsModel {
  Preset? get preset => throw _privateConstructorUsedError;
  Preferences? get preferences => throw _privateConstructorUsedError;
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get dp => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<ProjectModel>? get projects => throw _privateConstructorUsedError;
  Phone? get phone => throw _privateConstructorUsedError;
  List<String>? get hiddenProjects => throw _privateConstructorUsedError;
  String? get accountsModelId => throw _privateConstructorUsedError;
  String? get dpUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountsModelCopyWith<AccountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsModelCopyWith<$Res> {
  factory $AccountsModelCopyWith(
          AccountsModel value, $Res Function(AccountsModel) then) =
      _$AccountsModelCopyWithImpl<$Res, AccountsModel>;
  @useResult
  $Res call(
      {Preset? preset,
      Preferences? preferences,
      @JsonKey(name: "_id") String? id,
      String? name,
      String? username,
      String? email,
      String? role,
      String? status,
      String? dob,
      String? dp,
      String? designation,
      List<String>? tags,
      List<ProjectModel>? projects,
      Phone? phone,
      List<String>? hiddenProjects,
      String? accountsModelId,
      String? dpUrl});

  $PresetCopyWith<$Res>? get preset;
  $PreferencesCopyWith<$Res>? get preferences;
  $PhoneCopyWith<$Res>? get phone;
}

/// @nodoc
class _$AccountsModelCopyWithImpl<$Res, $Val extends AccountsModel>
    implements $AccountsModelCopyWith<$Res> {
  _$AccountsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? preferences = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? dob = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? tags = freezed,
    Object? projects = freezed,
    Object? phone = freezed,
    Object? hiddenProjects = freezed,
    Object? accountsModelId = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_value.copyWith(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
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
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      hiddenProjects: freezed == hiddenProjects
          ? _value.hiddenProjects
          : hiddenProjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountsModelId: freezed == accountsModelId
          ? _value.accountsModelId
          : accountsModelId // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$_AccountsModelCopyWith<$Res>
    implements $AccountsModelCopyWith<$Res> {
  factory _$$_AccountsModelCopyWith(
          _$_AccountsModel value, $Res Function(_$_AccountsModel) then) =
      __$$_AccountsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preset? preset,
      Preferences? preferences,
      @JsonKey(name: "_id") String? id,
      String? name,
      String? username,
      String? email,
      String? role,
      String? status,
      String? dob,
      String? dp,
      String? designation,
      List<String>? tags,
      List<ProjectModel>? projects,
      Phone? phone,
      List<String>? hiddenProjects,
      String? accountsModelId,
      String? dpUrl});

  @override
  $PresetCopyWith<$Res>? get preset;
  @override
  $PreferencesCopyWith<$Res>? get preferences;
  @override
  $PhoneCopyWith<$Res>? get phone;
}

/// @nodoc
class __$$_AccountsModelCopyWithImpl<$Res>
    extends _$AccountsModelCopyWithImpl<$Res, _$_AccountsModel>
    implements _$$_AccountsModelCopyWith<$Res> {
  __$$_AccountsModelCopyWithImpl(
      _$_AccountsModel _value, $Res Function(_$_AccountsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preset = freezed,
    Object? preferences = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? dob = freezed,
    Object? dp = freezed,
    Object? designation = freezed,
    Object? tags = freezed,
    Object? projects = freezed,
    Object? phone = freezed,
    Object? hiddenProjects = freezed,
    Object? accountsModelId = freezed,
    Object? dpUrl = freezed,
  }) {
    return _then(_$_AccountsModel(
      preset: freezed == preset
          ? _value.preset
          : preset // ignore: cast_nullable_to_non_nullable
              as Preset?,
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
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      dp: freezed == dp
          ? _value.dp
          : dp // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      hiddenProjects: freezed == hiddenProjects
          ? _value._hiddenProjects
          : hiddenProjects // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountsModelId: freezed == accountsModelId
          ? _value.accountsModelId
          : accountsModelId // ignore: cast_nullable_to_non_nullable
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
class _$_AccountsModel implements _AccountsModel {
  const _$_AccountsModel(
      {this.preset,
      this.preferences,
      @JsonKey(name: "_id") this.id,
      this.name,
      this.username,
      this.email,
      this.role,
      this.status,
      this.dob = "",
      this.dp,
      this.designation,
      final List<String>? tags,
      final List<ProjectModel>? projects,
      this.phone = const Phone(),
      final List<String>? hiddenProjects,
      this.accountsModelId,
      this.dpUrl})
      : _tags = tags,
        _projects = projects,
        _hiddenProjects = hiddenProjects;

  factory _$_AccountsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountsModelFromJson(json);

  @override
  final Preset? preset;
  @override
  final Preferences? preferences;
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
  final String? role;
  @override
  final String? status;
  @override
  @JsonKey()
  final String? dob;
  @override
  final String? dp;
  @override
  final String? designation;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectModel>? _projects;
  @override
  List<ProjectModel>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Phone? phone;
  final List<String>? _hiddenProjects;
  @override
  List<String>? get hiddenProjects {
    final value = _hiddenProjects;
    if (value == null) return null;
    if (_hiddenProjects is EqualUnmodifiableListView) return _hiddenProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? accountsModelId;
  @override
  final String? dpUrl;

  @override
  String toString() {
    return 'AccountsModel(preset: $preset, preferences: $preferences, id: $id, name: $name, username: $username, email: $email, role: $role, status: $status, dob: $dob, dp: $dp, designation: $designation, tags: $tags, projects: $projects, phone: $phone, hiddenProjects: $hiddenProjects, accountsModelId: $accountsModelId, dpUrl: $dpUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountsModel &&
            (identical(other.preset, preset) || other.preset == preset) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.dp, dp) || other.dp == dp) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._hiddenProjects, _hiddenProjects) &&
            (identical(other.accountsModelId, accountsModelId) ||
                other.accountsModelId == accountsModelId) &&
            (identical(other.dpUrl, dpUrl) || other.dpUrl == dpUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      preset,
      preferences,
      id,
      name,
      username,
      email,
      role,
      status,
      dob,
      dp,
      designation,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_projects),
      phone,
      const DeepCollectionEquality().hash(_hiddenProjects),
      accountsModelId,
      dpUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountsModelCopyWith<_$_AccountsModel> get copyWith =>
      __$$_AccountsModelCopyWithImpl<_$_AccountsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountsModelToJson(
      this,
    );
  }
}

abstract class _AccountsModel implements AccountsModel {
  const factory _AccountsModel(
      {final Preset? preset,
      final Preferences? preferences,
      @JsonKey(name: "_id") final String? id,
      final String? name,
      final String? username,
      final String? email,
      final String? role,
      final String? status,
      final String? dob,
      final String? dp,
      final String? designation,
      final List<String>? tags,
      final List<ProjectModel>? projects,
      final Phone? phone,
      final List<String>? hiddenProjects,
      final String? accountsModelId,
      final String? dpUrl}) = _$_AccountsModel;

  factory _AccountsModel.fromJson(Map<String, dynamic> json) =
      _$_AccountsModel.fromJson;

  @override
  Preset? get preset;
  @override
  Preferences? get preferences;
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
  String? get role;
  @override
  String? get status;
  @override
  String? get dob;
  @override
  String? get dp;
  @override
  String? get designation;
  @override
  List<String>? get tags;
  @override
  List<ProjectModel>? get projects;
  @override
  Phone? get phone;
  @override
  List<String>? get hiddenProjects;
  @override
  String? get accountsModelId;
  @override
  String? get dpUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AccountsModelCopyWith<_$_AccountsModel> get copyWith =>
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
      {this.dialCode = "",
      this.countryCode = "",
      this.number = "",
      this.fullNumber = "",
      this.id = ""});

  factory _$_Phone.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneFromJson(json);

  @override
  @JsonKey()
  final String? dialCode;
  @override
  @JsonKey()
  final String? countryCode;
  @override
  @JsonKey()
  final String? number;
  @override
  @JsonKey()
  final String? fullNumber;
  @override
  @JsonKey()
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

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
  String? get primaryColor => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  bool? get isEmailNotificationEnabled => throw _privateConstructorUsedError;
  bool? get show4K => throw _privateConstructorUsedError;
  bool? get showTimestamp => throw _privateConstructorUsedError;
  bool? get showZoomed => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;

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
abstract class _$$_PreferencesCopyWith<$Res>
    implements $PreferencesCopyWith<$Res> {
  factory _$$_PreferencesCopyWith(
          _$_Preferences value, $Res Function(_$_Preferences) then) =
      __$$_PreferencesCopyWithImpl<$Res>;
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
class __$$_PreferencesCopyWithImpl<$Res>
    extends _$PreferencesCopyWithImpl<$Res, _$_Preferences>
    implements _$$_PreferencesCopyWith<$Res> {
  __$$_PreferencesCopyWithImpl(
      _$_Preferences _value, $Res Function(_$_Preferences) _then)
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
    return _then(_$_Preferences(
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
class _$_Preferences implements _Preferences {
  const _$_Preferences(
      {this.primaryColor,
      this.timezone,
      this.isEmailNotificationEnabled,
      this.show4K,
      this.showTimestamp,
      this.showZoomed,
      this.theme});

  factory _$_Preferences.fromJson(Map<String, dynamic> json) =>
      _$$_PreferencesFromJson(json);

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
    return 'Preferences(primaryColor: $primaryColor, timezone: $timezone, isEmailNotificationEnabled: $isEmailNotificationEnabled, show4K: $show4K, showTimestamp: $showTimestamp, showZoomed: $showZoomed, theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preferences &&
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
      {final String? primaryColor,
      final String? timezone,
      final bool? isEmailNotificationEnabled,
      final bool? show4K,
      final bool? showTimestamp,
      final bool? showZoomed,
      final String? theme}) = _$_Preferences;

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$_Preferences.fromJson;

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
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      throw _privateConstructorUsedError;
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
