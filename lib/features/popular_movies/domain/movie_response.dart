// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@Freezed()
class MovieResponse with _$MovieResponse {
  @JsonSerializable(explicitToJson: true)
  const factory MovieResponse({
    required int page,
    required List<Movie> results,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
