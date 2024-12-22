import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/custom_build_adress_row.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/timer_to_accept.dart';
import 'driver_action.dart';

class RideRequestWidget extends StatelessWidget {
  final NearbyRideRequestsData nearbyRideRequestsData;
  const RideRequestWidget({super.key, required this.nearbyRideRequestsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(15.h),
            // DriverDetails(),
            // LocationDetails(),
            BuildAddressRow(
              nearbyRideRequestsData: nearbyRideRequestsData,
            ),

            verticalSpace(15.h),
            DriverAction(
              nearbyRideRequest: nearbyRideRequestsData,
            ),
            verticalSpace(10.h),
            TimerToAccept(),
          ],
        ),
      ),
    );
  }
}
