import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/Utils/colors/colors.dart';
import 'locationwidget.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kw.withOpacity(.09),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            TimelineTile(
              isFirst: true,
              indicatorStyle: const IndicatorStyle(
                width: 15,
                color: Colors.blue,
                indicatorXY: 0.2,
              ),
              endChild: const LocationRow(
                text: "any city",
                time: "6:30 AM",
              ),
              afterLineStyle: const LineStyle(
                color: AppColors.kgrey,
                thickness: 2,
              ),
            ),
            TimelineTile(
              isLast: true,
              indicatorStyle: const IndicatorStyle(
                width: 15,
                color: Colors.red,
                indicatorXY: 0.8,
              ),
              endChild: const LocationRow(
                text: "another any city",
                time: "6:47 AM",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
