import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/bottom_navigation/controllers/bottom_navigation_controller.dart';
import 'package:movie_app/routing/go_router.dart';
import 'package:movie_app/theme/my_assets.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';
import 'package:movie_app/theme/my_colors/my_colors_light.dart';
import 'package:movie_app/theme/my_text_styles/my_text_styles_light.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(bottomNavigationControllerProvider);

    return BottomNavigationBar(
      currentIndex: position,
      onTap: (value) => _onTap(value, context, ref),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 0,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 0,
        fontWeight: FontWeight.w500,
      ),
      items: [
        buildBottomNavBarItem(
          index: 0,
          position: position,
          label: AppLocalizations.of(context).bottomBarMoviesLabel,
          icon: MyAssets.icons.popularMovie,
          context: context,
        ),
        buildBottomNavBarItem(
          index: 1,
          position: position,
          label: AppLocalizations.of(context).bottomBarFavouritesLabel,
          icon: MyAssets.icons.favoriteMovie,
          context: context,
        )
      ],
    );
  }
}

void _onTap(int index, BuildContext context, WidgetRef ref) {
  ref.read(bottomNavigationControllerProvider.notifier).setPosition(index);

  switch (index) {
    case 0:
      context.goNamed(AppRoute.popularMoviesScreen.name);
      break;
    case 1:
      context.goNamed(AppRoute.favouriteMoviesScreen.name);
      break;
    default:
  }
}

BottomNavigationBarItem buildBottomNavBarItem(
    {required int index,
    required int position,
    required String label,
    required String icon,
    required BuildContext context}) {
  bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  bool isSelected = position == index;
  Color colorFromTheme = isDark && isSelected
      ? myColorsDark.primary
      : isDark && !isSelected
          ? myColorsDark.textDark
          : !isDark && isSelected
              ? myColorsLight.primary
              : Colors.black;
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 36.w),
          height: 2.h,
          color: isSelected
              ? isDark
                  ? myColorsDark.primary
                  : myColorsLight.primary
              : Colors.transparent,
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,
                colorFilter: ColorFilter.mode(
                  colorFromTheme,
                  BlendMode.srcIn,
                )),
            const SizedBox(width: 8),
            Text(
              label,
              style: myTextStylesLight.h4
                  .copyWith(fontWeight: FontWeight.w600, color: colorFromTheme),
            ),
          ],
        ),
      ],
    ),
    label: '',
  );
}
