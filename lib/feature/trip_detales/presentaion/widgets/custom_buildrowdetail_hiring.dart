import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

// ignore: must_be_immutable
class Buildrowdetail extends StatelessWidget {
  String label;
  String value;
  String count;
  bool isBold;

  Buildrowdetail(
      {super.key,
      required this.label,
      required this.value,
      required this.count,
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
                  ? AppStyles.text18BlackW500
                  : AppStyles.text16BlackW200),
          Row(
            children: [
              Text(value, style: AppStyles.text18BlackW500),
              Text(count, style: AppStyles.text16BlackW200),
            ],
          ),
        ],
      ),
    );
  }
}
