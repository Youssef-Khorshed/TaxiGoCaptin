// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:dartz/dartz.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/directions/directions.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/geocode_adress/geocode_adress.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/place_details.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';

abstract class MapRepo {
//accept_ride_request //  get_active_rides // update_captin_location // cancel_ride pickup_customer // complete_ride

  Future<Either<Failure, Unit>> acceptRideRequest({
    required String rideID,
    required BuildContext context,
  });
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  });
  Future<Either<Failure, GetActiveRide>> getActiveRide({
    required BuildContext context,
  });

  Future<Either<Failure, GetActiveRide>> updateCaptinLocation({
    required BuildContext context,
    required LatLng location,
  });

  Future<Either<Failure, GetActiveRide>> pickCustomer({
    required BuildContext context,
  });

  Future<Either<Failure, GetActiveRide>> completeRide({
    required BuildContext context,
  });

  /// Maps
  Future<Either<Failure, Directions>> getDrirection({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
    required BuildContext context,
  });
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  });
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress({
    required LatLng placeLatLng,
    required String sessionToken,
    required BuildContext context,
  });
}
