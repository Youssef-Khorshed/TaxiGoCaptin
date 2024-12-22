import 'data.dart';

class PickupUser {
  bool? success;
  String? message;
  Data? data;

  PickupUser({this.success, this.message, this.data});

  factory PickupUser.fromJson(Map<String, dynamic> json) => PickupUser(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
