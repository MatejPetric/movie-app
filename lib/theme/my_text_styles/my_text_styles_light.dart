import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/theme/my_colors/my_colors_light.dart';
import 'package:movie_app/theme/my_text_styles/my_text_styles.dart';

final myTextStylesLight = MyTextStylesLight();

final class MyTextStylesLight extends MyTextStyles {
  @override
  TextStyle get h1 => TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 22.sp,
        color: myColorsLight.textDark,
        fontWeight: FontWeight.w600,
        height: 1.27.h,
      );

  @override
  TextStyle get h2 => TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 20.sp,
        color: myColorsLight.textDark,
        fontWeight: FontWeight.w600,
        height: 1.25.h,
      );

  @override
  TextStyle get h3 => TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 15.sp,
        color: myColorsLight.textDark,
        fontWeight: FontWeight.w600,
        height: 1.33.h,
      );

  @override
  TextStyle get h4 => TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 12.sp,
        color: myColorsLight.textDark,
        fontWeight: FontWeight.w400,
        height: 1.33.h,
      );

  @override
  TextStyle get h5 => TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        height: 1.33.h,
      );

  @override
  TextStyle get h6 => TextStyle(
        fontFamily: 'SF Pro',
        fontSize: 11.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        height: 1.18.h,
      );

  @override
  TextStyle get p1 => TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 13.sp,
        color: myColorsLight.textDark,
        fontWeight: FontWeight.w300,
        height: 1.38.h,
      );
}
