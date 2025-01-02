import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    this.imagePath,
  });
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.r,
      backgroundColor: AppColors.darkgrayColor,
      child: Container(
        width: 130.h,
        height: 130.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imagePath ??
                    'https://mrwallpaper.com/images/high/cool-profile-pictures-bart-xxxtentacion-qriuzlsntbbl9cv5.webp'))),
      ),
    );
  }
}
