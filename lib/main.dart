import 'dart:ui';

import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_family.dart';
import 'package:artuaista/features/error/presentation/ui/pages/error_page.dart';
import 'package:artuaista/features/landing/presentation/ui/pages/landing_page.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/pages/wallpaper_details_page.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/pages/wallpaper_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  runApp(const Artuaista());
}

class Artuaista extends StatelessWidget {
  const Artuaista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Paint.enableDithering = true;

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
