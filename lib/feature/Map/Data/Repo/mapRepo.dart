// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:dartz/dartz.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/complete_ride/complete_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/pickup_user/pickup_user.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/directions/directions.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/geocode_adress/geocode_adress.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/place_details.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/update_captin_location/update_captin_location.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

abstract class MapRepo {
//accept_ride_request //  get_active_rides // update_captin_location // cancel_ride pickup_customer // complete_ride

  Future<Either<Failure, AcceptRideRequest>> acceptRideRequest({
    required int rideID,
    required BuildContext context,
  });
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  });
  Future<Either<Failure, GetActiveRide>> getActiveRide({
    required BuildContext context,
  });

  Future<Either<Failure, UpdateCaptinLocation>> updateCaptinLocation({
    required BuildContext context,
    required LatLng location,
  });

  Future<Either<Failure, PickupUser>> pickCustomer({
    required BuildContext context,
  });

  Future<Either<Failure, CompleteRide>> completeRide({
    required double distanceinKm,
    required BuildContext context,
  });
  Future<Either<Failure, NearbyRideRequestsModel>> fetchNearbyRideRequests(
      BuildContext context);

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
