import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackArrowButton({
    super.key,
    this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed ?? () => Navigator.of(context).pop(),
      child: Image.asset(
        'images/Reusable/backArrow.png',
        width: AppSizes.backArrowButtonWidth,
        height: AppSizes.backArrowButtonHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
