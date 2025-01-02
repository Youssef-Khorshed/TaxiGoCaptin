import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_build_trip_details_history.dart';

// ignore: must_be_immutable
class HistoryTripCard extends StatelessWidget {
  final void Function() onStarPressed;
  final void Function() onSavedPressed;
  final HistoryData historyData;

  const HistoryTripCard({
    super.key,
    required this.onStarPressed,
    required this.onSavedPressed,
    required this.historyData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.grayColor,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onStarPressed,
                  icon: Icon(
                    historyData.isFavorite == true
                        ? Icons.star
                        : Icons.star_border_outlined,
                    color: AppColors.amberColor,
                  ),
                ),
                IconButton(
                    onPressed: onSavedPressed,
                    icon: Icon(
                      historyData.isSaved == true
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: AppColors.blueColor,
                    ))
              ],
            ),
          ),
          CustomBuildTripDetails(
            historyData: historyData,
          ),
        ],
      ),
    );
  }
}
