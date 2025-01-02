import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/data/save_trip_model.dart';

abstract class HistoryRepo {
  Future<Either<Failure, HistoryDataModel>> getData(BuildContext context,
      {String? tripHistory});
  Future<Either<Failure, AddToSaveToFavTripModel>> saveTrip(
      BuildContext context, int rideId);
  Future<Either<Failure, AddToSaveToFavTripModel>> addToFavTrip(
      BuildContext context, int rideId);
}
