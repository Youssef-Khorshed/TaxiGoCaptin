import 'datum.dart';

class GetNearby {
  bool? success;
  String? message;
  List<RidePindingRequest>? data;

  GetNearby({this.success, this.message, this.data});

  factory GetNearby.fromJson(Map<String, dynamic> json) => GetNearby(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => RidePindingRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
