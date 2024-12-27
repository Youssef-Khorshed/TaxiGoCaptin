import 'geometry.dart';

class PlaceDetailsResult {
  Geometry? geometry;

  PlaceDetailsResult({this.geometry});

  factory PlaceDetailsResult.fromJson(Map<String, dynamic> json) =>
      PlaceDetailsResult(
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'geometry': geometry?.toJson(),
      };
}
