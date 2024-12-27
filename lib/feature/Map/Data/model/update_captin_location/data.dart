class Data {
  int? id;
  double? lat;
  double? lng;

  Data({this.id, this.lat, this.lng});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        lat: json['lat'] as double?,
        lng: json['lng'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
      };
}
