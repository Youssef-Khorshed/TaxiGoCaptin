class LocationPosition {
  double? lat;
  double? lng;

  LocationPosition({this.lat, this.lng});

  factory LocationPosition.fromJson(Map<String, dynamic> json) =>
      LocationPosition(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
