import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label; 
  final VoidCallback onPressed; 
  final bool underline; 

  const CustomTextButton({
    super.key, 
    required this.label,
    required this.onPressed,
    this.underline = false,
    });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.light500,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.textButtonHorizontalPadding,
          vertical: AppSizes.textButtonVerticalPadding,
        ),
        fixedSize: Size(AppSizes.textButtonWidth, AppSizes.textButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSizes.textButtonRadius),
            topRight: Radius.circular(AppSizes.textButtonRadius),  
            bottomRight: Radius.circular(AppSizes.textButtonRadius),
          ),
        ),
      ),
      child: Text(
        label,
        style: AppText.paragraph.copyWith(
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
          decorationColor: AppColors.light500,      
          decorationThickness: 0.75,               
          decorationStyle: TextDecorationStyle.solid,
          height: 0.45,  
        ),
      ),
    );
  }
}
