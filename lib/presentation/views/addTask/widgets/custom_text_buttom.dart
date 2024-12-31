import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    required this.colorText,
  });
  final void Function()? onTap;
  final String text;
  final double fontSize;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: colorText, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
