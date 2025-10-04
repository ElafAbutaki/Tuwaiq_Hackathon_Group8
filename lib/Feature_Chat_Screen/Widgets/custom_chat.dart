import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Feature_Chat_Screen/Widgets/example_messages.dart';
import 'package:flutter/material.dart';

class CustomChat extends StatelessWidget {
  const CustomChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100), 
        physics: const BouncingScrollPhysics(),
        itemCount: masseges.length,
        itemBuilder: (context, i) {
          final users = masseges[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            users['time']!,
                            style: AppText.small2.copyWith(color: AppColors.light500),
                          ),
                          const Spacer(),
                          Text(
                            users["name"]!,
                            style: AppText.small.copyWith(color: AppColors.light500),
                          ),
                        ],
                      ),
                      Text(
                        users['massege']!,
                        style: AppText.small2.copyWith(color: AppColors.dark300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade200,
                    child: Text(
                      users["avatar"]!,
                      style: AppText.heading6.copyWith(color: AppColors.dark500),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
