import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Image.asset("images/Chat/Menu_Dots.png"),
        SizedBox(width: 25),
        Image.asset("images/Chat/Search_Magnifier.png"),
        Spacer(),
        Text('(4)',
        style: AppText.heading4.copyWith(
          color: AppColors.emerald500,
          ),
          ),
        Text(' المحادثات  ',
        style: AppText.heading4,
        ),
      ],
    );
  }
}