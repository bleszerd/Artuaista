import 'package:flutter/material.dart';
import 'package:artuaista/core/utils/extension_utils/colors_extension.dart';

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color rippleColor;
  final Widget child;
  final VoidCallback onPress;

  const RoundedButton({
    Key? key,
    required this.backgroundColor,
    required this.rippleColor,
    required this.child,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(45),
      child: Container(
        width: 46,
        height: 46,
        color: backgroundColor,
        child: TextButton(
          style: ButtonStyle(
            overlayColor: rippleColor.toMaterialProperty(),
          ),
          onPressed: onPress,
          child: child,
        ),
      ),
    );
  }
}
