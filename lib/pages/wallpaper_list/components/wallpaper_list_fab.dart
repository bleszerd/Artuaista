import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WallpaperListFab extends StatelessWidget {
  final ValueNotifier<bool> fabIsVisible;
  final ScrollController scrollController;

  const WallpaperListFab({
    Key? key,
    required this.fabIsVisible,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fabIsVisible,
      builder: (context, child) => AnimatedSlide(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        offset: fabIsVisible.value ? Offset.zero : const Offset(0, 2),
        child: FloatingActionButton(
          child: const Icon(
            Icons.north,
            color: AppColors.textPrimary,
            size: 24,
          ),
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
            );
          },
        ),
      ),
    );
  }
}
