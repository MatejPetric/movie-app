import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';
import 'package:movie_app/theme/my_colors/my_colors_light.dart';

class SheetWidget extends StatelessWidget {
  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;
  final Widget child;

  const SheetWidget({
    super.key,
    required this.initialChildSize,
    required this.maxChildSize,
    required this.minChildSize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      minChildSize: minChildSize,
      builder: (context, ScrollController scrollController) =>
          SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 28.h,
            horizontal: 20.w,
          ),
          decoration: BoxDecoration(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? myColorsDark.background
                : myColorsLight.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
