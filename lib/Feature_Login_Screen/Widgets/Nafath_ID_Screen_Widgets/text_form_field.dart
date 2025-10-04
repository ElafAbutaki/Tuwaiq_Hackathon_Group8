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
        Text(
          label,
          style: AppText.small.copyWith(color: AppColors.dark300),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 14),

        SizedBox(
          width: AppSizes.textFormFieldWidth,
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            style: AppText.paragraph.copyWith(color: AppColors.light500),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                   EdgeInsets.symmetric(horizontal: 16, vertical: 14),

              errorStyle: TextStyle(
                color: Colors.red,
                height: 1.2, 
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.textFormFieldRadius),
                  bottomLeft: Radius.circular(AppSizes.textFormFieldRadius),
                  bottomRight: Radius.circular(AppSizes.textFormFieldRadius),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

