import 'geocoded_waypoint.dart';
import 'route.dart';

class Directions {
  List<GeocodedWaypoint>? geocodedWaypoints;
  List<Route>? routes;
  String? status;

  Directions({this.geocodedWaypoints, this.routes, this.status});

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        geocodedWaypoints: (json['geocoded_waypoints'] as List<dynamic>?)
            ?.map((e) => GeocodedWaypoint.fromJson(e as Map<String, dynamic>))
            .toList(),
        routes: (json['routes'] as List<dynamic>?)
            ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'geocoded_waypoints':
            geocodedWaypoints?.map((e) => e.toJson()).toList(),
        'routes': routes?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
