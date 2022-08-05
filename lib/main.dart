import 'package:artuaista/pages/landing/landing_page.dart';
import 'package:artuaista/pages/wallpaper_list/wallpaper_list_page.dart';
import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_family.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Artuaista());
}

class Artuaista extends StatelessWidget {
  const Artuaista({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: FontFamilly.redHatDisplay,
        primaryColor: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primarySwatch,
          onPrimary: AppColors.textPrimary,
          secondary: AppColors.primaryVariation,
          onSecondary: AppColors.textPrimary,
          error: AppColors.textPrimary,
          onError: AppColors.primaryVariation,
          background: AppColors.background,
          onBackground: AppColors.onSurfaceBackground,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
        ),
      ),
      title: 'Artuaista',
      initialRoute: '/landing',
      routes: {
        "/landing": (context) => const LandingPage(),
        "/wallpaperList": (context) => WallpaperListPage(),
      },
    );
  }
}
