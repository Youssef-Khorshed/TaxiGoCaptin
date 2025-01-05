class HistoryDataModel {
  bool? success;
  String? message;
  List<HistoryData>? data;

  HistoryDataModel({this.success, this.message, this.data});

  HistoryDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data =
          (json['data'] as List).map((v) => HistoryData.fromJson(v)).toList();
    }
  }
}

class HistoryData {
  int? id;
  int? rideRequestId;
  int? captainId;
  String? status;
  String? cancelReason;
  dynamic distance;
  dynamic time;
  dynamic distancePrice;
  dynamic timePrice;
  dynamic discount;
  dynamic total;
  dynamic rate;
  String? comment;
  dynamic paid;
  dynamic remainingCustomer;
  dynamic remainingCaptain;
  String? pickupTime;
  String? arrivalTime;
  String? createdAt;
  String? updatedAt;
  RideRequest? rideRequest;

  HistoryData({
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
    this.remainingCustomer,
    this.remainingCaptain,
    this.pickupTime,
    this.arrivalTime,
    this.createdAt,
    this.updatedAt,
    this.rideRequest,
  });

  HistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rideRequestId = json['ride_request_id'];
    captainId = json['captain_id'];
    status = json['status'];
    cancelReason = json['cancel_reason'];
    distance = json['distance'];
    time = json['time'];
    distancePrice = json['distance_price'];
    timePrice = json['time_price'];
    discount = json['discount'];
    total = json['total'];
    rate = json['rate'];
    comment = json['comment'];
    paid = json['paid'];
    remainingCustomer = json['remainning_customer'];
    remainingCaptain = json['remainning_captain'];
    pickupTime = json['pickup_time'];
    arrivalTime = json['arival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rideRequest = json['ride_request'] != null
        ? RideRequest.fromJson(json['ride_request'])
        : null;
  }
}

class RideRequest {
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

  RideRequest({
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
  });

  RideRequest.fromJson(Map<String, dynamic> json) {
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
  }
}
