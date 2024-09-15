import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/AppColors/app_colors.dart';
import '../custom_text/custom_text.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height = 48,
      this.width = double.maxFinite,
      required this.onTap,
      this.title ='',
      this.marginVerticel = 0,
      this.marginHorizontal = 0,
      this.fillColor,
      this.textColor = AppColors.authButtonColor});

  final double height;
  final double width;
  final Color? fillColor;
  final Color textColor;

  final VoidCallback onTap;

  final String title;

  final double marginVerticel;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVerticel, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(30.r), color: fillColor),
        child: CustomText(
            fontWeight: FontWeight.w500,
            color: textColor,
            textAlign: TextAlign.center,
            text: title),
      ),
    );
  }
}
