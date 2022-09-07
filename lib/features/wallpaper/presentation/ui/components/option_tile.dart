import 'package:artuaista/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionTile extends StatelessWidget {
  final String iconAssetKey;
  final String label;
  final VoidCallback onPress;

  const OptionTile({
    Key? key,
    required this.iconAssetKey,
    required this.label,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.onSurfaceBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
              ),
            ),
            onPressed: onPress,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: SvgPicture.asset(
                      iconAssetKey,
                      height: 48,
                      color: AppColors.primarySwatch,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      label,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
