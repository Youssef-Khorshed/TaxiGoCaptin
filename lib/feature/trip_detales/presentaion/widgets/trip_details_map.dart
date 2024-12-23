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
      child: ListTile(
        title: Text(
          location,
          style: AppStyles.text16Size400darkGrey,
        ),
        subtitle: Text(
          address,
          style: AppStyles.style12DarkgrayW400,
        ),
        leading: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 25.w,
            ),
          ],
        ),
      ),
    );
  }
}
