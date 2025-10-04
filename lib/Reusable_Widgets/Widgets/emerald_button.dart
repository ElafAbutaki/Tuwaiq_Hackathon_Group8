import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart'; 

class EmeraldButton extends StatelessWidget {
  final String label; 
  final VoidCallback onPressed;

  const EmeraldButton({
    super.key,
    required this.label, 
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
  
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          AppSizes.emeraldButtonWidth, 
          AppSizes.emeraldButtonHeight
          ),

        backgroundColor: AppColors.emerald500, 
        foregroundColor: AppColors.light500, 
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.emeraldButtonHorizontalPadding,
          vertical: AppSizes.emeraldButtonVerticalPadding,
        ),
    
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.emeraldButtonRadius), 
            bottomLeft: Radius.circular(AppSizes.emeraldButtonRadius), 
            bottomRight: Radius.circular(AppSizes.emeraldButtonRadius),
            ),
        ),
    
        shadowColor: AppColors.emerald500,
        elevation: AppSizes.shadowElevation,
        ),
    
        child: Text(
          label, 
          style: AppText.paragraph.copyWith(
            color: AppColors.light500,
          ),
        ),
      );
  }
}


