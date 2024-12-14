import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

import '../../../../core/Utils/assets/assets.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripDetailsMap(
            address: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
            location: "University",
            icon: Assets.iconsMapRed,
          ),
          TripDetailsMap(
            address: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
            location: "Office",
            icon: Assets.iconsMapBlue,
          ),
        ],
      ),
      trailing: Text(
        "1.1 km",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
