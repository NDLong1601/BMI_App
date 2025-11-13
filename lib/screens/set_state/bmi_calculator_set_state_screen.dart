import 'package:bmi_app/components/app_button.dart';
import 'package:bmi_app/components/app_container.dart';
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:flutter/material.dart';

class BmiCalculatorSetStateScreen extends StatefulWidget {
  const BmiCalculatorSetStateScreen({super.key});

  @override
  State<BmiCalculatorSetStateScreen> createState() =>
      _BmiCalculatorSetStateScreenState();
}

class _BmiCalculatorSetStateScreenState
    extends State<BmiCalculatorSetStateScreen> {
  late int countAge;
  late int countWeight;
  double countHeight = 175;
  bool isMale = false;

  @override
  void initState() {
    super.initState();
    countAge = 30;
    countWeight = 78;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.lightwhite,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * (54 / 852),
                bottom: screenHeight * (39 / 852),
              ),
              child: AppText(
                title: 'BMI CALCULATOR',
                style: AppTextStyle.regularTsSize17Purple,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * (30 / 393),
              right: screenWidth * (30 / 393),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppContainer(
                  title: 'Age',
                  initialCount: 30,
                  onChanged: (value) => setState(() => countAge = value),
                ),
                AppContainer(
                  title: 'Weight (KG)',
                  initialCount: 78,
                  onChanged: (value) => setState(() => countWeight = value),
                ),
              ],
            ),
          ),
          AppContainerSlider(
            text: 'Height (CM)',
            initialCount: 175,
            onChanged: (value) => setState(() => countHeight = value),
          ),
          AppContainerSwitch(
            text: 'Gender',
            isMale: isMale,
            onChanged: (v) => setState(() => isMale = v),
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
                '/resultScreen',
                arguments: {'bmi': adjustedBmi},
              );
            },
          ),
        ],
      ),
    );
  }
}
