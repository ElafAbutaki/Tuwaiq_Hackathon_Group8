import 'package:darkom/Feature__Lock_Screen/Widget/info_header_card.dart';
import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';

import 'package:darkom/Feature__Lock_Screen/Widget/lock_status_card.dart';
import 'package:darkom/Feature__Lock_Screen/Widget/action_grid.dart';

class DoorLockScreen extends StatefulWidget {
  final String propertyName;
  final String batteryIconPath; 

  const DoorLockScreen({
    super.key,
    required this.propertyName,
    this.batteryIconPath = 'images/Lock/lockBattery.png',
  });

  @override
  State<DoorLockScreen> createState() => _DoorLockScreenState();
}

class _DoorLockScreenState extends State<DoorLockScreen> {
  bool isLocked = true;

  Future<void> _confirmToggle() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.dark900,
        content: Text(
          'هل أنت متأكد أنك تريد ${isLocked ? "فتح" : "غلق"} الباب؟',
          textAlign: TextAlign.center,
          style: AppText.paragraph,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('إلغاء', style: AppText.paragraph),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              isLocked ? 'فتح' : 'غلق',
              style: AppText.paragraph.copyWith(color: AppColors.emerald500),
            ),
          ),
        ],
      ),
    );
    if (ok == true) setState(() => isLocked = !isLocked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                        icon: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                ),
                
                const SizedBox(height: 12),
                Row(
                  children: [
                    
                    Text('إدارة القفل الذكي', style: AppText.heading4),
                    const Spacer(),
                    
                    Column(
                      
                      children: [
                        Image.asset('images/Lock/Delete.png', width: 20, height: 20),
                        const SizedBox(height: 4),
                        Text('حذف القفل',
                            style: AppText.small2.copyWith(color: AppColors.dark300)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF242424), 
                    borderRadius: BorderRadius.circular(26),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                  child: Column(
                    children: [
                      
                      InfoHeaderRow(
                        title: widget.propertyName,
                        batteryIconPath: widget.batteryIconPath,
                      ),
                      const SizedBox(height: 22),

                      // Large lock
                      LockStatusCard(
                        isLocked: isLocked,
                        onTap: _confirmToggle,
                        lockedIconPath: 'images/Lock/lock.png',
                        unlockedIconPath: 'images/Lock/unlock.png',
                      ),
                      const SizedBox(height: 22),

                      // 2 x 2 grid of separate containers
                      ActionGrid(
                        onTempPin: () {},
                        onPermanentPin: () {},
                        onFingerprint: () {},
                        onLogs: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
