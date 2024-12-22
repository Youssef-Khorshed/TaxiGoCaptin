import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String captinToken =
      '32|8t9ccIYshCZ3jBx8ITjqgtOC1FNgbA8kHAbCA5Rs23b9d158';
  static const String mapToken = 'AIzaSyCI1Xh53omwfYyDPXsovvHwjMgyvamPtow';

  /// Routes

  // /// nearby rides
  // static const String find_nearby_rides =
  //     '$baseUrl/captain/rides/find-nearby-rides';

  // /// find ride request
  // static String get_ride_request({required String rideId}) =>
  //     '$baseUrl/ride-requests/$rideId';

  static String accept_ride_request({required String rideId}) =>
      '/captain/rides/accept?ride_request_id=$rideId';

  static const String get_active_rides = '$baseUrl/captain/rides/active';

  static String update_captin_location = '$baseUrl/captain/update-location';

  static const String cancel_ride = '$baseUrl/captain/rides/cancel';

  static const String pickup_customer = '$baseUrl/captain/rides/pickup';

  static String complete_ride({required String distanceinKm}) =>
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

  // /// Payment
  // static String pay_after_ride_cash_amount({required String amount}) =>
  //     '$baseUrl/captain/rides/payment-cash?paid=$amount';
  // static String pay_cash_amount() => '$baseUrl/captain/rides/cash-amount';

  static const kModelFont = 'Medel';
  static const String getName = '';
  static const String postName = '';
  static const payAfterRide = '$baseUrl/captain/rides/payment-cash';
  static const completeRide = '$baseUrl/captain/rides/get-last';
}
