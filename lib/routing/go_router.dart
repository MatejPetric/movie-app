import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/movie_details/movie_details_screen.dart';
import 'package:movie_app/features/popular_movies/popular_movies_screen.dart';

enum AppRoute {
  popularMoviesScreen,
  movieDetailsScreen,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          name: AppRoute.popularMoviesScreen.name,
          parentNavigatorKey: _rootNavigatorKey,
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const PopularMoviesScreen(),
          ),
          routes: [
            GoRoute(
              path: 'details/:id',
              name: AppRoute.movieDetailsScreen.name,
              pageBuilder: (context, state) {
                final id = state.pathParameters['id']!;
                return MaterialPage(
                  child: MovieDetailsScreen(id: id),
                );
              },
            ),
          ],
        )
      ]);
});
