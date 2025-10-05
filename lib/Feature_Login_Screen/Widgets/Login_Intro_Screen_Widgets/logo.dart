import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_sizes.dart';

/// App logo used on intro/login screens
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/Reusable/Logo.png',
      width: AppSizes.logoWidth,
      height: AppSizes.logoHeight,
    );
  }
}
