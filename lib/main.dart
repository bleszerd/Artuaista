import 'package:artuaista/pages/error_page/error_page.dart';
import 'package:artuaista/pages/landing/landing_page.dart';
import 'package:artuaista/pages/wallpaper_details/wallpaper_details_page.dart';
import 'package:artuaista/pages/wallpaper_list/wallpaper_list_page.dart';
import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  runApp(const Artuaista());
}

class Artuaista extends StatelessWidget {
  const Artuaista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Paint.enableDithering = true;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.background),
    );

    ErrorWidget.builder = (details) => const ErrorPage();

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
        "/wallpapeDetails": (context) => const WallpaperDetailsPage(),
      },
    );
  }
}
