import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/location.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/streanListener.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/complete_ride/complete_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/pickup_user/pickup_user.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/directions/leg.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/geocode_adress/result.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_search/prediction.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/rideRequestModel/cancel/cancelRideRequest.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/update_captin_location/update_captin_location.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapRepo mapsRepository;
  // for map intialization
  late GoogleMapController mapController;
  // for origin & destination
  GeocodeResult originAddress = GeocodeResult();
  GeocodeResult destinationAddress = GeocodeResult();
  Leg distanceTime = Leg();
  late Marker orignMarker;
  late Marker destinationMarker;
  late CameraPosition placeCameraPosition;
  LocationPosition? orginPosition;
  LocationPosition? destinationPosition;
  LocationService locationService = LocationService();
  late String destinationInfo;
  // these variables for getPlaceLocation
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  late Prediction placeSuggestion;
  List<Prediction> predictions = [];
  MapsCubit({required this.mapsRepository}) : super(MapsInitial());

  /// captin items
  DataService<Either<Failure, NearbyRideRequestsModel>>? dataService;
  AcceptRideRequest acceptRideRequest = AcceptRideRequest();
  UpdateCaptinLocation updateCaptinLocation = UpdateCaptinLocation();
  PickupUser pickupUser = PickupUser();
  CompleteRide completeRide = CompleteRide();
  CancelRideRequest cancelRideRequest = CancelRideRequest();
  GetActiveRide getActiveRide = GetActiveRide();

  /// get captin location
  Future<void> getCaptinLocation({required String title}) async {
    try {
      emit(PlaceAddressLoading());
      final captinLocation = await locationService.getuserLocation();
      orginPosition = LocationPosition(
        lat: captinLocation.latitude,
        lng: captinLocation.longitude,
      );
      emit(UpdateOriginLocatoin());

      buildmarker(
        title: title,
        destinationInfo: title,
        postion: LatLng(orginPosition!.lat!, orginPosition!.lng!),
      );
      updatePlaceCameraPosition(
          place: LatLng(captinLocation.latitude!, captinLocation.longitude!));
    } on PermissionException catch (error) {
      Fluttertoast.showToast(msg: error.message);
      emit(OpenLoacationFailed());
    }
  }

  /// start updating captin location
  getUserUpdatedLocation({required String title}) async {
    await locationService.updateUserLocation((LocationData userlocation) {
      try {
        emit(PlaceAddressLoading());
        debugPrint(userlocation.toString());
        orginPosition = LocationPosition(
          lat: userlocation.latitude,
          lng: userlocation.longitude,
        );
        emit(UpdateOriginLocatoin());
        buildmarker(
          title: title,
          destinationInfo: title,
          postion: LatLng(orginPosition!.lat!, orginPosition!.lng!),
        );

        updatePlaceCameraPosition(
          place: LatLng(
            userlocation.latitude!,
            userlocation.longitude!,
          ),
        );
      } on PermissionException catch (error) {
        Fluttertoast.showToast(msg: error.message);
        emit(OpenLoacationFailed());
      }
    });
  }

  /// get place Address form Loaction
  Future<GeocodeResult?> emitPlaceAddress({
    required LatLng placeLatLng,
    required String sessionToken,
    required BuildContext context,
  }) async {
    GeocodeResult? result;
    emit(PlaceAddressLoading());
    final res = await mapsRepository.getPlaceAddress(
        placeLatLng: placeLatLng, sessionToken: sessionToken, context: context);
    res.fold((error) => emit(GetAddressFail(message: error.message)),
        (onsuccess) {
      result = onsuccess.results![0];

      emit(GetAddressSuccess());
    });
    return result;
  }

  /// get place details location
  Future<void> emitPlaceLocation(
      {required String placeId,
      required String sessionToken,
      required BuildContext context}) async {
    emit(PlacesLoading());
    final response = await mapsRepository.getPlaceLocation(
        context: context, placeId: placeId, sessionToken: sessionToken);
    response.fold((onError) {}, (onSuccess) {
      destinationPosition = onSuccess.result!.geometry!.location!;
      emit(GetSearchedPlace(onSuccess.result!.geometry!.location!));
    });
  }

  /// get place directions between origin and destination
  Future<void> emitPlaceDirections({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
    required BuildContext context,
  }) async {
    emit(PlaceDirectionsLading());
    final response = await mapsRepository.getDrirection(
        origin: origin,
        destination: destination,
        sessionToken: sessionToken,
        context: context);
    response.fold((onError) {}, (onSuccess) {
      distanceTime = onSuccess.routes!.first.legs!.first;
      emit(LegsLoaded(leg: distanceTime));
      buildmarker(
        title: 'des',
        destinationInfo: 'des',
        postion: LatLng(destination.latitude, destination.longitude),
      );
      updatePlaceCameraPosition(place: destination, zoom: 10);
      drawPolyline(origin: origin, destination: destination);
      emit(DirectionsLoaded(polyLines));
    });
  }

  /// Draw polyline between origin and destination
  void drawPolyline({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      emit(DrawPolyinesLoading());
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: Constants.mapToken,
        request: PolylineRequest(
          origin: PointLatLng(orginPosition!.lat!, orginPosition!.lng!),
          destination:
              PointLatLng(destinationPosition!.lat!, destinationPosition!.lng!),
          mode: TravelMode.driving,
        ),
      );
      polyLines.clear();
      polyLines.add(Polyline(
        width: 5,
        polylineId: const PolylineId('route'),
        points:
            result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
      ));
      emit(DrawPolyinesSuccess());
    } catch (e) {
      emit(DrawPolyinesFailure(message: e.toString()));
    }
  }

  /// update place camera position for a place
  void updatePlaceCameraPosition(
      {required LatLng place, double zoom = 13}) async {
    placeCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(place.latitude, place.longitude),
      tilt: 0.0,
      zoom: zoom,
    );

    final GoogleMapController controller = mapController;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(placeCameraPosition));

    emit(UpdatePlaceCameraPosition());
  }

  /// build markers between origin and destination
  void buildmarker({
    required String title,
    required String destinationInfo,
    required LatLng postion,
  }) {
    markers.add(Marker(
        markerId: MarkerId(title),
        position: postion,
        infoWindow: InfoWindow(title: title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
    emit(UpdateMarkers());
  }

  //// Captin Ride Methods
  Future<void> canelRideRequest({required BuildContext context}) async {
    emit(CancelRideRequestLoading());
    final response = await mapsRepository.canelRideRequest(context: context);
    response.fold(
        (onError) => emit(CancelRideRequestFail(message: onError.message)),
        (onSuccess) {
      cancelRideRequest = onSuccess;
      emit(CancelRideRequestSuccess(rideRequest: cancelRideRequest));
    });
  }

  Future<void> accpetRideRequest(
      {required BuildContext context, required int rideID}) async {
    emit(AccpetRideRequestLoading());
    final res = await mapsRepository.acceptRideRequest(
        rideID: rideID, context: context);

    res.fold((ifLeft) => emit(AccpetRideRequestFail(message: ifLeft.message)),
        (ifRight) {
      acceptRideRequest = ifRight;
      emit(AccpetRideRequestSuccess(rideRequest: acceptRideRequest));
    });
  }

  Future<void> getActiveRideRequest({required BuildContext context}) async {
    emit(GetActiveRideRequestLoading());
    final res = await mapsRepository.getActiveRide(context: context);
    res.fold(
        (ifLeft) => emit(GetActiveRideRequestFail(message: ifLeft.message)),
        (ifRight) {
      getActiveRide = ifRight;
      emit(GetActiveRideRequestSuccess(activeRide: getActiveRide));
    });
  }

  Future<void> updateCaptinLoaction(
      {required BuildContext context, required LatLng location}) async {
    emit(UpdateCaptinLocationLoading());
    final res = await mapsRepository.updateCaptinLocation(
        context: context, location: location);
    res.fold(
        (ifLeft) => emit(UpdateCaptinLocationFail(message: ifLeft.message)),
        (ifRight) {
      updateCaptinLocation = ifRight;
      emit(UpdateCaptinLocationSuccess(
          updateCaptinLocation: updateCaptinLocation));
    });
  }

  Future<void> pickCustomer({required BuildContext context}) async {
    emit(PickUpUserLoading());
    final res = await mapsRepository.pickCustomer(context: context);
    res.fold((ifLeft) => emit(PickUpUserFail(message: ifLeft.message)),
        (ifRight) {
      pickupUser = ifRight;
      emit(PickUpUserSuccess(pickupUser: pickupUser));
    });
  }

  Future<void> completeRideRequest(
      {required BuildContext context, required double distanceinKm}) async {
    emit(CompleteRequestLoading());
    final res = await mapsRepository.completeRide(
        context: context, distanceinKm: distanceinKm);
    res.fold((ifLeft) => emit(CompleteRequestFail(message: ifLeft.message)),
        (ifRight) {
      completeRide = ifRight;
      emit(CompleteRideSuccess(completeRide: completeRide));
    });
  }

  Future<void> getNearbyRideRequests(BuildContext context) async {
    emit(NearbyRideRequestsLoading());

    dataService = DataService<Either<Failure, NearbyRideRequestsModel>>(
      fetchData: () => mapsRepository.fetchNearbyRideRequests(context),
      pollingInterval: Duration(seconds: 5),
    );

    try {
      dataService!.startPolling();

      dataService!.dataStream.listen(
        (event) {
          event.fold(
            (failure) {
              emit(NearbyRideRequestsFailure(failure.message));
            },
            (rideCompleteDetails) {
              emit(NearbyRideRequestsSuccess(rideCompleteDetails));
            },
          );
        },
        onError: (error) {
          emit(NearbyRideRequestsFailure('An error occurred: $error'));
        },
        onDone: () {},
      );
    } catch (error) {
      emit(NearbyRideRequestsFailure('Failed to start polling: $error'));
    }
  }

  Future<void> intializeCaptinLocatin(BuildContext context) async {
    emit(IntializationCaptinLocationLoading());
    await getCaptinLocation(title: 'captin');
    if (state is UpdateOriginLocatoin) {
      await updateCaptinLoaction(
          context: context,
          location: LatLng(orginPosition!.lat!, orginPosition!.lng!));
      emit(IntializationCaptinLocationSuccess());
    }
  }
}


// accept  - updatelocation  -  getactive  -  pickup - complete  
// accept  - cancel 
 