import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/movie_details/domain/movie_details.dart';
import 'package:movie_app/services/network/api_endpoints.dart';
import 'package:movie_app/services/network/api_service.dart';

class MovieDetailsRepository {
  ApiService apiService;

  MovieDetailsRepository({
    required this.apiService,
  });

  Future<MovieDetails> fetchMovieDetails(id) async {
    return await apiService.request(
      endpoint: '${apiEndpoints.movieDetails}/$id',
      httpMethod: HttpMethod.get,
      onSuccess: (responseData) async {
        return MovieDetails.fromJson(responseData);
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

final movieDetailsRepositoryProvider = Provider((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return MovieDetailsRepository(apiService: apiService);
});

final movieDetailsProvider = FutureProvider.family.autoDispose((ref, id) async {
  final movieDetailsRepository = ref.read(movieDetailsRepositoryProvider);
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 60), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  return await movieDetailsRepository.fetchMovieDetails(id);
});
