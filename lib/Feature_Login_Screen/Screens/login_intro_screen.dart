import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Home_screen/Screen/home_screen.dart';
import 'package:darkom/Feature_Login_Screen/Screens/login_nafath_id_screen.dart';
import 'package:darkom/Feature_Login_Screen/Widgets/Login_Intro_Screen_Widgets/logo.dart';
import 'package:darkom/Reusable_Widgets/Widgets/emerald_button.dart';
import 'package:darkom/Reusable_Widgets/Widgets/text_button.dart';

/// First login splash/intro with the logo + two actions
class LoginIntroScreen extends StatelessWidget {
  const LoginIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark500,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              const Align(alignment: Alignment.topCenter, child: Logo()),
              const SizedBox(height: 400),

              Text('مرحبًا بك في داركم',
                  style: AppText.heading4, textAlign: TextAlign.right),
              const SizedBox(height: 10),
              Text(
                'اختر الطريقة المناسبة للدخول إلى حسابك أو أنشئ حسابًا جديدًا للبدء في إدارة عقاراتك بسهولة',
                style: AppText.paragraph.copyWith(color: AppColors.dark300),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 18),

              Align(
                alignment: Alignment.center,
                child: EmeraldButton(
                  label: 'تسجيل الدخول عبر نفاذ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NafathIDScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.center,
                child: CustomTextButton(
                  label: 'المتابعة كضيف',
                  underline: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
