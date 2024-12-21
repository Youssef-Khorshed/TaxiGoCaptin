import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/payments_details.dart';

class TripeCompleteDate extends StatelessWidget {
  const TripeCompleteDate({
    super.key,
    required this.rideCompleteDetailsModel,
  });
  final RideCompleteDetailsModel rideCompleteDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // LocationDetails(
        //   rideDetails: rideCompleteDetailsModel,
        // )
        // BuildAddressRow(
        //   rideDetails: rideCompleteDetailsModel,
        // ),
        verticalSpace(30.h),
        PaymentsDetails(
            rideDetails: rideCompleteDetailsModel,
            size: MediaQuery.of(context).size),
      ],
    );
  }
}
