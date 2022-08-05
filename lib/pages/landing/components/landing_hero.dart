import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:flutter/cupertino.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: .1 * screenSize.height,
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
      ],
    );
  }
}
