import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/complete_ride/complete_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/pickup_user/pickup_user.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/directions/leg.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_search/prediction.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/update_captin_location/update_captin_location.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

abstract class MapsState {}

class MapsInitial extends MapsState {}

class MapsInitialized extends MapsState {}

class ArrivedToCustomer extends MapsState {
  bool arrivedtoCustomer;
  ArrivedToCustomer({required this.arrivedtoCustomer});
}

class TripStarted extends MapsState {
  bool tripStarted;
  TripStarted({required this.tripStarted});
}

class TripFinished extends MapsState {
  bool tripFinished;
  TripFinished({required this.tripFinished});
}

class UpdatePlaceCameraPosition extends MapsState {}

class UpdateBoundsPosition extends MapsState {}

class UpdateMarkers extends MapsState {}

class UpdateOriginLocatoin extends MapsState {
  LocationPosition locationPosition;
  UpdateOriginLocatoin({required this.locationPosition});
}

class UpdateDestinationLocatoin extends MapsState {}

class PlacesLoading extends MapsState {}

class OpenLoacationFailed extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<Prediction> places;

  PlacesLoaded(this.places);
}

class DrawPolyinesLoading extends MapsState {}

class DrawPolyinesSuccess extends MapsState {}

class DrawPolyinesFailure extends MapsState {
  String message;

  DrawPolyinesFailure({required this.message});
}

class ConvertToAddressSuccess extends MapsState {}

class CalculatePriceLoading extends MapsState {}

class CalculatePriceFail extends MapsState {}

class CalculatePriceSuccess extends MapsState {}

class RideRequestLoading extends MapsState {}

class RideRequestFail extends MapsState {}

class RideRequestSuccess extends MapsState {}

class PlacesFailLoaded extends MapsState {
  String message;
  PlacesFailLoaded({required this.message});
}

class GetSearchedPlace extends MapsState {
  final LocationPosition geometry;

  GetSearchedPlace(this.geometry);
}

class DirectionsLoaded extends MapsState {
  Set<Polyline> polylines;
  DirectionsLoaded(this.polylines);
}

class LegsLoaded extends MapsState {
  Leg leg;
  LegsLoaded({required this.leg});
}

class PlaceDirectionsLading extends MapsState {}

class GetDistanceLatLngSuccess extends MapsState {
  Leg leg;
  GetDistanceLatLngSuccess({required this.leg});
}

class Accepted extends MapsState {}

class GetUserLocation extends MapsState {
  LocationPosition locationPosition;
  GetUserLocation({required this.locationPosition});
}

class GetAddressLoading extends MapsState {}

class GetAddressSuccess extends MapsState {}

class PlaceAddressLoading extends MapsState {}

class GetAddressFail extends MapsState {
  String message;
  GetAddressFail({required this.message});
}

/// Accept Ride Request
class AccpetRideRequestLoading extends MapsState {}

class AccpetRideRequestFail extends MapsState {
  String message;
  AccpetRideRequestFail({required this.message});
}

class AccpetRideRequestSuccess extends MapsState {
  AcceptRideRequest rideRequest;
  AccpetRideRequestSuccess({required this.rideRequest});
}

/// Get Active Ride
class GetActiveRideRequestLoading extends MapsState {}

class GetActiveRideRequestSuccess extends MapsState {
  final GetActiveRide activeRide;
  GetActiveRideRequestSuccess({required this.activeRide});
}

class GetActiveRideRequestFail extends MapsState {
  final String message;
  GetActiveRideRequestFail({required this.message});
}

/// Cancel Ride Request
class CancelRideRequestLoading extends MapsState {}

class CancelRideRequestSuccess extends MapsState {
  CancelRideRequest rideRequest;
  CancelRideRequestSuccess({required this.rideRequest});
}

class CancelRideRequestFail extends MapsState {
  String message;
  CancelRideRequestFail({required this.message});
}

/// pcik customer
class PickUpUserLoading extends MapsState {}

class PickUpUserSuccess extends MapsState {
  PickupUser pickupUser;
  PickUpUserSuccess({required this.pickupUser});
}

class PickUpUserFail extends MapsState {
  String message;
  PickUpUserFail({required this.message});
}

/// Complete Ride
class CompleteRequestLoading extends MapsState {}

class CompleteRideSuccess extends MapsState {
  CompleteRide completeRide;
  CompleteRideSuccess({required this.completeRide});
}

class CompleteRequestFail extends MapsState {
  String message;
  CompleteRequestFail({required this.message});
}

/// Update Captin Location
class UpdateCaptinLocationLoading extends MapsState {}

class UpdateCaptinLocationSuccess extends MapsState {
  UpdateCaptinLocation updateCaptinLocation;
  UpdateCaptinLocationSuccess({required this.updateCaptinLocation});
}

class UpdateCaptinLocationFail extends MapsState {
  String message;
  UpdateCaptinLocationFail({required this.message});
}

/// nearby
final class NearbyRideRequestsInitial extends MapsState {}

final class NearbyRideRequestsLoading extends MapsState {}

final class NearbyRideRequestsSuccess extends MapsState {
  final NearbyRideRequestsModel nearbyRideRequestsModel;
  NearbyRideRequestsSuccess(this.nearbyRideRequestsModel);
}

final class NearbyRideRequestsFailure extends MapsState {
  final String message;
  NearbyRideRequestsFailure(this.message);
}

/// intialization captin
final class IntializationCaptinLocationSuccess extends MapsState {}

final class IntializationCaptinLocationFail extends MapsState {}

final class IntializationCaptinLocationLoading extends MapsState {}
