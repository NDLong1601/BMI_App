import 'package:bmi_app/components/app_button.dart';
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:bmi_app/routes/app_route.dart';
import 'package:bmi_app/screens/stateful_builder/widgets/app_container_1.dart';
import 'package:bmi_app/screens/stateful_builder/widgets/app_container_slider_1.dart';
import 'package:bmi_app/screens/stateful_builder/widgets/app_container_switch_1.dart';
import 'package:flutter/material.dart';

class BmiCalculatorStatefulBuilderScreen extends StatelessWidget {
  const BmiCalculatorStatefulBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    int countAge = 30;
    int countWeight = 78;
    double countHeight = 175;
    bool isMale = false;

    return Scaffold(
      backgroundColor: AppColor.lightwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * (54 / 852),
              bottom: screenHeight * (39 / 852),
            ),
            child: AppText(
              title: 'BMI CALCULATOR',
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          Row(
            children: [
              AppContainer1(
                title: 'Age',
                initialValue: countAge,
                onChanged: (v) => countAge = v,
              ),
              AppContainer1(
                title: 'Weight (KG)',
                initialValue: countWeight,
                onChanged: (v) => countWeight = v,
              ),
            ],
          ),
          AppContainerSlider1(
            title: 'Height (CM)',
            initialValue: countHeight,
            onChanged: (v) => countHeight = v,
          ),
          AppContainerSwitch1(
            title: 'Gender',
            initialValue: isMale,
            onChanged: (v) => isMale = v,
          ),
          AppButton(
            text: 'Calculate BMI',
            state: AppButtonState.purpleButton,
            onPressed: () {
              double heightInMeters = countHeight / 100;
              double bmi = countWeight / (heightInMeters * heightInMeters);
              double adjustedBmi = bmi;
              if (isMale) {
                adjustedBmi = bmi * 0.97;
              } else {
                adjustedBmi = bmi * 1.03;
              }
              Navigator.pushReplacementNamed(
                context,
                AppRoute.resultScreen,
                arguments: {'bmi': adjustedBmi},
              );
            },
          ),
        ],
      ),
    );
  }
}
