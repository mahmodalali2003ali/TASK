import 'package:flutter/material.dart';

import '../../../../../core/constants/utils/colors.dart';

class TextButtom extends StatelessWidget {
  const TextButtom({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 60,
        height: 40,
        child: Center(child: Text(text)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: AppColors.kBlackColor)),
      ),
    );
  }
}
