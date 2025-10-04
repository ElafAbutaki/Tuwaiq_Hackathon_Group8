import 'package:flutter/material.dart';
import 'package:darkom/App_Theme/app_text.dart';

class MiniAppButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;
  final double fontSize;

  const MiniAppButton({
    super.key,
    required this.text,
    this.width = 70,
    this.height = 30,
    this.color = const Color(0xFF7A8CA6), 
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const ShapeDecoration(
        color: Color(0xFF7A8CA6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppText.small2.copyWith(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
