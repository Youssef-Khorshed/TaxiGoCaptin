import 'ride_request.dart';

class Data {
  int? id;
  int? rideRequestId;
  int? captainId;
  String? status;
  dynamic cancelReason;
  String? distance;
  double? time;
  String? distancePrice;
  double? timePrice;
  dynamic discount;
  double? total;
  dynamic rate;
  dynamic comment;
  dynamic paid;
  dynamic remainningCustomer;
  dynamic remainningCaptain;
  DateTime? pickupTime;
  DateTime? arivalTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  RideRequest? rideRequest;

  Data({
    this.id,
    this.rideRequestId,
    this.captainId,
    this.status,
    this.cancelReason,
    this.distance,
    this.time,
    this.distancePrice,
    this.timePrice,
    this.discount,
    this.total,
    this.rate,
    this.comment,
    this.paid,
    this.remainningCustomer,
    this.remainningCaptain,
    this.pickupTime,
    this.arivalTime,
    this.createdAt,
    this.updatedAt,
    this.rideRequest,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        rideRequestId: json['ride_request_id'] as int?,
        captainId: json['captain_id'] as int?,
        status: json['status'] as String?,
        cancelReason: json['cancel_reason'] as dynamic,
        distance: json['distance'] as String?,
        time: (json['time'] as num?)?.toDouble(),
        distancePrice: json['distance_price'] as String?,
        timePrice: (json['time_price'] as num?)?.toDouble(),
        discount: json['discount'] as dynamic,
        total: (json['total'] as num?)?.toDouble(),
        rate: json['rate'] as dynamic,
        comment: json['comment'] as dynamic,
        paid: json['paid'] as dynamic,
        remainningCustomer: json['remainning_customer'] as dynamic,
        remainningCaptain: json['remainning_captain'] as dynamic,
        pickupTime: json['pickup_time'] == null
            ? null
            : DateTime.parse(json['pickup_time'] as String),
        arivalTime: json['arival_time'] == null
            ? null
            : DateTime.parse(json['arival_time'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        rideRequest: json['ride_request'] == null
            ? null
            : RideRequest.fromJson(
                json['ride_request'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ride_request_id': rideRequestId,
        'captain_id': captainId,
        'status': status,
        'cancel_reason': cancelReason,
        'distance': distance,
        'time': time,
        'distance_price': distancePrice,
        'time_price': timePrice,
        'discount': discount,
        'total': total,
        'rate': rate,
        'comment': comment,
        'paid': paid,
        'remainning_customer': remainningCustomer,
        'remainning_captain': remainningCaptain,
        'pickup_time': pickupTime?.toIso8601String(),
        'arival_time': arivalTime?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'ride_request': rideRequest?.toJson(),
      };
}
