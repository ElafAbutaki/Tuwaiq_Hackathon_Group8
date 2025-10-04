import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/Feature_Home_screen/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';

class RequestNumberButtons extends StatelessWidget {
  const RequestNumberButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.codeButtonColor,
            fixedSize: Size(AppSizes.nafathOTPButtonWidth, AppSizes.nafathOTPButtonHeight),
          ),
          onPressed: () {}, 
          child: Text(
            "12",
            style: AppText.heading5.copyWith(
              color: AppColors.light500,
              ),
          ),
        ),

        SizedBox(width: 20),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.codeButtonColor,
            fixedSize: Size(AppSizes.nafathOTPButtonWidth, AppSizes.nafathOTPButtonHeight),
          ),
          onPressed: () {},
          child: Text(
            "33",
            style: AppText.heading5.copyWith(
              color: AppColors.light500,
              ),
          ),
        ),

        SizedBox(width: 20),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.codeButtonColor,
            fixedSize: Size(AppSizes.nafathOTPButtonWidth, AppSizes.nafathOTPButtonHeight),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text(
            "21",
            style: AppText.heading5.copyWith(
              color: AppColors.light500,
              ),
          ),
        ),
      ],
    );
  }
}
