import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/Feature_Login_Screen/Screens/login_nafath_id_screen.dart';
import 'package:darkom/Feature_Nafath_Screens/Screen/nafath_selecting_code_screen.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Main_Screen_Widgets/accept_reject_buttons.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Main_Screen_Widgets/appBar.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Main_Screen_Widgets/circular_progress.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Main_Screen_Widgets/navBar.dart';
import 'package:flutter/material.dart';

class NafathMainScreen extends StatelessWidget {
  const NafathMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.nafathBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAppBar(),

              SizedBox(height: 160),
              TealTickRing(
                size: 340,
                totalSteps: 60,
                currentStep: 50,
                tickLength: 24,
                center: Text(
                  'لديك طلب تسجيل دخول من\nمن تطبيق داركم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF22C7B4),
                    ),
                ),
              ),

              SizedBox(height: 50),
      
            AcceptRejectButtons(
                onAccept: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  NafathSelectingCodeScreen(),
                    ),
                  );
                },

                onReject: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>  NafathIDScreen(),
                    ),
                  );
                },
              ),        

              SizedBox(height: 30),
              NavBar(),
              
            ],
          ),
        ),
      ),
    );
  }
}