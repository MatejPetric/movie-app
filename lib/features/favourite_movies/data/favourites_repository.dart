import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/popular_movies/data/movie_repository.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/services/storage/hive_storage_service.dart';

class FavouritesRepository {
  HiveStorageService hiveStorageService;

  FavouritesRepository({
    required this.hiveStorageService,
  });

  Future<void> saveOrRemoveFavouriteIdLocally({
    required int id,
  }) async {
    if (hiveStorageService.hasValue<int>(
        key: id.toString(), boxName: HiveBoxesEnum.favorites.name)) {
      await hiveStorageService.deleteValue<int>(
        key: id.toString(),
        boxName: HiveBoxesEnum.favorites.name,
      );
    } else {
      await hiveStorageService.setValue<int>(
        key: id.toString(),
        data: id,
        boxName: HiveBoxesEnum.favorites.name,
      );
    }
  }

  List<int>? fetchFavouriteIdsLocally() {
    final localFavouriteIds =
        hiveStorageService.getAll<int>(boxName: HiveBoxesEnum.favorites.name);
    return localFavouriteIds;
  }
}

final favouritesRepositoryProvider = Provider((ref) {
  final hiveStorageService = ref.read(hiveStorageServiceProvider);

  return FavouritesRepository(
    hiveStorageService: hiveStorageService,
  );
});

final fetchFavouriteIdsListProvider = StateProvider((ref) {
  final favouritesRepository = ref.read(favouritesRepositoryProvider);
  return favouritesRepository.fetchFavouriteIdsLocally();
});

final favouriteMoviesListProvider = StateProvider<List<Movie>?>((ref) {
  final favouriteIdsList =
      ref.watch(fetchFavouriteIdsListProvider.notifier).state;

  final localMovies = ref.watch(moviesLocalListProvider);

  List<Movie>? favoriteMovies = (localMovies ?? [])
      .where((element) => (favouriteIdsList ?? []).contains(element.id))
      .toList();

  return favoriteMovies;
});
