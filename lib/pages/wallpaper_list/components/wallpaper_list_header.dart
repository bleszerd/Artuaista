import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:artuaista/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class WallpaperListHeader extends StatelessWidget {
  const WallpaperListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
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
                ],
              ),
              RoundedButton(
                backgroundColor: AppColors.primarySwatch,
                rippleColor: AppColors.primaryVariation,
                child: const Icon(
                  Icons.search,
                  size: 24,
                  color: AppColors.iconPrimaryEnabled,
                ),
                onPress: () {},
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.onSurfaceBackground,
            ),
            child: const TextField(
              cursorColor: AppColors.primarySwatch,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type something to start searching",
                hintStyle: TextStyle(
                  color: AppColors.textPlaceholder,
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: FontSize.basePlus,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
