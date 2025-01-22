import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_driver/feature/History/history_widgets/custom_details_filter_dropdown.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: Skeletonizer(
        child: Column(
          children: [
            CustomDetailsfilterdropdown(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true, // أضف هذا السطر
              itemCount: 2,
              itemBuilder: (context, index) {
                return const CustomDummyWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
