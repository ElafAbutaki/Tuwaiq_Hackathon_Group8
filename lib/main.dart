import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/Feature_Splash_Screen/Screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.dark500,
      ),
      home: SplashScreen(),
    );
  }
}

