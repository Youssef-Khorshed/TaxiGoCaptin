import 'data.dart';

class GetActiveRide {
  bool? success;
  String? message;
  Data? data;

  GetActiveRide({this.success, this.message, this.data});

  factory GetActiveRide.fromJson(Map<String, dynamic> json) => GetActiveRide(
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
