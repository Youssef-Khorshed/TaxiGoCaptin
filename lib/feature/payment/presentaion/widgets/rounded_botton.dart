import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;
  const RoundedButton(
      {super.key,
      required this.width,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
