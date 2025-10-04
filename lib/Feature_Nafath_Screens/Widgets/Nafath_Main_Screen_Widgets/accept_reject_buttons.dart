import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';

class AcceptRejectButtons extends StatelessWidget {
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const AcceptRejectButtons({
    super.key,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Reject button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.nafathRejectButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            minimumSize: Size(AppSizes.nafathButtonWidth, AppSizes.nafathButtonHeight), 
          ),
          onPressed: onReject,
          child: Text(
            "رفض",
            style: AppText.nafathButtonText,
          ),
        ),

        SizedBox(width: 20), 

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.nafathAcceptButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            minimumSize: Size(AppSizes.nafathButtonWidth, AppSizes.nafathButtonHeight),
          ),
          onPressed: onAccept,
          child: Text(
            "قبول",
            style: AppText.nafathButtonText,
          ),
        ),
      ],
    );
  }
}
