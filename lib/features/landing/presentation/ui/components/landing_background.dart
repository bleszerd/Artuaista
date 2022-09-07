import 'package:artuaista/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LandingBackground extends StatelessWidget {
  const LandingBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      ],
    );
  }
}
