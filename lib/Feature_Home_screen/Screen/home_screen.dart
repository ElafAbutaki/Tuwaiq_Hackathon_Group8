// lib/Feature_Home_screen/Screen/home_screen.dart
import 'package:darkom/Feature_Chat_Screen/Screen/chat_screen.dart';
import 'package:darkom/Feature_Properties_Screen/Screen/propertiy_listing_screen.dart';
import 'package:darkom/Feature_Settings_Screen/Screen/settings_screen.dart';
import 'package:darkom/Reusable_Widgets/Widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Home_screen/Widget/header.dart';
import 'package:darkom/Feature_Home_screen/Widget/news_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0; 

  void _onNavTap(int i) {
    if (i == index) return;
    setState(() => index = i);

    switch (i) {
      case 0: 
      break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PropertiesListingScreen()));
        break;
      case 2:
       Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SettingScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Header(),
            const SizedBox(height: 30),
            const NewsCard(),
            const SizedBox(height: 12),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text('إحصائياتي', style: AppText.heading5),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("images/HomeScreen/News/Statistics.png", width: 380),
            ),
            const SizedBox(height: 90), 
          ],
        ),
      ),

     
       bottomNavigationBar: PopNavBar(
        currentIndex: index,
        items: const [
          NavItem(iconPath: 'images/Reusable/NavBar/home.png', label: 'الرئيسية'),
          NavItem(iconPath: 'images/Reusable/NavBar/property.png', label: 'عقاراتي'),
          NavItem(iconPath: 'images/Reusable/NavBar/chat.png', label: 'المحادثات'),
          NavItem(iconPath: 'images/Reusable/NavBar/profile.png', label: 'حسابي'),
        ],
        onTap: _onNavTap,
      ),
    );
  }
}
