import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class TripDetailsMap extends StatelessWidget {
  const TripDetailsMap({
    super.key,
    required this.location,
    required this.address,
    required this.icon,
  });

  final String location;
  final String address;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: AppStyles.text18BlackW500,
                ),
                SizedBox(height: 5.h),
                Text(
                  address,
                  style: AppStyles.text14GreyW200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
