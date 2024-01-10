// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountsModel _$$_AccountsModelFromJson(Map<String, dynamic> json) =>
    _$_AccountsModel(
      preset: json['preset'] == null
          ? null
          : Preset.fromJson(json['preset'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      dob: json['dob'] as String?,
      dp: json['dp'] as String?,
      designation: json['designation'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: json['phone'] == null
          ? null
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
      hiddenProjects: json['hiddenProjects'] as List<dynamic>?,
      accountsModelId: json['accountsModelId'] as String?,
      dpUrl: json['dpUrl'] as String?,
    );

Map<String, dynamic> _$$_AccountsModelToJson(_$_AccountsModel instance) =>
    <String, dynamic>{
      'preset': instance.preset,
      'preferences': instance.preferences,
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'dob': instance.dob,
      'dp': instance.dp,
      'designation': instance.designation,
      'tags': instance.tags,
      'projects': instance.projects,
      'phone': instance.phone,
      'hiddenProjects': instance.hiddenProjects,
      'accountsModelId': instance.accountsModelId,
      'dpUrl': instance.dpUrl,
    };

_$_Phone _$$_PhoneFromJson(Map<String, dynamic> json) => _$_Phone(
      dialCode: json['dialCode'] as String?,
      countryCode: json['countryCode'] as String?,
      number: json['number'] as String?,
      fullNumber: json['fullNumber'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_PhoneToJson(_$_Phone instance) => <String, dynamic>{
      'dialCode': instance.dialCode,
      'countryCode': instance.countryCode,
      'number': instance.number,
      'fullNumber': instance.fullNumber,
      'id': instance.id,
    };

_$_Preferences _$$_PreferencesFromJson(Map<String, dynamic> json) =>
    _$_Preferences(
      primaryColor: json['primaryColor'] as String?,
      timezone: json['timezone'] as String?,
      isEmailNotificationEnabled: json['isEmailNotificationEnabled'] as bool?,
      show4K: json['show4K'] as bool?,
      showTimestamp: json['showTimestamp'] as bool?,
      showZoomed: json['showZoomed'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$$_PreferencesToJson(_$_Preferences instance) =>
    <String, dynamic>{
      'primaryColor': instance.primaryColor,
      'timezone': instance.timezone,
      'isEmailNotificationEnabled': instance.isEmailNotificationEnabled,
      'show4K': instance.show4K,
      'showTimestamp': instance.showTimestamp,
      'showZoomed': instance.showZoomed,
      'theme': instance.theme,
    };

_$_Preset _$$_PresetFromJson(Map<String, dynamic> json) => _$_Preset(
      maxDocSize: json['maxDocSize'] as int?,
      totalSpace: json['totalSpace'] as int?,
      totalSpaceUsed: json['totalSpaceUsed'] as int?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$_PresetToJson(_$_Preset instance) => <String, dynamic>{
      'maxDocSize': instance.maxDocSize,
      'totalSpace': instance.totalSpace,
      'totalSpaceUsed': instance.totalSpaceUsed,
      'color': instance.color,
    };

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      parentId: json['parentId'] as String?,
      hasCameras: json['hasCameras'] as bool?,
      hierarchyLevel: json['hierarchyLevel'] as int?,
      projectId: json['projectId'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'location': instance.location,
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'status': instance.status,
      'parentId': instance.parentId,
      'hasCameras': instance.hasCameras,
      'hierarchyLevel': instance.hierarchyLevel,
      'projectId': instance.projectId,
      'coverImageUrl': instance.coverImageUrl,
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      name: json['name'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      name: json['name'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
