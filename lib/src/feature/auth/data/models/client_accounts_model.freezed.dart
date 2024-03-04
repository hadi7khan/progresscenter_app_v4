// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_accounts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientAccountsModel _$ClientAccountsModelFromJson(Map<String, dynamic> json) {
  return _ClientAccountsModel.fromJson(json);
}

/// @nodoc
mixin _$ClientAccountsModel {
  Preferences? get preferences => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get clientAccountsModelId => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientAccountsModelCopyWith<ClientAccountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientAccountsModelCopyWith<$Res> {
  factory $ClientAccountsModelCopyWith(
          ClientAccountsModel value, $Res Function(ClientAccountsModel) then) =
      _$ClientAccountsModelCopyWithImpl<$Res, ClientAccountsModel>;
  @useResult
  $Res call(
      {Preferences? preferences,
      String? id,
      String? name,
      String? logo,
      String? clientAccountsModelId,
      String? logoUrl});

  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$ClientAccountsModelCopyWithImpl<$Res, $Val extends ClientAccountsModel>
    implements $ClientAccountsModelCopyWith<$Res> {
  _$ClientAccountsModelCopyWithImpl(this._value, this._then);

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
    Object? logo = freezed,
    Object? clientAccountsModelId = freezed,
    Object? logoUrl = freezed,
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
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAccountsModelId: freezed == clientAccountsModelId
          ? _value.clientAccountsModelId
          : clientAccountsModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ClientAccountsModelCopyWith<$Res>
    implements $ClientAccountsModelCopyWith<$Res> {
  factory _$$_ClientAccountsModelCopyWith(_$_ClientAccountsModel value,
          $Res Function(_$_ClientAccountsModel) then) =
      __$$_ClientAccountsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Preferences? preferences,
      String? id,
      String? name,
      String? logo,
      String? clientAccountsModelId,
      String? logoUrl});

  @override
  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$_ClientAccountsModelCopyWithImpl<$Res>
    extends _$ClientAccountsModelCopyWithImpl<$Res, _$_ClientAccountsModel>
    implements _$$_ClientAccountsModelCopyWith<$Res> {
  __$$_ClientAccountsModelCopyWithImpl(_$_ClientAccountsModel _value,
      $Res Function(_$_ClientAccountsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? clientAccountsModelId = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_$_ClientAccountsModel(
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
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAccountsModelId: freezed == clientAccountsModelId
          ? _value.clientAccountsModelId
          : clientAccountsModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientAccountsModel implements _ClientAccountsModel {
  const _$_ClientAccountsModel(
      {this.preferences,
      this.id,
      this.name,
      this.logo,
      this.clientAccountsModelId,
      this.logoUrl});

  factory _$_ClientAccountsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClientAccountsModelFromJson(json);

  @override
  final Preferences? preferences;
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? logo;
  @override
  final String? clientAccountsModelId;
  @override
  final String? logoUrl;

  @override
  String toString() {
    return 'ClientAccountsModel(preferences: $preferences, id: $id, name: $name, logo: $logo, clientAccountsModelId: $clientAccountsModelId, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientAccountsModel &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.clientAccountsModelId, clientAccountsModelId) ||
                other.clientAccountsModelId == clientAccountsModelId) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, preferences, id, name, logo, clientAccountsModelId, logoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientAccountsModelCopyWith<_$_ClientAccountsModel> get copyWith =>
      __$$_ClientAccountsModelCopyWithImpl<_$_ClientAccountsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientAccountsModelToJson(
      this,
    );
  }
}

abstract class _ClientAccountsModel implements ClientAccountsModel {
  const factory _ClientAccountsModel(
      {final Preferences? preferences,
      final String? id,
      final String? name,
      final String? logo,
      final String? clientAccountsModelId,
      final String? logoUrl}) = _$_ClientAccountsModel;

  factory _ClientAccountsModel.fromJson(Map<String, dynamic> json) =
      _$_ClientAccountsModel.fromJson;

  @override
  Preferences? get preferences;
  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get logo;
  @override
  String? get clientAccountsModelId;
  @override
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ClientAccountsModelCopyWith<_$_ClientAccountsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return _Preferences.fromJson(json);
}

/// @nodoc
mixin _$Preferences {
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
  $Res call({String? primaryColor});
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
  }) {
    return _then(_value.copyWith(
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
  $Res call({String? primaryColor});
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
  }) {
    return _then(_$_Preferences(
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
  const _$_Preferences({this.primaryColor});

  factory _$_Preferences.fromJson(Map<String, dynamic> json) =>
      _$$_PreferencesFromJson(json);

  @override
  final String? primaryColor;

  @override
  String toString() {
    return 'Preferences(primaryColor: $primaryColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preferences &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, primaryColor);

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
  const factory _Preferences({final String? primaryColor}) = _$_Preferences;

  factory _Preferences.fromJson(Map<String, dynamic> json) =
      _$_Preferences.fromJson;

  @override
  String? get primaryColor;
  @override
  @JsonKey(ignore: true)
  _$$_PreferencesCopyWith<_$_Preferences> get copyWith =>
      throw _privateConstructorUsedError;
}
