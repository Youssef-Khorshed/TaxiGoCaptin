import 'package:flutter/material.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton({
    super.key,
    this.color,
    required this.text,
    this.textColor,
    this.borderColor,
    this.onPressed,
    this.height,
    this.width,
  });
  final Color? color;
  final String text;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor ?? Colors.transparent)),
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        height: height ?? 60,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18),
        )),
      ),
    );
  }
}
