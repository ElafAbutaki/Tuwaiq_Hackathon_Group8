import 'package:darkom/Feature_Chat_Screen/Widgets/chip_categories.dart';
import 'package:darkom/Feature_Chat_Screen/Widgets/custom_chat.dart';
import 'package:darkom/Feature_Chat_Screen/Widgets/header.dart';
import 'package:darkom/Feature_Home_screen/Screen/home_screen.dart';
import 'package:darkom/Feature_Properties_Screen/Screen/propertiy_listing_screen.dart';
import 'package:darkom/Feature_Settings_Screen/Screen/settings_screen.dart';
import 'package:darkom/Reusable_Widgets/Widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _index = 2;

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
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SettingScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 20),
              ChatHeader(),
              SizedBox(height: 20),
              ChipsList(),
              SizedBox(height: 10),
              CustomChat(), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: PopNavBar(
        currentIndex: _index,
        items:  [
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
