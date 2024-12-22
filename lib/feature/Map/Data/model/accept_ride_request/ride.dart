class Ride {
  int? rideRequestId;
  int? captainId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Ride({
    this.rideRequestId,
    this.captainId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
        rideRequestId: json['ride_request_id'] as int?,
        captainId: json['captain_id'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ride_request_id': rideRequestId,
        'captain_id': captainId,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
