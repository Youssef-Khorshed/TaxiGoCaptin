import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;

  const CustomSnackBar({
    Key? key,
    required this.message,
    required this.backgroundColor,
    required this.textStyle,
  }) : super(key: key);

  void show(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.2, // تباعد أفقي
        right: MediaQuery.of(context).size.width * 0.2,
        bottom: MediaQuery.of(context).size.height * 0.1, // منتصف أسفل الشاشة
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
