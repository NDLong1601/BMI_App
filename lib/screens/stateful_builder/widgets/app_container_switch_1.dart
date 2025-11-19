import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

class AppContainerSwitch1 extends StatelessWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const AppContainerSwitch1({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return StatefulBuilder(
      builder: (context, innerSetState) {
        bool value = initialValue;
        return Container(
          margin: EdgeInsets.only(
            bottom: screenHeight * (31 / 852),
            top: screenHeight * (25 / 852),
          ),
          height: screenHeight * (135 / 852),
          width: screenWidth * (333 / 393),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * (25 / 852),
                  bottom: screenHeight * (16 / 852),
                ),
                child: AppText(
                  title: title,
                  style: AppTextStyle.regularTsSize17Purple,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: 'Male',
                    style: AppTextStyle.regularTsSize17Purple,
                  ),
                  SizedBox(width: screenWidth * (14 / 393)),
                  Switch(
                    value: value,
                    activeThumbColor: AppColor.purple,
                    inactiveThumbColor: Colors.grey,
                    onChanged: (newValue) {
                      innerSetState(() {
                        value = newValue;
                        onChanged(value);
                      });
                    },
                  ),
                  SizedBox(width: screenWidth * (20 / 393)),
                  AppText(
                    title: 'Female',
                    style: AppTextStyle.regularTsSize17Purple,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
