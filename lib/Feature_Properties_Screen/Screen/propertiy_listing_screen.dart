import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Chat_Screen/Screen/chat_screen.dart';
import 'package:darkom/Feature_Properties_Screen/Controller/property_controller.dart';
import 'package:darkom/Feature_Settings_Screen/Screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:darkom/Reusable_Widgets/Widgets/bottom_nav.dart';
import 'package:darkom/Feature_Home_screen/Screen/home_screen.dart';

import '../Widgets/search_bar.dart';
import '../Widgets/property_listing.dart';

class PropertiesListingScreen extends StatefulWidget {
  const PropertiesListingScreen({super.key});

  @override
  State<PropertiesListingScreen> createState() => _PropertiesListingScreenState();
}

class _PropertiesListingScreenState extends State<PropertiesListingScreen> {
  int _index = 1;

  final List<PropertyItem> items = [
    PropertyItem(
      title: 'فيلا ١٠٢',
      city: 'الرياض',
      district: 'حي النرجس، شمال الرياض',
      price: '١٨٠,٠٠٠ ريال / شهريًا',
      status: PropertyStatus.available,
      image: 'images/Property_Listings/propertyCard/property1.png',
      lat: 24.774265, lng: 46.738586,
    ),
    PropertyItem(
      title: 'فيلا ٢.٢',
      city: 'الرياض',
      district: 'حي النخيل، شمال الرياض',
      price: '١٩٥,٠٠٠ ريال / شهريًا',
      status: PropertyStatus.lateExit,
      image: 'images/Property_Listings/propertyCard/property2.png',
      lat: 24.760000, lng: 46.670000,
    ),
    PropertyItem(
      title: 'شقة ٢',
      city: 'الرياض',
      district: 'عمارة السلام، شمال الرياض',
      price: '٨٠,٠٠٠ ريال / شهريًا',
      status: PropertyStatus.notAvailable,
      image: 'images/Property_Listings/propertyCard/property3.png',
      lat: 24.760000, lng: 46.670000,
    ),
    PropertyItem(
      title: 'شقة ٨',
      city: 'الرياض',
      district: 'عمارة الزهور، شمال الرياض',
      price: '٥٠,٠٠٠ ريال / شهريًا',
      status: PropertyStatus.notAvailable,
      image: 'images/Property_Listings/propertyCard/property4.png',
      lat: 24.760000, lng: 46.670000,
    ),
    PropertyItem(
      title: 'فيلا ١١٢',
      city: 'الرياض',
      district: 'حي النرجس، شمال الرياض',
      price: '١٧٠,٠٠٠ ريال / شهريًا',
      status: PropertyStatus.lateExit,
      image: 'images/Property_Listings/propertyCard/property5.png',
      lat: 24.760000, lng: 46.670000,
    ),
  ];

  void _onNavTap(int i) {
    if (i == _index) return;
    setState(() => _index = i);

    switch (i) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('عقاراتي', style: AppText.heading4.copyWith(color: Colors.white)),
                    Row(
                      children: [
                        Text('+', style: AppText.paragraph.copyWith(fontSize: 20, color: AppColors.emerald500)),
                        Text('إضافة عقار', style: AppText.paragraph.copyWith(color: AppColors.emerald500)),
                        const SizedBox(width: 6),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const CustomSearchBar(),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) => PropertyListItem(property: items[i]),
                ),
              ),

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
