import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

abstract class NearbyRideRequestsRepo {
  Future<Either<Failure, NearbyRideRequestsModel>> fetchNearbyRideRequests(
      BuildContext context);
}
