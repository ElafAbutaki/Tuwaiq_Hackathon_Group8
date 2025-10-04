import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';

class IntroCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IntroCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          AppSizes.introButtonWidth, 
          AppSizes.introButtonHeight
          ),

        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.introButtonHorizontalPadding,
          vertical: AppSizes.introButtonVerticalPadding,
        ),

        backgroundColor: AppColors.emerald500,
        shadowColor: AppColors.emerald500,
        elevation: AppSizes.shadowElevation,
        shape: const CircleBorder(),
      ),

      onPressed: onPressed,

      child: Image(
        image: AssetImage("images/OnBoarding/Arrow.png"),
        color: AppColors.light50,
        width: AppSizes.introArrowWidth,
        height: AppSizes.introArrowHeight,
      ),

    );
  }
}
