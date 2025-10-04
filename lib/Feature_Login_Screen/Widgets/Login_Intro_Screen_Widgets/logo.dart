import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:flutter/material.dart';

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