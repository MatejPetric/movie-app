import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/theme/my_assets.dart';

class MovieRatingWidget extends StatelessWidget {
  final double rating;
  const MovieRatingWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    String ratingRounded = rating.toStringAsFixed(2);
    return Row(
      children: [
        SvgPicture.asset(
          MyAssets.icons.star,
        ),
        SizedBox(width: 4.w),
        Text(
          '$ratingRounded / 10 IMDb',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
