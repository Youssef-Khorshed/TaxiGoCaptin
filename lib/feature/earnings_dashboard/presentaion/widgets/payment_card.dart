import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripDetailsMap(
            address: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
            location: "University",
            icon: AppIcons.mapRed,
          ),
          TripDetailsMap(
            address: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
            location: "Office",
            icon: AppIcons.mapBlue,
          ),
        ],
      ),
      trailing: Text(
        "1.1 ${AppLocalizations.of(context)!.km}",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
