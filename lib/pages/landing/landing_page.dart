import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "drawable/images/landing_background.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.backgroundAlpha200,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: .1 * (MediaQuery.of(context).size.height),
                  ),
                  const Text(
                    "Find your new favorite wallpaper that looks just like you!",
                    style: TextStyle(
                      fontSize: FontSize.big,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          color: AppColors.backgroundAlpha700,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "/wallpaperList",
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            overlayColor: MaterialStateProperty.all(
                              AppColors.primaryVariation,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.primarySwatch,
                            ),
                          ),
                          child: const Text(
                            'Discover new wallpapers',
                            style: TextStyle(
                              fontSize: FontSize.base,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
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
