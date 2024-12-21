class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api';
  static const String captinToken =
      '32|8t9ccIYshCZ3jBx8ITjqgtOC1FNgbA8kHAbCA5Rs23b9d158';
  static const String mapToken = 'AIzaSyCI1Xh53omwfYyDPXsovvHwjMgyvamPtow';

  /// Routes
  static const String find_nearby_rides = '/captain/rides/find-nearby-rides';
  static String get_ride_request({required String rideId}) =>
      '/ride-requests/$rideId';
  static String accept_ride_request({required String rideId}) =>
      '/captain/rides/accept?ride_request_id=$rideId';

  static const String get_active_rides = '/captain/rides/active';

  static const String cancel_ride = '/captain/rides/cancel';

  static const String pickup_customer = '/captain/rides/pickup';

  static String complete_ride({required String distanceinKm}) =>
      '/captain/rides/complete?distance=$distanceinKm';

  static String pay_cash_amount() => '/captain/rides/cash-amount';

  static String pay_after_ride_cash_amount({required String amount}) =>
      '/captain/rides/payment-cash?paid=$amount';
  static const kModelFont = 'Medel';
}
