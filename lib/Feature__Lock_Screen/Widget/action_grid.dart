import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_text.dart';

/// 2x2 grid of action tiles (each one is an independent container)
class ActionGrid extends StatelessWidget {
  final VoidCallback onTempPin;
  final VoidCallback onPermanentPin;
  final VoidCallback onFingerprint;
  final VoidCallback onLogs;

  const ActionGrid({
    super.key,
    required this.onTempPin,
    required this.onPermanentPin,
    required this.onFingerprint,
    required this.onLogs,
  });

  @override
  Widget build(BuildContext context) {
    const gap = 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double tileW = (constraints.maxWidth - gap) / 2;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            _ActionTile(
              width: tileW,
              label: 'إضافة مشرفين',
              iconPath: 'images/Lock/Assistant.png',
              onTap: onTempPin,
            ),
            _ActionTile(
              width: tileW,
              label: 'رمز المرور',
              iconPath: 'images/Lock/Password.png',
              onTap: onPermanentPin,
            ),
            _ActionTile(
              width: tileW,
              label: 'السجلات',
              iconPath: 'images/Lock/History.png',
              onTap: onLogs,
            ),
            _ActionTile(
              width: tileW,
              label: 'البصمة',
              iconPath: 'images/Lock/FingerPrint.png',
              onTap: onFingerprint,
            ),
          ],
        );
      },
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String label;
  final String iconPath;
  final double width;
  final VoidCallback onTap;

  const _ActionTile({
    required this.label,
    required this.iconPath,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF333333),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(26),
        topRight: Radius.circular(0),
        bottomRight: Radius.circular(26),
        bottomLeft: Radius.circular(26),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(26),
          bottomLeft: Radius.circular(26),
        ),
        child: SizedBox(
          width: width,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(iconPath, width: 26, height: 26),
                const SizedBox(height: 10),
                Text(label, style: AppText.paragraph, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
