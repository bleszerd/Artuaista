import 'package:artuaista/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WallpaperListLoadingSection extends StatelessWidget {
  final bool isLoading;

  const WallpaperListLoadingSection({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator(
            color: AppColors.primarySwatch,
          )
        : const SizedBox.shrink();
  }
}
