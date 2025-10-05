import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';

/// Simple greeting header with avatar + notification icon + title.
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/HomeScreen/header/avatar.png'),
        ),
        const SizedBox(width: 15),

        Image.asset(
          'images/HomeScreen/header/notification.png',
          width: AppSizes.notificationWidth,
          height: AppSizes.notificationHeight,
        ),

        const Spacer(),
        Text('مرحبًا صالح', style: AppText.heading3),
      ],
    );
  }
}
