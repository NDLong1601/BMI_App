import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_assets_path.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

class AppContainer1 extends StatelessWidget {
  final String title;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final double width;
  final double height;

  const AppContainer1({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
    this.width = 156 / 393,
    this.height = 175 / 852,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    int value = initialValue;

    return Container(
      margin: EdgeInsets.only(left: screenWidth * (30 / 393)),
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
              title: title,
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          StatefulBuilder(
            builder: (context, innerSetState) {
              return Column(
                children: [
                  AppText(
                    title: '$value',
                    style: AppTextStyle.boldTsSize57Purple,
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
                            innerSetState(() {
                              value = (value - 1).clamp(0, 999);
                              onChanged(value);
                            });
                          },
                          child: Image(
                            image: AssetImage(AppAssetsPath.icDecrease),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            innerSetState(() {
                              value = (value + 1).clamp(0, 999);
                              onChanged(value);
                            });
                          },
                          child: Image(
                            image: AssetImage(AppAssetsPath.icIncrease),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
