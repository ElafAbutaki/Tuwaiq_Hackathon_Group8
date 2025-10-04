import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';

class NafathOTP extends StatelessWidget {
  final String text; 

  const NafathOTP({
    super.key,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.otpCodeWidth,
      height: AppSizes.otpCodeHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.dark500,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSizes.otpRadius),
        bottomLeft: Radius.circular(AppSizes.otpRadius),
        bottomRight: Radius.circular(AppSizes.otpRadius),
        ),

        border: Border.all(
          color: AppColors.emerald500,
          width: AppSizes.otpBorderWidth,
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.emerald500,
            blurRadius: 16,
          ),
        ],
      ),
      child: Text(
        text,
        style: AppText.otpText,
      ),
    );
  }
}
