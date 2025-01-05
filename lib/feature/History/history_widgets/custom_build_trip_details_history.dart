import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_driver_details_history.dart';

import 'custom_BuildAdressRow[1].dart';

class CustomBuildTripDetails extends StatelessWidget {
  final HistoryData historyData;

  const CustomBuildTripDetails({super.key, required this.historyData});

  @override
  Widget build(BuildContext context) {
    return TripDetails(
      historyData: historyData,
    );
  }
}

// ignore: must_be_immutable
class TripDetails extends StatelessWidget {
  const TripDetails({
    super.key,
    required this.historyData,
  });
  final HistoryData historyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5.h, right: 10.w, left: 10.w),
          color: AppColors.whiteColor,
          child: BuildAddressRow(
            historyData: historyData,
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        CustomDriverdetailsHistory(
          price: historyData.paid ?? "200",
        ),
      ],
    );
  }
}
