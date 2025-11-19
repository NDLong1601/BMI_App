import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_assets_path.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

class AppContainer2 extends StatelessWidget {
  final bool isAge;
  final ValueNotifier<int> valueNotifier;
  final double width;
  final double height;

  const AppContainer2({
    super.key,
    this.isAge = true,
    required this.valueNotifier,
    this.width = 156 / 393,
    this.height = 175 / 852,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: screenWidth * (25 / 393)),
      height: screenHeight * (height),
      width: screenWidth * (width),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * (17 / 852),
              bottom: screenHeight * (3 / 852),
            ),
            child: AppText(
              title: isAge ? 'Age' : 'Weight',
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return AppText(
                title: '$value',
                style: AppTextStyle.boldTsSize57Purple,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * (28 / 393),
              right: screenWidth * (28 / 393),
              bottom: screenHeight * (10 / 852),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    /// isAge
                    if (isAge) {
                      if (valueNotifier.value > 1) {
                        valueNotifier.value--;
                      } else {
                        /// show dialog age message
                      }
                    } else {
                      /// isWeight
                      if (valueNotifier.value > 10) {
                        valueNotifier.value--;
                      } else {
                        /// show dialog weight message
                      }
                    }
                  },
                  child: Image(image: AssetImage(AppAssetsPath.icDecrease)),
                ),
                InkWell(
                  onTap: () {
                    /// isAge
                    if (isAge) {
                      if (valueNotifier.value < 120) {
                        valueNotifier.value++;
                      } else {
                        /// show dialog age message
                      }
                    } else {
                      /// isWeight
                      if (valueNotifier.value < 300) {
                        valueNotifier.value++;
                      } else {
                        /// show dialog weight message
                      }
                    }
                  },
                  child: Image(image: AssetImage(AppAssetsPath.icIncrease)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
