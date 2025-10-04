import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Login_Screen/Widgets/Nafath_OTP_Screen_Widgets/otp_code.dart';
import 'package:darkom/Feature_Nafath_Screens/Screen/nafath_main_screen.dart';
import 'package:darkom/Reusable_Widgets/Widgets/back_button.dart';
import 'package:darkom/Reusable_Widgets/Widgets/emerald_button.dart';
import 'package:flutter/material.dart';

class NafathCodeScreen extends StatelessWidget {
  const NafathCodeScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: BackArrowButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(height: 24),

              Text(
                'تسجيل الدخول عبر نفاذ',
                style: AppText.heading4,
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 8),

              Text(
                'يرجى فتح تطبيق نفاذ واختيار الرمز الظاهر أمامك',
                style: AppText.paragraph.copyWith(
                  color: AppColors.dark300, 
                ),
                textAlign: TextAlign.right,
              ),
              
              SizedBox(height: 80),
              
              Center(
                child: NafathOTP(
                  text: '21',
                  ),
                  ),
              
              SizedBox(height: 215),
              Center(
                child: EmeraldButton(
                  label: 'الانتقال الى تطبيق نفاذ', 
                  onPressed: () { Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NafathMainScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }