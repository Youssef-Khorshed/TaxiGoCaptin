// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_Button.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/screens/custom_map_widgets/custom_BuildAdressRow.dart';

// ignore: must_be_immutable
class CustomOngoingwayrider extends StatefulWidget {
  String captinName;
  String captinImage;
  String captinRating;
  String originTitle;
  String originSubTitle;
  String destinationTitle;
  String destinationSubTitle;
  String distance;
  String time;
  CustomOngoingwayrider({
    super.key,
    required this.captinName,
    required this.captinImage,
    required this.captinRating,
    required this.originTitle,
    required this.originSubTitle,
    required this.destinationTitle,
    required this.destinationSubTitle,
    required this.distance,
    required this.time,
  });

  @override
  State<CustomOngoingwayrider> createState() => _CustomOngoingwayriderState();
}

class _CustomOngoingwayriderState extends State<CustomOngoingwayrider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkgrayColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 5.h,
            width: 134.w,
          ),
          verticalSpace(10.h),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (mounted) {
                    context
                        .read<MapsCubit>()
                        .getUserUpdatedLocation(title: 'origin');
                  }
                },
                child: const CircleAvatar(
                  backgroundColor: AppColors.blueColor,
                  child: Icon(Icons.message),
                ),
              ),
              horizontalSpace(6.w),
              const CircleAvatar(
                backgroundColor: AppColors.lightGreen,
                child: Icon(Icons.phone),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.grayColor,
                    radius: 20.r,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 0.h),
                          margin: EdgeInsets.symmetric(horizontal: 40.w),
                          decoration: BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.directions_car),
                              Text(
                                'data',
                                style: AppStyles.style12WhiteW500,
                              )
                            ],
                          )),
                      const Icon(Icons.star_rounded,
                          color: AppColors.yellowColor),
                      const Text('4.9'),
                    ],
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          verticalSpace(10.h),
          BuildAddressRow(
            title: 'originTitle',
            traling: false,
            icon: const Icon(Icons.location_on, color: AppColors.redColor),
            subtitle: 'originSubTitle',
          ),
          verticalSpace(10.h),
          BuildAddressRow(
            traling: true,
            title: 'destinationTitle',
            icon: const Icon(Icons.location_on, color: AppColors.blueColor),
            subtitle: 'destinationSubTitle',
            distance: 'distance',
            time: 'time',
          ),
          verticalSpace(10.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Distance'),
                  Text('distance'),
                ],
              ),
              Column(
                children: [
                  Text('Time'),
                  Text('time'),
                ],
              )
            ],
          ),
          verticalSpace(20.h),
          CustomAppBottom(
            onPressed: () {},
            buttonText: 'Cancel',
            borderCornerRadius: 30.r,
            iconColor: AppColors.amberColor,
            buttonColor: AppColors.redColor,
          )
        ],
      ),
    );
  }
}
