import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
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
    return ListTile(
      title: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 25.w,
          ),
          horizontalSpace(10.w),
          Text(
            location,
            style: AppStyles.style16BlackW600,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          address,
          style: AppStyles.style14DarkgrayW500,
        ),
      ),
      // leading: Column(
      //   children: [
      //     SvgPicture.asset(
      //       icon,
      //       width: 25.w,
      //     ),

      //   ],

      // ),
    );
  }
}
