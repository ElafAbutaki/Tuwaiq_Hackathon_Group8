import 'package:darkom/App_Theme/app_text.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.width = 200,
    this.height = 50,
    this.color = const Color(0xFFCD6D6D),
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26),
              bottomLeft: Radius.circular(26),
              bottomRight: Radius.circular(26),
            ),
          ),
          shadows: [BoxShadow(color: color.withAlpha(700), blurRadius: 12)],
        ),
        child: Center(
          child:Text(
          text,
          style: AppText.paragraph,
          ),
        ),
      ),
    );
  }
}