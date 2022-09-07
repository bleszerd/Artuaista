import 'package:flutter/material.dart';
import 'package:artuaista/core/utils/extension_utils/colors_extension.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color rippleColor;
  final bool enabled;
  final VoidCallback onTap;
  final Widget child;
  final double borderRadius;

  const AppButton({
    Key? key,
    this.width,
    required this.height,
    required this.backgroundColor,
    required this.rippleColor,
    required this.enabled,
    required this.onTap,
    required this.child,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      width: width,
      height: height,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          backgroundColor: backgroundColor.toMaterialProperty(),
          overlayColor: rippleColor.toMaterialProperty(),
        ),
        child: child,
      ),
    );
  }
}
