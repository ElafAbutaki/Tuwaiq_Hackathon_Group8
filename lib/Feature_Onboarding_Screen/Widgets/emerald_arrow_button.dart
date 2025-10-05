import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';

/// Round emerald arrow button used in the onboarding footer.
class IntroCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IntroCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(AppSizes.introButtonWidth, AppSizes.introButtonHeight),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.introButtonHorizontalPadding,
          vertical: AppSizes.introButtonVerticalPadding,
        ),
        backgroundColor: AppColors.emerald500,
        shadowColor: AppColors.emerald500,
        elevation: AppSizes.shadowElevation,
        shape:  CircleBorder(),
      ),
      child: Image.asset(
        "images/OnBoarding/Arrow.png",
        color: AppColors.light50,
        width: AppSizes.introArrowWidth,
        height: AppSizes.introArrowHeight,
      ),
    );
  }
}
