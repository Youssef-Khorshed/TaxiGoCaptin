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
          Text(label,
              style: !isBold
                  ? AppStyles.text14Size500WightW
                  : AppStyles.text14Size500WightW),
          Text(value,
              style: !isBold
                  ? AppStyles.text14Size500WightW
                  : AppStyles.text14Size500WightW),
        ],
      ),
    );
  }
}
