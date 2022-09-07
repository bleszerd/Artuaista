import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_size.dart';
import 'package:artuaista/core/widgets/appInput/app_input.dart';
import 'package:artuaista/core/widgets/roundedButton/rounded_button.dart';
import 'package:artuaista/features/wallpaper/presentation/controllers/wallpaper_list_controller.dart';
import 'package:flutter/material.dart';

class WallpaperListHeader extends StatefulWidget {
  final WallpaperListController wallpaperListController;

  const WallpaperListHeader({
    Key? key,
    required this.wallpaperListController,
  }) : super(key: key);

  @override
  State<WallpaperListHeader> createState() => _WallpaperListHeaderState();
}

class _WallpaperListHeaderState extends State<WallpaperListHeader> {
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
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            AppInput(
              onChangedAsync: (inputValue) => widget
                  .wallpaperListController.searchKeyword.value = inputValue,
              backgroundColor: AppColors.onSurfaceBackground,
              cursorColor: AppColors.primarySwatch,
              padding: const EdgeInsets.only(left: 10, right: 2),
              placeholder: "Type something to start searching",
              placeholderColor: AppColors.textPlaceholder,
              textStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: FontSize.basePlus,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            RoundedButton(
              backgroundColor: AppColors.primarySwatch,
              rippleColor: AppColors.primaryVariation,
              child: const Icon(
                Icons.search,
                size: 24,
                color: AppColors.iconPrimaryEnabled,
              ),
              onPress: () => widget.wallpaperListController.getWallpapers(
                page: 1,
                refreshing: true,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        )
      ],
    );
  }
}
