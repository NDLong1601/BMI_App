import 'package:bmi_app/components/app_button.dart';
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double bmi = args['bmi'];

    String bmiCategory;
    if (bmi < 18.5) {
      bmiCategory = 'UNDERWEIGHT';
    } else if (bmi < 25) {
      bmiCategory = 'NORMAL';
    } else if (bmi < 30) {
      bmiCategory = 'OVERWEIGHT';
    } else {
      bmiCategory = 'OBESITY';
    }

    return Scaffold(
      backgroundColor: AppColor.lightwhite,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * (54 / 852),
                bottom: screenHeight * (67 / 852),
              ),
              child: AppText(
                title: 'BMI CALCULATOR',
                style: AppTextStyle.regularTsSize17Purple,
              ),
            ),
          ),
          AppText(
            title: 'Body Mass Index',
            style: AppTextStyle.regularTsSize27Purple,
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * (42 / 852),
              bottom: screenHeight * (50 / 852),
            ),
            padding: EdgeInsets.only(top: screenHeight * 56 / 852),
            width: screenWidth * (333 / 393),
            height: screenHeight * (416 / 852),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                AppText(
                  title: 'BMI Results',
                  style: AppTextStyle.regularTsSize32Purple,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: bmi.toStringAsFixed(0),
                        style: AppTextStyle.boldTsSize140Purple,
                      ),
                      TextSpan(
                        text:
                            '.${(bmi * 100).toStringAsFixed(0).substring((bmi * 100).toStringAsFixed(0).length - 2)}',
                        style: AppTextStyle.mediumTsSize42Purple,
                      ),
                    ],
                  ),
                ),
                AppText(
                  title: '$bmiCategory BMI',
                  style: AppTextStyle.mediumTsSize24Purple1,
                ),
                SizedBox(height: screenHeight * (18 / 852)),
                AppText(
                  title:
                      'Underweight: BMI less than 18.5\nNormal weight: BMI 18.5 to 24.9\nOverweight: BMI 25 to 29.9\nObesity: 30 to 40',
                  style: AppTextStyle.mediumTsSize13Purple1,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          AppButton(
            text: 'Save the result',
            state: AppButtonState.purpleButton,
            onPressed: () => {
              Navigator.pushReplacementNamed(
                context,
                // '/calculator_Set_State_Screen',
                // '/calculator_Stateful_Builder_Screen',
                '/calculator_Value_Listenable_builder_Screen',
              ),
            },
          ),
        ],
      ),
    );
  }
}
