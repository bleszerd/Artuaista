import 'package:artuaista/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundHeadShadowEffect extends StatelessWidget {
  final Size screenSize;

  const BackgroundHeadShadowEffect({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: screenSize.width,
        height: screenSize.height * .26,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.2, 0.75, 1],
            colors: [
              AppColors.background,
              AppColors.background,
              AppColors.backgroundAlpha200,
              AppColors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
