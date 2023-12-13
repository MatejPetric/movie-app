// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) {
  return _GenreResponse.fromJson(json);
}

/// @nodoc
mixin _$GenreResponse {
  List<Genre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreResponseCopyWith<GenreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreResponseCopyWith<$Res> {
  factory $GenreResponseCopyWith(
          GenreResponse value, $Res Function(GenreResponse) then) =
      _$GenreResponseCopyWithImpl<$Res, GenreResponse>;
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class _$GenreResponseCopyWithImpl<$Res, $Val extends GenreResponse>
    implements $GenreResponseCopyWith<$Res> {
  _$GenreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreResponseImplCopyWith<$Res>
    implements $GenreResponseCopyWith<$Res> {
  factory _$$GenreResponseImplCopyWith(
          _$GenreResponseImpl value, $Res Function(_$GenreResponseImpl) then) =
      __$$GenreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> genres});
}

/// @nodoc
class __$$GenreResponseImplCopyWithImpl<$Res>
    extends _$GenreResponseCopyWithImpl<$Res, _$GenreResponseImpl>
    implements _$$GenreResponseImplCopyWith<$Res> {
  __$$GenreResponseImplCopyWithImpl(
      _$GenreResponseImpl _value, $Res Function(_$GenreResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$GenreResponseImpl(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GenreResponseImpl implements _GenreResponse {
  const _$GenreResponseImpl({required final List<Genre> genres})
      : _genres = genres;

  factory _$GenreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreResponseImplFromJson(json);

  final List<Genre> _genres;
  @override
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'GenreResponse(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreResponseImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      __$$GenreResponseImplCopyWithImpl<_$GenreResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreResponseImplToJson(
      this,
    );
  }
}

abstract class _GenreResponse implements GenreResponse {
  const factory _GenreResponse({required final List<Genre> genres}) =
      _$GenreResponseImpl;

  factory _GenreResponse.fromJson(Map<String, dynamic> json) =
      _$GenreResponseImpl.fromJson;

  @override
  List<Genre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$GenreResponseImplCopyWith<_$GenreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
