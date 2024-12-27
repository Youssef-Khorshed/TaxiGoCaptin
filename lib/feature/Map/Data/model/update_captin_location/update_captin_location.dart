import 'data.dart';

class UpdateCaptinLocation {
  bool? success;
  String? message;
  Data? data;

  UpdateCaptinLocation({this.success, this.message, this.data});

  factory UpdateCaptinLocation.fromJson(Map<String, dynamic> json) {
    return UpdateCaptinLocation(
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
