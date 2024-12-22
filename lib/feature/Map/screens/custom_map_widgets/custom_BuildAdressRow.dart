import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

// ignore: must_be_immutable
class BuildAddressRow extends StatelessWidget {
  Icon icon;
  String title;
  String subtitle;
  bool? traling;
  String? distance;
  String? time;
  BuildAddressRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.traling,
    this.distance,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        traling ?? true
            ? Row(
                children: [
                  Text(distance!, style: AppStyles.style12DarkgrayW400),
                ],
              )
            : const SizedBox(),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title,
                textAlign: TextAlign.start, style: AppStyles.style16BlackW600),
            SizedBox(
                height: 20.h,
                width: 270.w,
                child: Text(subtitle,
                    textAlign: TextAlign.end,
                    style: AppStyles.style14GrayW500)),
          ],
        ),
        icon
      ],
    );
  }
}
