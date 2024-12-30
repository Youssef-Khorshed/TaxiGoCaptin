import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

// ignore: must_be_immutable
class Buildrowdetail extends StatelessWidget {
  String label;
  String value;
  bool isBold;

  Buildrowdetail(
      {super.key,
      required this.label,
      required this.value,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(label,
              style: !isBold
                  ? AppStyles.style14DarkgrayW500
                  : AppStyles.style16DarkgrayW500),
          AutoSizeText(value,
              style: !isBold
                  ? AppStyles.style14DarkgrayW500
                  : AppStyles.style16DarkgrayW500),
        ],
      ),
    );
  }
}
