class Data {
  int? id;
  String? lat;
  String? lng;

  Data({this.id, this.lat, this.lng});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
      };
}
