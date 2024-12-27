import 'rideRequestData.dart';

class RideRequest {
  bool? success;
  String? message;
  RideRequestData? data;

  RideRequest({this.success, this.message, this.data});

  factory RideRequest.fromJson(Map<String, dynamic> json) => RideRequest(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : RideRequestData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
