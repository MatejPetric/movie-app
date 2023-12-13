import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common_widgets/my_app_bar.dart';
import 'package:movie_app/features/popular_movies/data/movie_repository.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/features/popular_movies/widgets/movie_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularMoviesScreen extends ConsumerWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Movie>?> movies = ref.watch(popularMovieListProvider);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h),
            Text(
              AppLocalizations.of(context).popularMovieListTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20.h),
            switch (movies) {
              AsyncData(:List<Movie>? value) => Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h),
                      itemCount: value?.length ?? 0,
                      itemBuilder: (context, index) {
                        Movie movie = value![index];
                        return MovieListItem(
                          movie: movie,
                          onTap: () => {},
                        );
                      }),
                ),
              AsyncError(:final error) => Text('Error: $error'),
              _ => const CircularProgressIndicator(),
            },
          ],
        ),
      ),
    );
  }
}
