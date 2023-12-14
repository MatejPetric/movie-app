import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_app/common_widgets/cached_network_image_widget.dart';
import 'package:movie_app/common_widgets/genres_wrap_widget.dart';
import 'package:movie_app/common_widgets/movie_rating_widget.dart';
import 'package:movie_app/common_widgets/my_ink_well_widget.dart';
import 'package:movie_app/features/favourite_movies/data/favourites_repository.dart';
import 'package:movie_app/features/popular_movies/data/movie_repository.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/services/network/api_endpoints.dart';
import 'package:movie_app/theme/my_assets.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final bool isFavourite;
  const MovieListItem(
      {super.key,
      required this.movie,
      required this.onTap,
      required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await InternetConnection().hasInternetAccess ? onTap() : () {};
      },
      child: SizedBox(
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImageWidget(
              url: "${apiEndpoints.posterBase}${movie.posterPath}",
              borderRadius: BorderRadius.circular(4.r),
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(width: 16.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Consumer(
                        builder: (context, ref, child) {
                          return MyInkWellWidget(
                            builder: (isTapped) {
                              return (isFavourite
                                  ? SvgPicture.asset(MyAssets.icons.bookmarkOn)
                                  : SvgPicture.asset(
                                      isTapped
                                          ? MyAssets.icons.bookmarkFull
                                          : MyAssets.icons.bookmarkOff,
                                      colorFilter: ColorFilter.mode(
                                        isTapped
                                            ? myColorsDark.primary
                                            : myColorsDark.textLight,
                                        BlendMode.srcIn,
                                      ),
                                    ));
                            },
                            onTap: () {
                              ref
                                  .read(favouritesRepositoryProvider)
                                  .saveOrRemoveFavouriteIdLocally(id: movie.id);
                              ref.invalidate(fetchFavouriteIdsListProvider);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  const MovieRatingWidget(rating: 8.2),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 24.h,
                    child: Consumer(builder: (context, ref, child) {
                      List<int>? genreIds = movie.genreIds;
                      List<Genre>? genres = ref.read(genresLocalListProvider);
                      List<Genre>? filteredGenres = (genres ?? [])
                          .where((genre) => genreIds.contains(genre.id))
                          .toList();

                      return GenresWrapWidget(genres: filteredGenres);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
