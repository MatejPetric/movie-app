// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@Freezed()
class MovieDetails with _$MovieDetails {
  @JsonSerializable(explicitToJson: true)
  const factory MovieDetails({
    required int id,
    required String title,
    required String tagline,
    required List<Genre> genres,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'poster_path') required String posterPath,
    required String overview,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
