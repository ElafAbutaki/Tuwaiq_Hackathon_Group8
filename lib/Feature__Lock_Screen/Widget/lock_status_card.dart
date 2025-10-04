import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/App_Theme/app_colors.dart';

class LockStatusCard extends StatelessWidget {
  final bool isLocked;
  final VoidCallback onTap;

  final String lockedIconPath;
  final String unlockedIconPath;

  const LockStatusCard({
    super.key,
    required this.isLocked,
    required this.onTap,
    this.lockedIconPath = 'images/Lock/lock.png',
    this.unlockedIconPath = 'images/Lock/unlock.png',
  });

  @override
  Widget build(BuildContext context) {
    final Color squareColor =
        isLocked ? const Color(0xFFD47672) : AppColors.emerald500;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: squareColor,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              isLocked ? lockedIconPath : unlockedIconPath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          isLocked ? 'انقر لفتح الباب' : 'انقر لغلق الباب',
          style: AppText.paragraph.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
