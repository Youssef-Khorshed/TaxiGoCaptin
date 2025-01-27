import 'datum.dart';

class NotificationModelData {
  bool? success;
  List<Datum>? data;

  NotificationModelData({this.success, this.data});

  factory NotificationModelData.fromJson(Map<String, dynamic> json) {
    return NotificationModelData(
      success: json['success']?.toString().contains("true"),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (success != null) 'success': success,
        if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
      };
}
