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
      ),
      title: 'Artuaista',
      initialRoute: '/landing',
      routes: {
        "/landing": (context) => LandingPage(),
        "/wallpaperList": (context) => WallpaperListPage(),
      },
    );
  }
}
