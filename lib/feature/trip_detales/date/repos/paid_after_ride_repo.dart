import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/paid_after_ride_model/paid_after_ride_model.dart';

abstract class PaidAfterRideRepo {
  Future<Either<Failure, PaidAfterRideModel>> pay(
      BuildContext context, double paid);
}
