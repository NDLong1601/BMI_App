import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_assets_path.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

// Container Box
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

// Container Slider
class AppContainerSlider extends StatefulWidget {
  final String text;
  final double initialCount;
  final ValueChanged<double>? onChanged;

  const AppContainerSlider({
    super.key,
    required this.text,
    required this.initialCount,
    this.onChanged,
  });

  @override
  State<AppContainerSlider> createState() => _AppContainerSlider();
}

class _AppContainerSlider extends State<AppContainerSlider> {
  late String text;
  late double countHeight;
  @override
  void initState() {
    super.initState();
    countHeight = widget.initialCount;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: screenHeight * (23 / 852)),
      // padding: EdgeInsets.symmetric(
      //   vertical: screenHeight * (15 / 852),
      //   horizontal: screenWidth * (15 / 393),
      // ),
      // height: screenHeight * (183 / 852),
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
              title: widget.text,
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          AppText(
            title: countHeight.toStringAsFixed(0),
            style: AppTextStyle.boldTsSize57Purple,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * (10 / 852)),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: AppColor.purple,
              activeTrackColor: AppColor.purple,
              inactiveTrackColor: Colors.grey[300],
              overlayColor: AppColor.purple.withValues(alpha: 0.2),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              trackHeight: 3,
            ),
            child: Slider(
              value: countHeight,
              min: 50,
              max: 300,
              onChanged: (value) {
                setState(() {
                  countHeight = value;
                });
                widget.onChanged?.call(countHeight);
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
                  title: '50 cm',
                  style: AppTextStyle.regularTsSize13Black1,
                ),
                AppText(
                  title: '300 cm',
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

// Container Switch
class AppContainerSwitch extends StatefulWidget {
  final String text;
  final bool isMale;
  final ValueChanged<bool>? onChanged;

  const AppContainerSwitch({
    super.key,
    required this.text,
    required this.isMale,
    this.onChanged,
  });

  @override
  State<AppContainerSwitch> createState() => _AppContainerSwitch();
}

class _AppContainerSwitch extends State<AppContainerSwitch> {
  late bool isMale;
  @override
  void initState() {
    super.initState();
    isMale = widget.isMale;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight * (23 / 852),
        bottom: screenHeight * (31 / 852),
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
              title: widget.text,
              style: AppTextStyle.regularTsSize17Purple,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(title: 'Male', style: AppTextStyle.regularTsSize17Purple),
              SizedBox(width: screenWidth * (14 / 393)),
              Switch(
                value: isMale,
                activeThumbColor: AppColor.purple,
                inactiveThumbColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    isMale = value;
                  });
                  widget.onChanged?.call(isMale);
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
  }
}

/// Stateful Builder
// AppContainer1
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

// AppContainerSlider1
class AppContainerSlider1 extends StatelessWidget {
  final String title;
  final double initialValue;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  const AppContainerSlider1({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
    this.min = 50,
    this.max = 300,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return StatefulBuilder(
      builder: (context, innerSetState) {
        double value = initialValue;
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
              AppText(
                title: value.toStringAsFixed(0),
                style: AppTextStyle.boldTsSize57Purple,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * (10 / 852)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: AppColor.purple,
                  activeTrackColor: AppColor.purple,
                  inactiveTrackColor: Colors.grey[300],
                  overlayColor: AppColor.purple.withValues(alpha: 0.2),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 10,
                  ),
                  trackHeight: 3,
                ),
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  onChanged: (newValue) {
                    innerSetState(() {
                      value = newValue;
                      onChanged(value);
                    });
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
      },
    );
  }
}

// AppContainerSwitch1
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
