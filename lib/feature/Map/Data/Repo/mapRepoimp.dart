import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepo.dart';
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

class Maprepoimp extends MapRepo {
  ApiService apiService;
  Maprepoimp({required this.apiService});

  @override
  Future<Either<Failure, PlaceDetails>> getPlaceLocation({
    required String placeId,
    required String sessionToken,
    required BuildContext context,
  }) async {
    final res = await apiService.getRequest(
        context: context,
        Constants.placeDetails(placeId: placeId, sessionToken: sessionToken));
    return res.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      return Right(PlaceDetails.fromJson(response.data));
    });
  }

  @override
  Future<Either<Failure, CancelRideRequest>> canelRideRequest({
    required BuildContext context,
  }) async {
    final res =
        await apiService.postRequest(context: context, Constants.cancel_ride);
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(CancelRideRequest.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, Directions>> getDrirection(
      {required LatLng origin,
      required LatLng destination,
      required String sessionToken,
      required BuildContext context}) async {
    final res = await apiService.getRequest(
        context: context,
        Constants.directions(
            origin: origin,
            destination: destination,
            sessionToken: sessionToken));
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(Directions.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, GeocodeAdress>> getPlaceAddress(
      {required LatLng placeLatLng,
      required String sessionToken,
      required BuildContext context}) async {
    final res = await apiService.getRequest(
        context: context,
        Constants.geolcatorAddress(
            sessionToken: sessionToken, placeLatLng: placeLatLng));

    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(GeocodeAdress.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, GetActiveRide>> getActiveRide(
      {required BuildContext context}) async {
    final res = await apiService.getRequest(
        context: context, Constants.get_active_rides);
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(GetActiveRide.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, AcceptRideRequest>> acceptRideRequest(
      {required int rideID, required BuildContext context}) async {
    final res = await apiService.postRequest(
        context: context, Constants.accept_ride_request(rideId: rideID));
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(AcceptRideRequest.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, CompleteRide>> completeRide(
      {required double distanceinKm, required BuildContext context}) async {
    final res = await apiService.postRequest(
        context: context,
        Constants.complete_ride(
          distanceinKm: distanceinKm,
        ));
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(CompleteRide.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, PickupUser>> pickCustomer(
      {required BuildContext context}) async {
    final res = await apiService.postRequest(
        context: context, Constants.pickup_customer);
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(PickupUser.fromJson(res.data)));
  }

  @override
  Future<Either<Failure, UpdateCaptinLocation>> updateCaptinLocation(
      {required BuildContext context, required LatLng location}) async {
    final res = await apiService.postRequest(
        context: context,
        Constants.update_captin_location,
        body: Constants.update_captin_locationBody(location: location));
    return res.fold((l) => Left(ServerFailure(message: l)),
        (res) => Right(UpdateCaptinLocation.fromJson(res.data)));
  }

  Future<Either<Failure, NearbyRideRequestsModel>> fetchNearbyRideRequests(
      BuildContext context) async {
    final response = await apiService.getRequest(
        context: context, Constants.nearbyRideRequestsEndPoint);
    return response.fold((l) => Left(ServerFailure(message: l)),
        (response) => Right(NearbyRideRequestsModel.fromJson(response.data)));
  }
}
