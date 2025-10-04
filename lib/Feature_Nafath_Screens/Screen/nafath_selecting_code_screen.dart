import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Selecting_Code_Screen_Widgets/appBar.dart';
import 'package:darkom/Feature_Nafath_Screens/Widgets/Nafath_Selecting_Code_Screen_Widgets/code_buttons.dart';
import 'package:flutter/material.dart';

class NafathSelectingCodeScreen extends StatelessWidget {
  const NafathSelectingCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.nafathBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAppBar2(),
              SizedBox(height: 150),
              Text(
                "رقم الطلب", 
                style: AppText.nafathText,
                ),
              
              SizedBox(height: 20),
              Text("فضلًا اختيار الرقم الظاهر لدى مزود\nالخدمة", 
              style: AppText.nafathText2.copyWith(
                wordSpacing: 5,
                letterSpacing: 0.75,
              ),
              textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),
              RequestNumberButtons(), 

              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "رجوع", 
                  style: AppText.nafathText.copyWith(
                    fontSize: 20,
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}