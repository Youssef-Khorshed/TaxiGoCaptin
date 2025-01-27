import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String profileEndPoint = "$baseUrl/profile";

  ///Test
  static const String historyEndPoint = "$baseUrl/captain/rides/history";
  static const String saveTripEndPoint = "$baseUrl/profile";
  static const String addFavTripEndPoint = "$baseUrl/profile";
  static const String captinToken =
      '32|8t9ccIYshCZ3jBx8ITjqgtOC1FNgbA8kHAbCA5Rs23b9d158';
  static const String mapToken = 'AIzaSyB3SWKn_1sA3pDumna7B9no7LAo21qC8OQ';

  static String kToken = "kToken";

  static String accept_ride_request({required int rideId}) =>
      '$baseUrl/captain/rides/accept?ride_request_id=$rideId';

  static const String get_active_rides = '$baseUrl/captain/rides/active';

  static String update_captin_location = '$baseUrl/captain/update-location';

  static const String cancel_ride = '$baseUrl/captain/rides/cancel';

  static const String pickup_customer = '$baseUrl/captain/rides/pickup';

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
  static const rooms = '${baseUrl}/captain/rides/get-messages';
  static const sendchat = '${baseUrl}/captain/rides/send-message';

  static String login = '/login';
  static String register = '/captain/register';
  static String sendVerification = "/ask-verification-code";
  static String verifyAccount = "/verify-email";
  static String forgotPassword = "/forgot-password";

  static String forgotPasswordCheckCode = "/forgot-password-check-code";

  static String setPassword = "/set-password";

  static String cities = '/cities';
  static String logout = "/logout";
  static String forgotPasswordSet = "/forgot-password-set";
  static String createProfile = "/profile/update";
  static String districts = "/districts-by-city";

  static const String walletDeposit = 'deposit';
  static const String walleTransactions = '/transactions';
  static const String walleGetProfileData = '/profile';
  static const String getAllNotification = '/notifications';
  static const String getAmount = '$baseUrl/captain/rides/cash-amount';

  static String depositURL({
    required String amount,
  }) =>
      "$baseUrl/$walletDeposit?amount=$amount";

  static String transactionsURL({
    String? transactionType,
    String? paymentMethod,
  }) {
    String url = '$baseUrl$walleTransactions';
    if (transactionType != null && transactionType.isNotEmpty) {
      url += '?transaction_type=$transactionType';
    }
    if (paymentMethod != null && paymentMethod.isNotEmpty) {
      url +=
          '${transactionType != null && transactionType.isNotEmpty ? '&' : '?'}payment_method=$paymentMethod';
    }
    return url;
  }

  static String getProfileURL() => '$baseUrl$walleGetProfileData';

  static String getAllNotificationURL() => '$baseUrl$getAllNotification';
}
