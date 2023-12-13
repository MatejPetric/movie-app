// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'movie.freezed.dart';
part 'movie.g.dart';

@Freezed()
class Movie with _$Movie {
  @JsonSerializable(explicitToJson: true)
  @HiveType(typeId: 1, adapterName: 'MovieAdapter')
  const factory Movie({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) @JsonKey(name: 'genre_ids') required List<int> genreIds,
    @HiveField(3) required String overview,
    @HiveField(4) @JsonKey(name: 'poster_path') required String posterPath,
    @HiveField(5) @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
