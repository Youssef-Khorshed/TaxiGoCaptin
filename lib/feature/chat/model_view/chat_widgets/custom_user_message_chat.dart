import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UserMessage extends StatelessWidget {
  final String message;
  final String userType;
  final double widthFactor;

  const UserMessage({
    super.key,
    required this.message,
    required this.userType,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    final isCaptain = userType == "captain";

    return Align(
      alignment: isCaptain ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth: widthFactor,
          maxHeight: 80.h,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 4),
              color: AppColors.grayColor,
            ),
          ],
          color: isCaptain ?   AppColors.kblue:AppColors.kWhite,
          borderRadius: BorderRadius.only(
            bottomLeft: isCaptain ?  Radius.circular(16.sp):Radius.zero ,
            bottomRight: isCaptain ?  Radius.zero:Radius.circular(16.sp) ,
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          ),
        ),
        child: AutoSizeText(
          message,
          maxLines: 100,
          style: AppStyles.style14BlackW500.copyWith(
            color: isCaptain ? AppColors.kWhite: AppColors.blackColor ,
          ),
        ),
      ),
    );
  }
}
