// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';

part 'genre_response.freezed.dart';
part 'genre_response.g.dart';

@Freezed()
class GenreResponse with _$GenreResponse {
  @JsonSerializable(explicitToJson: true)
  const factory GenreResponse({
    required List<Genre> genres,
  }) = _GenreResponse;

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);
}
