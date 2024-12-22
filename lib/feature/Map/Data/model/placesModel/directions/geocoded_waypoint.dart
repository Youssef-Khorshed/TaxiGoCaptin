class GeocodedWaypoint {
  String? geocoderStatus;
  String? placeId;
  List<String>? types;

  GeocodedWaypoint({this.geocoderStatus, this.placeId, this.types});

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) {
    return GeocodedWaypoint(
      geocoderStatus: json['geocoder_status'] as String?,
      placeId: json['place_id'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'geocoder_status': geocoderStatus,
        'place_id': placeId,
        'types': types,
      };
}
