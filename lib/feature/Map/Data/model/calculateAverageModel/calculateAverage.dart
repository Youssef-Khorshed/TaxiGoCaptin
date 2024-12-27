import 'calculateAverageData.dart';

class CalculateAverage {
  bool? success;
  CalculateAverageData? data;

  CalculateAverage({this.success, this.data});

  factory CalculateAverage.fromJson(Map<String, dynamic> json) =>
      CalculateAverage(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : CalculateAverageData.fromJson(
                json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
      };
}
