import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:darkom/Feature_Onboarding_Screen/Screen/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000, 
      splash: Center(
        child: Image.asset(
          'images/Reusable/Logo.png',
          width: 314,
          height: 314,
          fit: BoxFit.cover,
        ),
      ),
      nextScreen: OnBoardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: AppColors.dark500,
    );
  }
}
