import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/routing/go_router.dart';
import 'package:movie_app/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => Consumer(builder: (context, ref, child) {
              SystemChrome.setSystemUIOverlayStyle(
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? SystemUiOverlayStyle.light
                      : SystemUiOverlayStyle.dark);
              final goRouter = ref.watch(goRouterProvider);
              return MaterialApp.router(
                restorationScopeId: 'app',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('hr', ''),
                ],
                onGenerateTitle: (BuildContext context) =>
                    AppLocalizations.of(context).appTitle,
                theme: myTheme.lightTheme,
                darkTheme: myTheme.darkTheme,
                routerConfig: goRouter,
              );
            }));
  }
}
