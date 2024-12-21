import 'package:flutter/material.dart';

import '../../../../core/Utils/text_styles/styles.dart';
class OtpHeader extends StatelessWidget {
  const OtpHeader({
    super.key, required this.title,required this.subTitle,
  });
 final String title;
 final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
         title,
          style: AppStyles.text24Size500WightDarkGray,
        ),
        Text(
          subTitle,
          style: AppStyles.text16Size400WightGrey,
        ),
      ],
    );
  }
}
