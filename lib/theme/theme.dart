import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';
import 'package:movie_app/theme/my_colors/my_colors_light.dart';
import 'package:movie_app/theme/my_text_styles/my_text_styles_dark.dart';
import 'package:movie_app/theme/my_text_styles/my_text_styles_light.dart';

final myTheme = MyTheme();

class MyTheme {
  ThemeData get lightTheme => ThemeData(
        primaryColor: myColorsLight.primary,
        scaffoldBackgroundColor: myColorsLight.background,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: myColorsLight.background,
        ),
        iconTheme: IconThemeData(color: myColorsLight.textDark),
        splashFactory: defaultTargetPlatform == TargetPlatform.android
            ? InkSparkle.splashFactory
            : NoSplash.splashFactory,
        splashColor: myColorsLight.splash,
        textTheme: TextTheme(
          titleLarge: myTextStylesLight.h1,
          titleMedium: myTextStylesLight.h2,
          headlineLarge: myTextStylesLight.h3,
          headlineMedium: myTextStylesLight.h4,
          headlineSmall: myTextStylesLight.h5,
          bodyLarge: myTextStylesLight.h6,
          bodyMedium: myTextStylesLight.p1,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: myColorsDark.primary,
        scaffoldBackgroundColor: myColorsDark.background,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: myColorsDark.background,
        ),
        iconTheme: IconThemeData(color: myColorsDark.textLight),
        splashFactory: defaultTargetPlatform == TargetPlatform.android
            ? InkSparkle.splashFactory
            : NoSplash.splashFactory,
        splashColor: myColorsDark.splash,
        textTheme: TextTheme(
          titleLarge: myTextStylesDark.h1,
          titleMedium: myTextStylesDark.h2,
          headlineLarge: myTextStylesDark.h3,
          headlineMedium: myTextStylesDark.h4,
          headlineSmall: myTextStylesDark.h5,
          bodyLarge: myTextStylesDark.h6,
          bodyMedium: myTextStylesDark.p1,
        ),
      );
}
