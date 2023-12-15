import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/common_widgets/empty_state_widget.dart';
import 'package:movie_app/common_widgets/my_app_bar.dart';
import 'package:movie_app/features/favourite_movies/data/favourites_repository.dart';
import 'package:movie_app/features/popular_movies/controller/popular_movies_screen_controller.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/features/popular_movies/widgets/movie_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/helpers/snackbar_helper.dart';
import 'package:movie_app/routing/go_router.dart';

class PopularMoviesScreen extends ConsumerStatefulWidget {
  const PopularMoviesScreen({super.key});

  @override
  ConsumerState<PopularMoviesScreen> createState() =>
      _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends ConsumerState<PopularMoviesScreen> {
  ScrollController scrollController = ScrollController();
  late StreamSubscription<InternetStatus> internetConnectionServiceListener;
  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    internetConnectionServiceListener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          break;
        case InternetStatus.disconnected:
          SnackbarHelper.showMySnackbar(
              context, AppLocalizations.of(context).noInternetMessage);
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    internetConnectionServiceListener.cancel();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await ref
            .read(popularMoviesListScreenControllerProvider.notifier)
            .fetchMoreMovies();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(popularMoviesListScreenControllerProvider);
    final favouriteIds = ref.watch(fetchFavouriteIdsListProvider.notifier);
    List<Movie>? movies = state.value?.movies;

    return PopScope(
      canPop: false,
      child: Scaffold(
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
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 40.h),
                  controller: scrollController,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: (movies?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index < (movies?.length ?? 0)) {
                      Movie movie = movies![index];
                      return MovieListItem(
                        isFavourite:
                            (favouriteIds.state ?? []).contains(movie.id),
                        movie: movie,
                        onTap: () => context.goNamed(
                          AppRoute.movieDetailsScreen.name,
                          pathParameters: {'id': movie.id.toString()},
                        ),
                      );
                    } else if (!state.isLoading && (movies?.isEmpty ?? false)) {
                      return EmptyStateWidget(
                        onRefresh: () => ref.refresh(
                            popularMoviesListScreenControllerProvider.future),
                      );
                    } else if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
