// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/features/popular_movies/domain/movie.dart';

class PopularMoviesScreenState {
  final List<Movie>? movies;
  final int page;
  PopularMoviesScreenState({
    required this.page,
    this.movies,
  });

  PopularMoviesScreenState copyWith({
    List<Movie>? movies,
    int? page,
  }) {
    return PopularMoviesScreenState(
      movies: movies ?? this.movies,
      page: page ?? this.page,
    );
  }
}
