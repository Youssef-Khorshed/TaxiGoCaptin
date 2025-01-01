import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class UserMessage extends StatelessWidget {
  final String message;
  final String userType;
  final double widthFactor;
  final String time;

  const UserMessage({
    super.key,
    required this.message,
    required this.userType,
    required this.widthFactor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final isCaptain = userType == "captain";

    return Align(
      alignment: isCaptain ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        constraints: BoxConstraints(
          maxWidth: widthFactor,
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
          color: isCaptain ? AppColors.whiteColor : AppColors.blueColor,
          borderRadius: BorderRadius.only(
            bottomLeft: isCaptain ? Radius.zero : Radius.circular(16.sp),
            bottomRight: isCaptain ? Radius.circular(16.sp) : Radius.zero,
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              maxLines: 1000,
              style: AppStyles.style14BlackW500.copyWith(
                color: isCaptain ? AppColors.blackColor : AppColors.whiteColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.r),
              child: Text(extractHourMinuteWithPeriod(time),
                  style: AppStyles.style12GrayW400),
            )
          ],
        ),
      ),
    );
  }
}

String extractHourMinuteWithPeriod(String apiTime) {
  try {
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{6}Z$');
    if (!regex.hasMatch(apiTime)) {
      return "Invalid time format";
    }
    DateTime dateTime = DateTime.parse(apiTime).toLocal();
    int hour = dateTime.hour;
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour % 12 == 0 ? 12 : hour % 12;
    String formattedHour = hour.toString().padLeft(2, '0');
    return "$formattedHour:$minute $period";
  } catch (e) {
    return "Invalid time format";
  }
}
