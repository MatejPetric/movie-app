import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/genre_response.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/features/popular_movies/domain/movie_response.dart';
import 'package:movie_app/services/network/api_endpoints.dart';
import 'package:movie_app/services/network/api_service.dart';
import 'package:movie_app/services/network/env_config.dart';

class MovieRepository {
  ApiService apiService;

  MovieRepository({
    required this.apiService,
  });

  Future<List<Movie>?> fetchPopularMovies(int page) async {
    String locale = Platform.localeName;

    return await apiService.request(
      endpoint:
          '${ApiEndpoints.movieList}?api_key=${EnvConfig.apiKey}&language=$locale&page=$page',
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
      endpoint: ApiEndpoints.genreList,
      httpMethod: HttpMethod.get,
      //TODO move that in separate file
      options: Options(headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4'
      }),
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
}

final movieRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceProvider);

  return MovieRepository(apiService: apiService);
});

final popularMovieListProvider = FutureProvider<List<Movie>?>((ref) async {
  return await ref.read(movieRepositoryProvider).fetchPopularMovies(1);
});

final genreListProvider = FutureProvider<List<Genre>?>((ref) async {
  return await ref.read(movieRepositoryProvider).fetchGenreList();
});
