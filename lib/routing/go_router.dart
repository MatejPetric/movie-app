import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/bottom_navigation/bottom_navigation_screen.dart';
import 'package:movie_app/features/favourite_movies/favourite_movies_screen.dart';
import 'package:movie_app/features/movie_details/movie_details_screen.dart';
import 'package:movie_app/features/popular_movies/popular_movies_screen.dart';

enum AppRoute {
  popularMoviesScreen,
  movieDetailsScreen,
  favouriteMoviesScreen,
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigator,
          pageBuilder: (context, state, child) => MaterialPage(
            key: state.pageKey,
            child: BottomNavigationScreen(
              key: state.pageKey,
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              name: AppRoute.popularMoviesScreen.name,
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
            ),
            GoRoute(
              name: AppRoute.favouriteMoviesScreen.name,
              path: '/favourite',
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const FavouriteMoviesScreen(),
              ),
              routes: const [],
            )
          ],
        )
      ]);
});
