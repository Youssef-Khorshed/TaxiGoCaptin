import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_BuildAdressRow(1).dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/location_details.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/payments_details.dart';

import '../../../account_screen/presentaion/widgets/costume_bottun.dart';

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
        BuildAddressRow(
          rideDetails: rideCompleteDetailsModel,
        ),
        verticalSpace(30.h),
        PaymentsDetails(
            rideDetails: rideCompleteDetailsModel,
            size: MediaQuery.of(context).size),
        verticalSpace(MediaQuery.of(context).size.height * 0.3),
        CostumeButton(
          color: AppColors.kblue,
          textColor: AppColors.kWhite,
          text: "Submit",
        ),
      ],
    );
  }
}
