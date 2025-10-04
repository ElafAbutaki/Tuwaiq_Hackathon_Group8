import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/HomeScreen/header/avatar.png'),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('👋',
                  style: AppText.heading4,
                  ),
                  Text(' صالح', 
                  style: AppText.heading4.copyWith(color: AppColors.emerald500 )
                  ),

                  Text(' ,',
                  style: AppText.heading4,
                  ),

                 Text('مرحباً',
                 style: AppText.heading4,
                 ),
                ], 
              ),
              Text('1090911001',
              style: AppText.paragraph.copyWith(
                color: AppColors.dark300,
                ),
                ),
            ], 
          ),
        ], 
      ),
    );
  }
}