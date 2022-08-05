import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

class WallpaperListHeader extends StatelessWidget {
  const WallpaperListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Artuaista",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: FontSize.titlePlus,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Text(
              "with",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'drawable/images/pexels_logo_text.png',
              width: 60,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
