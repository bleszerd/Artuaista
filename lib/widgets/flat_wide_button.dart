import 'package:artuaista/shared/utils/extensions/colors_extension.dart';
import 'package:flutter/material.dart';

class FlatWideButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final TextStyle textStyle;
  final Color rippleColor;
  final Color backgroundColor;

  const FlatWideButton({
    Key? key,
    required this.onPress,
    required this.text,
    required this.textStyle,
    required this.rippleColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: TextButton(
        onPressed: onPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          overlayColor: rippleColor.toMaterialProperty(),
          backgroundColor: backgroundColor.toMaterialProperty(),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
