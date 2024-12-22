import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/directions/directions.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/geocode_adress/geocode_adress.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/place_details.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';

class Maprepoimp extends MapRepo {
  ApiService apiService;
  Maprepoimp({required this.apiService});

  @override
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  }) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.placeDetails(placeId: placeId, sessionToken: sessionToken));
      return Right(PlaceDetails.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  }) async {
    try {
      final res =
          await apiService.postRequest(context: context, Constants.cancel_ride);
      return Right(CancelRideRequest.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Directions>> getDrirection(
      {required LatLng origin,
      required LatLng destination,
      required String sessionToken,
      required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.directions(
              origin: origin,
              destination: destination,
              sessionToken: sessionToken));
      return Right(Directions.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress(
      {required LatLng placeLatLng,
      required String sessionToken,
      required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context,
          Constants.geolcatorAddress(
              sessionToken: sessionToken, placeLatLng: placeLatLng));
      return Right(GeocodeAdress.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, GetActiveRide>> getActiveRide(
      {required BuildContext context}) async {
    try {
      final res = await apiService.getRequest(
          context: context, Constants.get_active_rides);
      return Right(GetActiveRide.fromJson(res));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptRideRequest(
      {required String rideID, required BuildContext context}) {
    // TODO: implement acceptRideRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetActiveRide>> completeRide(
      {required BuildContext context}) {
    // TODO: implement completeRide
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetActiveRide>> pickCustomer(
      {required BuildContext context}) {
    // TODO: implement pickCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetActiveRide>> updateCaptinLocation(
      {required BuildContext context, required LatLng location}) {
    // TODO: implement updateCaptinLocation
    throw UnimplementedError();
  }
}
