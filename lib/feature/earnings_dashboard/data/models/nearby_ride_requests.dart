// To parse this JSON data, do
//
//     final nearbyRideRequestsModel = nearbyRideRequestsModelFromJson(jsonString);

class NearbyRideRequestsModel {
  bool? success;
  String? message;
  List<NearbyRideRequestsData>? data;

  NearbyRideRequestsModel({
    this.success,
    this.message,
    this.data,
  });

  factory NearbyRideRequestsModel.fromJson(Map<String, dynamic> json) =>
      NearbyRideRequestsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NearbyRideRequestsData>.from(
                json["data"]!.map((x) => NearbyRideRequestsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NearbyRideRequestsData {
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
  DateTime? createdAt;
  DateTime? updatedAt;

  NearbyRideRequestsData({
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

  factory NearbyRideRequestsData.fromJson(Map<String, dynamic> json) =>
      NearbyRideRequestsData(
        id: json["id"],
        customerId: json["customer_id"],
        addressFrom: json["address_from"],
        latFrom: json["lat_from"],
        lngFrom: json["lng_from"],
        addressTo: json["address_to"],
        latTo: json["lat_to"],
        lngTo: json["lng_to"],
        tripType: json["trip_type"],
        paymentMethod: json["payment_method"],
        salePercentage: json["sale_percentage"],
        promocode: json["promocode"],
        promocodeId: json["promocode_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "address_from": addressFrom,
        "lat_from": latFrom,
        "lng_from": lngFrom,
        "address_to": addressTo,
        "lat_to": latTo,
        "lng_to": lngTo,
        "trip_type": tripType,
        "payment_method": paymentMethod,
        "sale_percentage": salePercentage,
        "promocode": promocode,
        "promocode_id": promocodeId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
