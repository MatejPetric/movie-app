import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/common_widgets/empty_state_widget.dart';
import 'package:movie_app/common_widgets/my_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/features/favourite_movies/data/favourites_repository.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/features/popular_movies/widgets/movie_list_item.dart';
import 'package:movie_app/routing/go_router.dart';

class FavouriteMoviesScreen extends ConsumerWidget {
  const FavouriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Movie>? favorites = ref.watch(favouriteMoviesListProvider);
    final favouriteIds = ref.watch(fetchFavouriteIdsListProvider.notifier);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h),
            Text(
              AppLocalizations.of(context).favouritesMovieListTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20.h),
            (favorites ?? []).isEmpty
                ? const Center(child: EmptyStateWidget())
                : Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 40.h),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: (favorites?.length ?? 0),
                      itemBuilder: (context, index) {
                        Movie movie = favorites![index];
                        return MovieListItem(
                          isFavourite:
                              (favouriteIds.state ?? []).contains(movie.id),
                          movie: movie,
                          onTap: () => context.goNamed(
                            AppRoute.movieDetailsScreen.name,
                            pathParameters: {'id': movie.id.toString()},
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
