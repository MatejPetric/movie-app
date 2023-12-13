import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common_widgets/genres_wrap_widget.dart';
import 'package:movie_app/common_widgets/movie_rating_widget.dart';
import 'package:movie_app/features/movie_details/domain/movie_details.dart';
import 'package:movie_app/theme/my_assets.dart';

class MovieDetailsSheetContent extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsSheetContent({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                movieDetails.title,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SvgPicture.asset(MyAssets.icons.bookmarkOff)
          ],
        ),
        SizedBox(height: 8.h),
        MovieRatingWidget(rating: movieDetails.voteAverage),
        SizedBox(height: 12.h),
        GenresWrapWidget(
          isLargeFont: true,
          genres: movieDetails.genres,
        ),
        SizedBox(height: 40.h),
        Text(
          'Description',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 8.h),
        Text(
          movieDetails.overview,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 64.h)
      ],
    );
  }
}
