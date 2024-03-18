// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_comments_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageCommentsModel _$ImageCommentsModelFromJson(Map<String, dynamic> json) {
  return _ImageCommentsModel.fromJson(json);
}

/// @nodoc
mixin _$ImageCommentsModel {
  String? get url => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCommentsModelCopyWith<ImageCommentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCommentsModelCopyWith<$Res> {
  factory $ImageCommentsModelCopyWith(
          ImageCommentsModel value, $Res Function(ImageCommentsModel) then) =
      _$ImageCommentsModelCopyWithImpl<$Res, ImageCommentsModel>;
  @useResult
  $Res call({String? url, List<Comment>? comments});
}

/// @nodoc
class _$ImageCommentsModelCopyWithImpl<$Res, $Val extends ImageCommentsModel>
    implements $ImageCommentsModelCopyWith<$Res> {
  _$ImageCommentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageCommentsModelCopyWith<$Res>
    implements $ImageCommentsModelCopyWith<$Res> {
  factory _$$_ImageCommentsModelCopyWith(_$_ImageCommentsModel value,
          $Res Function(_$_ImageCommentsModel) then) =
      __$$_ImageCommentsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, List<Comment>? comments});
}

/// @nodoc
class __$$_ImageCommentsModelCopyWithImpl<$Res>
    extends _$ImageCommentsModelCopyWithImpl<$Res, _$_ImageCommentsModel>
    implements _$$_ImageCommentsModelCopyWith<$Res> {
  __$$_ImageCommentsModelCopyWithImpl(
      _$_ImageCommentsModel _value, $Res Function(_$_ImageCommentsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_ImageCommentsModel(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageCommentsModel implements _ImageCommentsModel {
  const _$_ImageCommentsModel({this.url, final List<Comment>? comments})
      : _comments = comments;

  factory _$_ImageCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageCommentsModelFromJson(json);

  @override
  final String? url;
  final List<Comment>? _comments;
  @override
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageCommentsModel(url: $url, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageCommentsModel &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCommentsModelCopyWith<_$_ImageCommentsModel> get copyWith =>
      __$$_ImageCommentsModelCopyWithImpl<_$_ImageCommentsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageCommentsModelToJson(
      this,
    );
  }
}

abstract class _ImageCommentsModel implements ImageCommentsModel {
  const factory _ImageCommentsModel(
      {final String? url,
      final List<Comment>? comments}) = _$_ImageCommentsModel;

  factory _ImageCommentsModel.fromJson(Map<String, dynamic> json) =
      _$_ImageCommentsModel.fromJson;

  @override
  String? get url;
  @override
  List<Comment>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCommentsModelCopyWith<_$_ImageCommentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
