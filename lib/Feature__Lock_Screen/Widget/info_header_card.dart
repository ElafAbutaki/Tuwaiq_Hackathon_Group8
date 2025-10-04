import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_text.dart';

class InfoHeaderRow extends StatelessWidget {
  final String title;
  final String batteryIconPath;

  const InfoHeaderRow({
    super.key,
    required this.title,
    required this.batteryIconPath,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 20;

    return Row(
      children: [
        Image.asset(batteryIconPath, width: iconSize, height: iconSize),
        Expanded(
          child: Center(
            child: Text(title, style: AppText.heading6),
          ),
        ),
        const SizedBox(width: iconSize, height: iconSize),
      ],
    );
  }
}
