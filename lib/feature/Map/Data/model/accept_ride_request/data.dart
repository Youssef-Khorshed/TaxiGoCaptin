import 'request.dart';
import 'ride.dart';

class Data {
  Ride? ride;
  Request? request;

  Data({this.ride, this.request});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ride: json['ride'] == null
            ? null
            : Ride.fromJson(json['ride'] as Map<String, dynamic>),
        request: json['request'] == null
            ? null
            : Request.fromJson(json['request'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'ride': ride?.toJson(),
        'request': request?.toJson(),
      };
}
