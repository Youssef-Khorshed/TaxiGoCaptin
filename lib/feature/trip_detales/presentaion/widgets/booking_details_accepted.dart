// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

// ignore: must_be_immutable
class BookingDetailsAccepted extends StatelessWidget {
  NearbyRideRequestsData nearbyRideRequest;

  BookingDetailsAccepted({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Distance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "1.4 km",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            children: [
              Text(
                "Tima",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "6 Min",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
