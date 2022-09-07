import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_family.dart';
import 'package:artuaista/core/theme/font_size.dart';
import 'package:artuaista/core/widgets/flatWideButton/flat_wide_button.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.18,
                      ),
                      const Icon(
                        Icons.image_not_supported,
                        size: 116,
                        color: AppColors.primarySwatch,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Ooops!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamilly.redHatDisplay,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: FontSize.hero,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "An unexpected error occourrs.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamilly.redHatDisplay,
                          color: AppColors.textSecondary,
                          fontSize: FontSize.basePlus,
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      const Text(
                        "If the error persists, contact the developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamilly.redHatDisplay,
                          color: AppColors.textPlaceholder,
                          fontWeight: FontWeight.w300,
                          fontSize: FontSize.small,
                        ),
                      ),
                      const Text(
                        "bleszerd@programmer.net",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamilly.redHatDisplay,
                          color: AppColors.textPlaceholder,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.small,
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ),
                FlatWideButton(
                  onPress: () {
                    Restart.restartApp(webOrigin: '/landing');
                  },
                  text: "Restart Application",
                  textStyle: const TextStyle(
                    fontSize: FontSize.base,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                  rippleColor: AppColors.primaryVariation,
                  backgroundColor: AppColors.primarySwatch,
                ),
                const SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
