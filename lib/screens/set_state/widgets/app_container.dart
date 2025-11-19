import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_assets_path.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  final String title;
  final int initialCount;
  final ValueChanged<int>? onChanged;

  const AppContainer({
    super.key,
    required this.title,
    required this.initialCount,
    this.onChanged,
  });

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  late int count;
  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * (175 / 852),
      width: screenWidth * (156 / 393),
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
              title: widget.title,
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          AppText(title: '$count', style: AppTextStyle.boldTsSize57Purple),

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
                    setState(() {
                      if (count > 0) count--;
                    });
                    widget.onChanged?.call(count);
                  },
                  child: Image(image: AssetImage(AppAssetsPath.icDecrease)),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    widget.onChanged?.call(count);
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
