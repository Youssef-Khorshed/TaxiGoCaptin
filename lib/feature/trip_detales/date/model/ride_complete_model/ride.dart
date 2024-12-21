// class Ride {
//   int? id;
//   int? rideRequestId;
//   int? captainId;
//   String? status;
//   double? distance;
//   double? time;
//   String? distancePrice;
//   String? timePrice;
//   dynamic discount;
//   String? total;
//   dynamic rate;
//   String? paid;
//   dynamic remainingCustomer;
//   dynamic remainingCaptain;
//   String? pickupTime;
//   String? arrivalTime;
//   String? createdAt;
//   String? updatedAt;
//   Captain? captain;
//
//   Ride({
//     this.id,
//     this.rideRequestId,
//     this.captainId,
//     this.status,
//     this.distance,
//     this.time,
//     this.distancePrice,
//     this.timePrice,
//     this.discount,
//     this.total,
//     this.rate,
//     this.paid,
//     this.remainingCustomer,
//     this.remainingCaptain,
//     this.pickupTime,
//     this.arrivalTime,
//     this.createdAt,
//     this.updatedAt,
//     this.captain,
//   });
//
//   Ride.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     rideRequestId = json['ride_request_id'];
//     captainId = json['captain_id'];
//     status = json['status'];
//     distance = json['distance']?.toDouble();
//     time = json['time']?.toDouble();
//     distancePrice = json['distance_price'];
//     timePrice = json['time_price'];
//     discount = json['discount'];
//     total = json['total'];
//     rate = json['rate'];
//     paid = json['paid'];
//     remainingCustomer = json['remainning_customer'];
//     remainingCaptain = json['remainning_captain'];
//     pickupTime = json['pickup_time'];
//     arrivalTime = json['arival_time'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     captain =
//     json['captain'] != null ? Captain.fromJson(json['captain']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['ride_request_id'] = rideRequestId;
//     data['captain_id'] = captainId;
//     data['status'] = status;
//     data['distance'] = distance;
//     data['time'] = time;
//     data['distance_price'] = distancePrice;
//     data['time_price'] = timePrice;
//     data['discount'] = discount;
//     data['total'] = total;
//     data['rate'] = rate;
//     data['paid'] = paid;
//     data['remainning_customer'] = remainingCustomer;
//     data['remainning_captain'] = remainingCaptain;
//     data['pickup_time'] = pickupTime;
//     data['arival_time'] = arrivalTime;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (captain != null) {
//       data['captain'] = captain!.toJson();
//     }
//     return data;
//   }
// }
