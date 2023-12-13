// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailsImpl _$$MovieDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailsImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      tagline: json['tagline'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$$MovieDetailsImplToJson(_$MovieDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tagline': instance.tagline,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'vote_average': instance.voteAverage,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
    };
