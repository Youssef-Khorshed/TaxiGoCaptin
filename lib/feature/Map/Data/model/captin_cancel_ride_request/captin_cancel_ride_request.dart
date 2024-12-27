import 'data.dart';

class CaptinCancelRideRequest {
  bool? success;
  String? message;
  Data? data;

  CaptinCancelRideRequest({this.success, this.message, this.data});

  factory CaptinCancelRideRequest.fromJson(Map<String, dynamic> json) {
    return CaptinCancelRideRequest(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
