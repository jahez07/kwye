import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 25,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
