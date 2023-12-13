import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/genre_response.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/features/popular_movies/domain/movie_response.dart';
import 'package:movie_app/services/network/api_endpoints.dart';
import 'package:movie_app/services/network/api_service.dart';
import 'package:movie_app/services/storage/hive_storage_service.dart';

class MovieRepository {
  ApiService apiService;
  HiveStorageService hiveStorageService;

  MovieRepository({
    required this.apiService,
    required this.hiveStorageService,
  });

  Future<List<Movie>?> fetchPopularMovies(int page) async {
    return await apiService.request(
      endpoint: '${apiEndpoints.movieList}?page=$page',
      httpMethod: HttpMethod.get,
      onSuccess: (responseData) async {
        MovieResponse movieResponse = MovieResponse.fromJson(responseData);
        return movieResponse.results;
      },
      onError: (error) {
        if (kDebugMode) {
          print(error);
        }
        throw Exception(error);
      },
    );
  }

  Future<List<Genre>?> fetchGenreList() async {
    return await apiService.request(
      endpoint: apiEndpoints.genreList,
      httpMethod: HttpMethod.get,
      onSuccess: (responseData) async {
        GenreResponse genreResponse = GenreResponse.fromJson(responseData);
        return genreResponse.genres;
      },
      onError: (error) {
        if (kDebugMode) {
          print(error);
        }
        throw Exception(error);
      },
    );
  }

  Future<void> saveMoviesLocally({
    required List<Movie> movies,
  }) async {
    for (final movie in movies) {
      await hiveStorageService.setValue<Movie>(
        key: movie.id.toString(),
        data: movie,
        boxName: HiveBoxesEnum.movies.name,
      );
    }
  }
}

final movieRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final hiveStorageService = ref.watch(hiveStorageServiceProvider);

  return MovieRepository(
    apiService: apiService,
    hiveStorageService: hiveStorageService,
  );
});

final popularMovieListProvider = FutureProvider<List<Movie>?>((ref) async {
  return await ref.read(movieRepositoryProvider).fetchPopularMovies(1);
});

final genreListProvider = FutureProvider<List<Genre>?>((ref) async {
  return await ref.read(movieRepositoryProvider).fetchGenreList();
});
