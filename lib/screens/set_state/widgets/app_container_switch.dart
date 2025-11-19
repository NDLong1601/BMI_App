import 'package:bmi_app/components/app_text.dart';
import 'package:bmi_app/components/app_textstyle.dart';
import 'package:bmi_app/const/app_color.dart';
import 'package:flutter/material.dart';

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