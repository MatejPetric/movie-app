import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/features/popular_movies/controller/popular_movies_screen_state.dart';
import 'package:movie_app/features/popular_movies/data/movie_repository.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';

class PopularMoviesListScreenController
    extends AutoDisposeAsyncNotifier<PopularMoviesScreenState> {
  @override
  Future<PopularMoviesScreenState> build() async {
    if (await InternetConnection().hasInternetAccess) {
      List<Genre>? genres = await _fetchGenres();
      await saveGenresLocally(genres);
      return _fetchMovies();
    } else {
      return fetchMoviesLocally();
    }
  }

  Future<PopularMoviesScreenState> _fetchMovies() async {
    state = const AsyncValue.loading();
    int currentPage = state.value?.page ?? 1;
    List<Movie>? currentMovies = state.value?.movies;
    List<Movie>? movies = await ref.read(
      popularMovieListProvider(currentPage),
    );

    await saveMoviesLocally(movies);
    return PopularMoviesScreenState(
      movies: [...?currentMovies, ...?movies],
      page: currentPage + 1,
    );
  }

  Future<void> fetchMoreMovies() async {
    state = await AsyncValue.guard(() async {
      return _fetchMovies();
    });
  }

  Future<void> saveMoviesLocally(List<Movie>? movies) async {
    if (movies != null) {
      await ref.read(movieRepositoryProvider).saveMoviesLocally(movies: movies);
    }
  }

  Future<List<Genre>?> _fetchGenres() async {
    return await ref.read(genreListProvider.future);
  }

  Future<void> saveGenresLocally(List<Genre>? genres) async {
    if (genres != null) {
      await ref.read(movieRepositoryProvider).saveGenresLocally(genres: genres);
    }
  }

  Future<PopularMoviesScreenState> fetchMoviesLocally() async {
    List<Movie>? movies =
        ref.read(movieRepositoryProvider).fetchMoviesLocally();
    late int page;
    if (movies?.isNotEmpty ?? false) {
      page = (movies!.length / 20).floor();
    } else {
      page = 1;
    }
    return PopularMoviesScreenState(movies: movies, page: page);
  }
}

final popularMoviesListScreenControllerProvider =
    AsyncNotifierProvider.autoDispose<PopularMoviesListScreenController,
        PopularMoviesScreenState>(() {
  return PopularMoviesListScreenController();
});
