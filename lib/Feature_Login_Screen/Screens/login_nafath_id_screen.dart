import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_text.dart';
import 'package:darkom/Reusable_Widgets/Widgets/back_button.dart';
import 'package:darkom/Reusable_Widgets/Widgets/emerald_button.dart';
import 'package:darkom/Reusable_Widgets/Widgets/text_button.dart';
import 'package:darkom/Feature_Login_Screen/Widgets/Nafath_ID_Screen_Widgets/text_form_field.dart';
import 'package:darkom/Feature_Login_Screen/Controller/Nafath_ID_Controller/nafath_id_controller.dart';
import 'package:darkom/Feature_Login_Screen/Screens/login_nafath_OTP.dart';

/// Nafath ID entry screen (one text field + actions)
class NafathIDScreen extends StatelessWidget {
  NafathIDScreen({super.key});

  final controller = NafathIdController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Back arrow (top-right)
              Align(
                alignment: Alignment.topRight,
                child: BackArrowButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 24),

              // Title + subtitle
              Text('تسجيل الدخول عبر نفاذ',
                  style: AppText.heading4, textAlign: TextAlign.right),
              const SizedBox(height: 8),
              Text(
                'يمكنك الدخول باستخدام حسابك المسجل بتطبيق نفاذ',
                style: AppText.paragraph.copyWith(color: AppColors.dark300),
                textAlign: TextAlign.right,
              ),

              const SizedBox(height: 40),

              Form(
                key: controller.formKey,
                child: CustomTextFormField(
                  controller: controller.idController,
                  label: 'رقم الهوية / الإقامة',
                  validator: controller.validateId,
                ),
              ),

              const Spacer(),

              // Store link
              Center(
                child: CustomTextButton(
                  label: 'تحميل تطبيق نفاذ',
                  underline: false,
                  onPressed: controller.launchNafathStore,
                ),
              ),
              const SizedBox(height: 16),

              // Continue button
              Center(
                child: EmeraldButton(
                  label: 'استمرار',
                  onPressed: () {
                    final ok =
                        controller.formKey.currentState?.validate() ?? false;
                    if (ok) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NafathCodeScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
