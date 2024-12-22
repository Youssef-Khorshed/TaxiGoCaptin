import 'cancelRideRequestData.dart';

class CancelRideRequest {
  bool? success;
  String? error;
  CancelRideRequestData? rideRequest;

  CancelRideRequest({this.success, this.error, this.rideRequest});

  factory CancelRideRequest.fromJson(Map<String, dynamic> json) =>
      CancelRideRequest(
        success: json['success'] as bool?,
        error: json['error'] as String?,
        rideRequest: json['ride_request'] == null
            ? null
            : CancelRideRequestData.fromJson(
                json['ride_request'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
        'ride_request': rideRequest?.toJson(),
      };
}
