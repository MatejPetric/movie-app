import 'package:flutter/material.dart';
import 'package:movie_app/theme/my_colors/my_colors.dart';

final myColorsLight = MyColorsLight();

class MyColorsLight extends MyColors {
  @override
  Color get background => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get primary => const Color.fromRGBO(37, 56, 153, 1);

  @override
  Color get primaryFaded => const Color.fromRGBO(37, 56, 153, 1);

  @override
  Color get secondary => const Color.fromRGBO(242, 207, 22, 1);

  @override
  Color get splash => const Color.fromRGBO(182, 5, 51, 0.28);

  @override
  Color get textDark => const Color.fromRGBO(58, 61, 70, 1);

  @override
  Color get textLight => const Color.fromRGBO(228, 236, 239, 1);
}
