import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';

abstract class RideCompleteRepo {
  Future<Either<Failure, RideCompleteDetailsModel>> getRideCompleteDetails(
      BuildContext context);
}
