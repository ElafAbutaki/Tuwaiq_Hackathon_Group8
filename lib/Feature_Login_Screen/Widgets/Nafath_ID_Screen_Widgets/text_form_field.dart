import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_colors.dart';
import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:darkom/App_Theme/app_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Label above the input
        Text(
          label,
          style: AppText.small.copyWith(color: AppColors.dark300),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 14),

        // Fixed width so the input doesn't jump when error appears
        SizedBox(
          width: AppSizes.textFormFieldWidth,
          child: Directionality(
            //  Make ONLY the input (and its error text) RTL
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              textAlign: TextAlign.right,
              style: AppText.paragraph.copyWith(color: AppColors.light500),
              decoration: const InputDecoration().copyWith(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

                // Right-to-left error text that doesn't change height much
                errorStyle: const TextStyle(
                  color: Colors.red,
                  height: 1.2,
                ),
                errorMaxLines: 2,

                // Single 3-corners radius (leaving top-right square per your style)
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomRight: Radius.circular(AppSizes.textFormFieldRadius),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.dark400),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomRight: Radius.circular(AppSizes.textFormFieldRadius),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.emerald500, width: 1.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomLeft: Radius.circular(AppSizes.textFormFieldRadius),
                    bottomRight: Radius.circular(AppSizes.textFormFieldRadius),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
