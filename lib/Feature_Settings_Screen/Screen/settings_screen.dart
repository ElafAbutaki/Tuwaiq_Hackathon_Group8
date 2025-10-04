import 'package:darkom/Feature_Chat_Screen/Screen/chat_screen.dart';
import 'package:darkom/Feature_Properties_Screen/Screen/propertiy_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:darkom/Feature_Settings_Screen/Widgets/user_header.dart';
import 'package:darkom/Feature_Settings_Screen/Widgets/setting_list.dart';
import 'package:darkom/Feature_Settings_Screen/Widgets/logout_button.dart';
import 'package:darkom/Reusable_Widgets/Widgets/bottom_nav.dart';
import 'package:darkom/Feature_Home_screen/Screen/home_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _index = 3;

  void _onNavTap(int i) {
    if (i == _index) return;
    setState(() => _index = i);

    switch (i) {
      case 0: 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PropertiesListingScreen()),
        );
        break;
      case 2: 
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 3: 
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              SizedBox(height: 79),
              UserInfo(),
              SizedBox(height: 80),
              SettingList(),
              SizedBox(height: 20),
              CustomButton(
                text: "تسجيل الخروج",
                width: 250,
                height: 55,
                color: Color(0xFFCD6D6D),
                fontSize: 20,
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),

      bottomNavigationBar: PopNavBar(
        currentIndex: _index,
        items: const [
          NavItem(iconPath: 'images/Reusable/NavBar/home.png',    label: 'الرئيسية'),
          NavItem(iconPath: 'images/Reusable/NavBar/property.png', label: 'عقاراتي'),
          NavItem(iconPath: 'images/Reusable/NavBar/chat.png',     label: 'المحادثات'),
          NavItem(iconPath: 'images/Reusable/NavBar/profile.png',  label: 'حسابي'),
        ],
        onTap: _onNavTap,
      ),
    );
  }
}
