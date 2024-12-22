import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/images/app_images.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class LocationMessage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double widthFactor;
  final double heightFactor;
  final String message;
  final String usertype;

  const LocationMessage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.widthFactor,
    required this.heightFactor,
    required this.message,
    required this.usertype,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: usertype=="captain" ?   Alignment.centerLeft:Alignment.centerRight ,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.sp),
        padding: const EdgeInsets.all(10),
        constraints:
            BoxConstraints(maxWidth: widthFactor, maxHeight: heightFactor),
        decoration:
        BoxDecoration(
          color:usertype=="captain" ?  AppColors.whiteColor : AppColors.blueColor,
          borderRadius:usertype=="captain" ?BorderRadius.only(
              bottomLeft: Radius.circular(0.sp),
              bottomRight: Radius.circular(10.sp),
              topLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp))
              :
          BorderRadius.only(
            bottomLeft: Radius.circular(10.sp),
            topLeft: Radius.circular(10.sp),
            topRight: Radius.circular(10.sp),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: AutoSizeText(
                message,
                maxLines: 3,
                style: AppTextStyles.style14BlackW500.copyWith(
                  color:usertype=="captain" ?  AppColors.blackColor : AppColors.whiteColor
                ),
              ),
            ),
            verticalSpace(5.h),
        Expanded(
          flex: 10,
          child: Image.asset(
            AppImages.mapTest,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

        )
          ],
        ),
      ),
    );
  }





  Set<Marker> buildMarkers() {
    return {
      Marker(
        markerId: const MarkerId("shared_location"),
        position: LatLng(latitude, longitude),
      ),
    };
  }
}
