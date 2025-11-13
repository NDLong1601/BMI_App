import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final AppButtonState state;
  final String text;
  final Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    Color backgroundColor;
    TextStyle textStyle;

    switch (state) {
      case AppButtonState.purpleButton:
        backgroundColor = AppColor.purple;
        textStyle = AppTextStyle.mediumTsSize18White;
        break;
      case AppButtonState.whiteButton:
        backgroundColor = AppColor.white;
        textStyle = AppTextStyle.mediumTsSize18Purple1;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(45),
        ),
        minimumSize: Size((332 / 393) * screenWidth, (75 / 852) * screenHeight),
      ),
      child: AppText(title: text, style: textStyle),
    );
  }
}
