import 'package:bmi_app/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int maxLines;

  const AppText({
    required this.title,
    this.style,
    this.textAlign,
    super.key,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? AppTextStyle.regularTsSize15Purple,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
    );
  }
}
