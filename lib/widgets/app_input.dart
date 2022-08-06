import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String placeholder;
  final Color placeholderColor;
  final Color cursorColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final TextEditingController? controller;
  final Function(String inputValue)? onChangedAsync;

  const AppInput({
    Key? key,
    required this.placeholder,
    required this.cursorColor,
    required this.padding,
    required this.backgroundColor,
    required this.placeholderColor,
    required this.textStyle,
    this.controller,
    this.onChangedAsync,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        child: TextFormField(
          onChanged: onChangedAsync != null ? onChangedAsync! : (value) {},
          controller: controller,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: TextStyle(
              color: placeholderColor,
            ),
          ),
          style: textStyle,
        ),
      ),
    );
  }
}
