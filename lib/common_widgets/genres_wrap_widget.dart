import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/popular_movies/domain/genre.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';
import 'package:movie_app/theme/my_colors/my_colors_light.dart';

class GenresWrapWidget extends StatelessWidget {
  final bool isLargeFont;
  final List<Genre> genres;
  const GenresWrapWidget({
    super.key,
    required this.genres,
    this.isLargeFont = false,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.w,
      runSpacing: 4.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: genres.map((genre) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
          decoration: BoxDecoration(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? myColorsDark.primaryFaded
                : myColorsLight.primaryFaded,
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
          child: Text(
            genre.name,
            style: isLargeFont
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }).toList(),
    );
  }
}
