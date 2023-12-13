import 'package:flutter/material.dart';
import 'package:movie_app/theme/my_colors/my_colors.dart';

final myColorsDark = MyColorsDark();

class MyColorsDark extends MyColors {
  @override
  Color get background => const Color.fromRGBO(14, 19, 36, 1);

  @override
  Color get primary => const Color.fromRGBO(236, 155, 62, 1);

  @override
  Color get primaryFaded => const Color.fromRGBO(236, 155, 62, 0.2);

  @override
  Color get secondary => const Color.fromRGBO(242, 207, 22, 1);

  @override
  Color get splash => const Color.fromRGBO(182, 5, 51, 0.28);

  @override
  Color get textDark => const Color.fromRGBO(228, 236, 239, 1);

  @override
  Color get textLight => const Color.fromRGBO(228, 236, 239, 1);
}
