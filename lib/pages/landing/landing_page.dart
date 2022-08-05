import 'package:artuaista/pages/landing/components/landing_background.dart';
import 'package:artuaista/pages/landing/components/landing_hero.dart';
import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:artuaista/widgets/flat_wide_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
