import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class TripDetailsMap extends StatelessWidget {
  const TripDetailsMap(
      {super.key,
      required this.location,
      required this.address,
      required this.icon,
      this.tralling});
  final String location;
  final String address;
  final String icon;
  final Widget? tralling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: tralling,
      title: Text(
        location,
        maxLines: 2,
        style: AppStyles.style16BlackW600,
      ),
      subtitle: Text(
        address,
        maxLines: 2,
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
    );
  }
}
