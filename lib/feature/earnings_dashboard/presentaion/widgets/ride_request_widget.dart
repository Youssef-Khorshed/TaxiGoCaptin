import 'package:flutter/material.dart';

import 'driver_action.dart';
import 'driver_details.dart';
import 'trip_details.dart';

class RideRequestWidget extends StatelessWidget {
  const RideRequestWidget({Key? key}) : super(key: key);

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
            // Timeline section
            TripDetails(),

            // Driver Info
            DriverDetails(),

            const SizedBox(height: 25),

            // Buttons
            DriverAction(),
          ],
        ),
      ),
    );
  }
}
