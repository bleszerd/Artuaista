import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_size.dart';
import 'package:artuaista/core/widgets/flatWideButton/flat_wide_button.dart';
import 'package:artuaista/features/landing/presentation/ui/components/landing_background.dart';
import 'package:artuaista/features/landing/presentation/ui/components/landing_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LandingBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LandingHero(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatWideButton(
                        textStyle: const TextStyle(
                          fontSize: FontSize.base,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),
                        text: "Discover new wallpapers",
                        rippleColor: AppColors.primaryVariation,
                        backgroundColor: AppColors.primarySwatch,
                        onPress: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/wallpaperList",
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}