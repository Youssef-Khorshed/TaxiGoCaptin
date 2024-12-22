import 'data.dart';

class CompleteRide {
  bool? success;
  String? message;
  Data? data;

  CompleteRide({this.success, this.message, this.data});

  factory CompleteRide.fromJson(Map<String, dynamic> json) => CompleteRide(
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
