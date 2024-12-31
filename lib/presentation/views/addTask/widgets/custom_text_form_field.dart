import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.suffIcon,
    this.isSecured = false,
    this.keyboardType,
    this.controller,
    this.hintText, this.maxLines,
  });
  final String? labelText;
  final String? hintText;
  final Widget? suffIcon;
  final bool isSecured;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: isSecured,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field is Required";
          }
          return null;
        },
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.kTextColor,
            fontSize: 16,
          ),
          labelText: labelText,
          suffixIcon: suffIcon,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.kBordersideColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
