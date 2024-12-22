// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/controller/nearby_ride_requests_model_cubit/nearby_ride_requests_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/map_screen.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

// ignore: must_be_immutable
class DriverAction extends StatelessWidget {
  NearbyRideRequestsData nearbyRideRequest;
  DriverAction({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: CostumeButton(
              onPressed: () {},
              height: 50.h,
              text: "Decline",
              color: Colors.red.withOpacity(.05),
              textColor: Colors.red,
              borderColor: Colors.red,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CostumeButton(
              height: 50.h,
              text: "Accept",
              textColor: AppColors.kWhite,
              color: AppColors.kblue,
              onPressed: () async {
                context.read<NearbyRideRequestsCubit>().close();
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (_) => MapScreen(
                          nearbyRideRequest: nearbyRideRequest,
                        )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
