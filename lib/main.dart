import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/services/network/env_config.dart';
import 'package:movie_app/services/storage/hive_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EnvConfig.load();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(GenreAdapter());
  final hiveStorageService = HiveStorageService();
  await hiveStorageService.openBox<Movie>(HiveBoxesEnum.movies.name);
  await hiveStorageService.openBox<Genre>(HiveBoxesEnum.genres.name);
  await hiveStorageService.openBox<String>(HiveBoxesEnum.favorites.name);

  runApp(
    ProviderScope(
      overrides: [
        hiveStorageServiceProvider.overrideWithValue(hiveStorageService),
      ],
      child: const MyApp(),
    ),
  );
}
