import 'package:bmi_app/components/app_button.dart';
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_assets_path.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:bmi_app/core/enum/enum.dart';
import 'package:bmi_app/routes/app_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.purple,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: (81 / 852) * screenHeight,
                bottom: (59 / 852) * screenHeight,
              ),
              child: Image(image: AssetImage(AppAssetsPath.imgBmiDo)),
            ),
            Image(
              image: AssetImage(AppAssetsPath.imgShape),
              height: screenHeight * (251 / 852),
              width: screenWidth * (296 / 393),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * (95 / 852),
                bottom: screenHeight * (15 / 852),
              ),
              child: AppText(
                title: 'Get Started with\nTracking Your Health!',
                style: AppTextStyle.boldTsSize25White,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ),
            AppText(
              title:
                  'Calculate your BMI and stay on top of\nyour wellness journey, effortlessly.',
              style: AppTextStyle.regularTsSize15Purple,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
            SizedBox(height: screenHeight * (38 / 852)),
            AppButton(
              state: AppButtonState.whiteButton,
              text: 'Get Started',
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  // AppRoute.calculatorSetStateScreen,
                  // AppRoute.calculatorStatefulBuilderScreen,
                  AppRoute.calculatorValueListenableBuilderScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
