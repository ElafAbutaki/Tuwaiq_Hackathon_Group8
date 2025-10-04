import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Settings_Screen/Widgets/renewal_button.dart';
import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "إعدادات الحساب", 
            style: AppText.heading6.copyWith(
              color: AppColors.light500,
            ),
          ),

          ListTile(
            leading: Image.asset("images/Settings/personal_Info.png"),
            title: Text(
              "المعلومات الشخصية", 
              style: AppText.paragraph.copyWith(
                color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/Contract.png"),
            title: Text(
              "عقودي", 
              style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/Renewal.jpg"),
            title: Text("تحديد رخصة فال",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: MiniAppButton(text: "تجديد"),
          ),

          SizedBox(height: 90),
          Text("إعدادات عامة", 
          style: AppText.heading6.copyWith(
              color: AppColors.light500,
            ),
            ),
          
          ListTile(
            leading: Image.asset("images/Settings/Language.png"),
            title: Text("اللغة",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),

            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/Mode.png"),
            title: Text("المظهر",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/ContactUs.jpg"),
            title: Text("تواصل معنا", 
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/Share.jpg"),
            title: Text("مشاركة التطبيق",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/RateUs.png"),
            title: Text("قيم التطبيق",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          SizedBox(height: 90),
          Text("المعلومات القانونية", 
          style: AppText.heading6.copyWith(
              color: AppColors.light500,
            ),
            ),

          ListTile(
            leading: Image.asset("images/Settings/TermsAndConditions.jpg"),
            title: Text("الشروط و الاحكام",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),

          Divider(
            color: AppColors.dark800
            ),

          ListTile(
            leading: Image.asset("images/Settings/AboutUs.png"),
            title: Text("عن تطبيق داركم",
            style: AppText.paragraph.copyWith(
              color: AppColors.dark300
              ),
              ),
            trailing: Image.asset("images/Settings/arrow.png"),
          ),
        ],
      ),
    );
  }
}