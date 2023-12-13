import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common_widgets/cached_network_image_widget.dart';
import 'package:movie_app/common_widgets/genres_wrap_widget.dart';
import 'package:movie_app/common_widgets/movie_rating_widget.dart';
import 'package:movie_app/features/popular_movies/data/movie_repository.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/features/popular_movies/domain/movie.dart';
import 'package:movie_app/services/network/api_endpoints.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  const MovieListItem({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImageWidget(
              url: "${ApiEndpoints.posterBase}${movie.posterPath}",
              borderRadius: BorderRadius.circular(4.r),
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(width: 16.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  const MovieRatingWidget(rating: 8.2),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 24.h,
                    child: Consumer(builder: (context, ref, child) {
                      List<int>? genreIds = movie.genreIds;
                      AsyncValue<List<Genre>?> genres =
                          ref.watch(genreListProvider);

                      List<Genre> filteredGenres = (genres.value ?? [])
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
