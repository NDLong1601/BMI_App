// AppContainerSlider2
import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

class AppContainerSlider2 extends StatelessWidget {
  final String title;
  final ValueNotifier<double> valueNotifier;
  final double min;
  final double max;

  const AppContainerSlider2({
    super.key,
    required this.title,
    required this.valueNotifier,
    this.min = 50,
    this.max = 300,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: screenHeight * (23 / 852)),
      width: screenWidth * (333 / 393),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * (18 / 852),
              bottom: screenHeight * (3 / 852),
            ),
            child: AppText(
              title: title,
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return AppText(
                title: value.toStringAsFixed(0),
                style: AppTextStyle.boldTsSize57Purple.copyWith(height: 1),
                textAlign: TextAlign.center,
              );
            },
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: AppColor.purple,
              activeTrackColor: AppColor.purple,
              inactiveTrackColor: Colors.grey[300],
              overlayColor: AppColor.purple.withValues(alpha: 0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              trackHeight: 3,
            ),
            child: ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  min: min,
                  max: max,
                  onChanged: (newValue) {
                    valueNotifier.value = newValue;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * (5 / 852),
              left: screenWidth * (28 / 393),
              right: screenWidth * (30 / 393),
              bottom: screenHeight * (23 / 852),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: '${min.toInt()} cm',
                  style: AppTextStyle.regularTsSize13Black1,
                ),
                AppText(
                  title: '${max.toInt()} cm',
                  style: AppTextStyle.regularTsSize13Black1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
