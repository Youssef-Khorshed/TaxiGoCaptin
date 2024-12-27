class RideCompleteDetailsModel {
  int? id;
  int? customerId;
  String? addressFrom;
  String? latFrom;
  String? lngFrom;
  String? addressTo;
  String? latTo;
  String? lngTo;
  int? tripType;
  String? paymentMethod;
  dynamic salePercentage;
  dynamic promocode;
  dynamic promocodeId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Ride? ride;

  RideCompleteDetailsModel({
    this.id,
    this.customerId,
    this.addressFrom,
    this.latFrom,
    this.lngFrom,
    this.addressTo,
    this.latTo,
    this.lngTo,
    this.tripType,
    this.paymentMethod,
    this.salePercentage,
    this.promocode,
    this.promocodeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.ride,
  });

  RideCompleteDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    addressFrom = json['address_from'];
    latFrom = json['lat_from'];
    lngFrom = json['lng_from'];
    addressTo = json['address_to'];
    latTo = json['lat_to'];
    lngTo = json['lng_to'];
    tripType = json['trip_type'];
    paymentMethod = json['payment_method'];
    salePercentage = json['sale_percentage'];
    promocode = json['promocode'];
    promocodeId = json['promocode_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ride = json['ride'] != null ? Ride.fromJson(json['ride'][0]) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['address_from'] = addressFrom;
    data['lat_from'] = latFrom;
    data['lng_from'] = lngFrom;
    data['address_to'] = addressTo;
    data['lat_to'] = latTo;
    data['lng_to'] = lngTo;
    data['trip_type'] = tripType;
    data['payment_method'] = paymentMethod;
    data['sale_percentage'] = salePercentage;
    data['promocode'] = promocode;
    data['promocode_id'] = promocodeId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (ride != null) {
      data['ride'] = [ride!.toJson()];
    }
    return data;
  }
}

class Ride {
  int? id;
  int? rideRequestId;
  int? captainId;
  String? status;
  double? distance;
  double? time;
  String? distancePrice;
  String? timePrice;
  dynamic discount;
  String? total;
  dynamic rate;
  String? paid;
  dynamic remainingCustomer;
  dynamic remainingCaptain;
  String? pickupTime;
  String? arrivalTime;
  String? createdAt;
  String? updatedAt;
  Captain? captain;

  Ride({
    this.id,
    this.rideRequestId,
    this.captainId,
    this.status,
    this.distance,
    this.time,
    this.distancePrice,
    this.timePrice,
    this.discount,
    this.total,
    this.rate,
    this.paid,
    this.remainingCustomer,
    this.remainingCaptain,
    this.pickupTime,
    this.arrivalTime,
    this.createdAt,
    this.updatedAt,
    this.captain,
  });

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rideRequestId = json['ride_request_id'];
    captainId = json['captain_id'];
    status = json['status'];
    distance = json['distance']?.toDouble();
    time = json['time']?.toDouble();
    distancePrice = json['distance_price'];
    timePrice = json['time_price'];
    discount = json['discount'];
    total = json['total'];
    rate = json['rate'];
    paid = json['paid'];
    remainingCustomer = json['remainning_customer'];
    remainingCaptain = json['remainning_captain'];
    pickupTime = json['pickup_time'];
    arrivalTime = json['arival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    captain =
        json['captain'] != null ? Captain.fromJson(json['captain']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ride_request_id'] = rideRequestId;
    data['captain_id'] = captainId;
    data['status'] = status;
    data['distance'] = distance;
    data['time'] = time;
    data['distance_price'] = distancePrice;
    data['time_price'] = timePrice;
    data['discount'] = discount;
    data['total'] = total;
    data['rate'] = rate;
    data['paid'] = paid;
    data['remainning_customer'] = remainingCustomer;
    data['remainning_captain'] = remainingCaptain;
    data['pickup_time'] = pickupTime;
    data['arival_time'] = arrivalTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (captain != null) {
      data['captain'] = captain!.toJson();
    }
    return data;
  }
}

class Captain {
  int? id;
  String? name;
  String? phone;
  String? status;

  Captain({
    this.id,
    this.name,
    this.phone,
    this.status,
  });

  Captain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}
