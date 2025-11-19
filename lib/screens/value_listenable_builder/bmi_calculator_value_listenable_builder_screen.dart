import 'package:bmi_app/components/app_button.dart';
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:bmi_app/routes/app_route.dart';
import 'package:bmi_app/screens/value_listenable_builder/widgets/app_container_2.dart';
import 'package:bmi_app/screens/value_listenable_builder/widgets/app_container_slider_2.dart';
import 'package:bmi_app/screens/value_listenable_builder/widgets/app_container_switch_2.dart';
import 'package:flutter/material.dart';

class BmiCalculatorValueListenableBuilderScreen extends StatelessWidget {
  const BmiCalculatorValueListenableBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> countAge = ValueNotifier<int>(30);
    ValueNotifier<int> countWeight = ValueNotifier<int>(78);
    ValueNotifier<double> countHeight = ValueNotifier<double>(175);
    ValueNotifier<bool> isMale = ValueNotifier<bool>(false);

    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
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
              AppContainer2(valueNotifier: countAge),
              AppContainer2(isAge: false, valueNotifier: countWeight),
            ],
          ),
          AppContainerSlider2(title: 'Height (CM)', valueNotifier: countHeight),
          AppContainerSwitch2(title: 'Gender', valueNotifier: isMale),
          AppButton(
            text: 'Calculate BMI',
            state: AppButtonState.purpleButton,
            onPressed: () {
              double heightInMeters = countHeight.value / 100;
              double bmi =
                  countWeight.value / (heightInMeters * heightInMeters);
              double adjustedBmi = bmi;
              if (isMale.value) {
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
