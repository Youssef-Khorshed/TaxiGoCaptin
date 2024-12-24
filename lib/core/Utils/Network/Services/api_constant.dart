import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String captinToken =
      //   '131|BmmCi5b6ykluwU9m4GcWO0BSQySij5XhK09qxbIhab11396f';
      '32|8t9ccIYshCZ3jBx8ITjqgtOC1FNgbA8kHAbCA5Rs23b9d158';
  static const String mapToken = 'AIzaSyCmrk6YbjdCAlwichSDNyyfxlA7zwXhVwc';
  //12|q6MKp3jMFDLEiSgpkqjYTHL7wM4wVqsdovXGCzBo87dec1d2s
  //
  static String kToken = "kToken";

  static String accept_ride_request({required int rideId}) =>
      '$baseUrl/captain/rides/accept?ride_request_id=$rideId';

  static const String get_active_rides = '$baseUrl/captain/rides/active';

  static String update_captin_location = '$baseUrl/captain/update-location';

  static const String cancel_ride = '$baseUrl/captain/rides/cancel';

  static const String pickup_customer = '$baseUrl/captain/rides/pickup';

  static StreamSubscription<NearbyRideRequestsModel>? subscription;

  static Map<String, dynamic> update_captin_locationBody(
          {required LatLng location}) =>
      {'lat': location.latitude, 'lng': location.longitude};

  static String complete_ride({required double distanceinKm}) =>
      '$baseUrl/captain/rides/complete?distance=$distanceinKm';
  static String placeDetails({
    required String placeId,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&sessiontoken=$sessionToken&key=$mapToken';

  static String geolcatorAddress({
    required LatLng placeLatLng,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${placeLatLng.latitude},${placeLatLng.longitude}&key=$mapToken&sessiontoken=$sessionToken';

  static String directions({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
  }) =>
      'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$mapToken&sessiontoken=$sessionToken';

  static const kModelFont = 'Medel';
  static const String getName = '';
  static const String postName = '';
  static const payAfterRide = '$baseUrl/captain/rides/payment-cash';
  static const completeRide = '$baseUrl/captain/rides/get-last';
  static const captainDocumentsEndPoint = '$baseUrl/captain/files';
  static const nearbyRideRequestsEndPoint =
      '$baseUrl/captain/rides/find-nearby-rides';
}
