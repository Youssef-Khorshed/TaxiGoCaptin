import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/payment_card.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/timer_to_accept.dart';

import 'driver_action.dart';
import 'driver_details.dart';
import 'trip_details.dart';

class RideRequestWidget extends StatelessWidget {
  const RideRequestWidget({super.key});

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
            DriverDetails(),
            LocationDetails(),
            verticalSpace(15.h),
            DriverAction(),
            verticalSpace(10.h),
            TimerToAccept(),
          ],
        ),
      ),
    );
  }
}
