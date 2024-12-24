import 'dart:convert';

class RideCompleteDetailsModel {
  final int id;
  final int rideRequestId;
  final int captainId;
  final String status;
  final String? cancelReason;
  final double distance;
  final double time;
  final String distancePrice;
  final String timePrice;
  final String? discount;
  final String total;
  final String? rate;
  final String? comment;
  final String paid;
  final String remainningCustomer;
  final String remainningCaptain;
  final DateTime pickupTime;
  final DateTime arivalTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RideRequest rideRequest;

  RideCompleteDetailsModel({
    required this.id,
    required this.rideRequestId,
    required this.captainId,
    required this.status,
    this.cancelReason,
    required this.distance,
    required this.time,
    required this.distancePrice,
    required this.timePrice,
    this.discount,
    required this.total,
    this.rate,
    this.comment,
    required this.paid,
    required this.remainningCustomer,
    required this.remainningCaptain,
    required this.pickupTime,
    required this.arivalTime,
    required this.createdAt,
    required this.updatedAt,
    required this.rideRequest,
  });

  factory RideCompleteDetailsModel.fromJson(Map<String, dynamic> json) =>
      RideCompleteDetailsModel(
        id: json['id'],
        rideRequestId: json['ride_request_id'],
        captainId: json['captain_id'],
        status: json['status'],
        cancelReason: json['cancel_reason'],
        distance: (json['distance'] as num).toDouble(),
        time: (json['time'] as num).toDouble(),
        distancePrice: json['distance_price'],
        timePrice: json['time_price'],
        discount: json['discount'],
        total: json['total'],
        rate: json['rate'],
        comment: json['comment'],
        paid: json['paid'],
        remainningCustomer: json['remainning_customer'],
        remainningCaptain: json['remainning_captain'],
        pickupTime: DateTime.parse(json['pickup_time']),
        arivalTime: DateTime.parse(json['arival_time']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        rideRequest: RideRequest.fromJson(json['ride_request']),
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
        'pickup_time': pickupTime.toIso8601String(),
        'arival_time': arivalTime.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'ride_request': rideRequest.toJson(),
      };
}

class RideRequest {
  final int id;
  final int customerId;
  final String addressFrom;
  final String latFrom;
  final String lngFrom;
  final String addressTo;
  final String latTo;
  final String lngTo;
  final int tripType;
  final String paymentMethod;
  final String? salePercentage;
  final String? promocode;
  final String? promocodeId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Customer customer;

  RideRequest({
    required this.id,
    required this.customerId,
    required this.addressFrom,
    required this.latFrom,
    required this.lngFrom,
    required this.addressTo,
    required this.latTo,
    required this.lngTo,
    required this.tripType,
    required this.paymentMethod,
    this.salePercentage,
    this.promocode,
    this.promocodeId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
  });

  factory RideRequest.fromJson(Map<String, dynamic> json) => RideRequest(
        id: json['id'],
        customerId: json['customer_id'],
        addressFrom: json['address_from'],
        latFrom: json['lat_from'],
        lngFrom: json['lng_from'],
        addressTo: json['address_to'],
        latTo: json['lat_to'],
        lngTo: json['lng_to'],
        tripType: json['trip_type'],
        paymentMethod: json['payment_method'],
        salePercentage: json['sale_percentage'],
        promocode: json['promocode'],
        promocodeId: json['promocode_id'],
        status: json['status'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        customer: Customer.fromJson(json['customer']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'address_from': addressFrom,
        'lat_from': latFrom,
        'lng_from': lngFrom,
        'address_to': addressTo,
        'lat_to': latTo,
        'lng_to': lngTo,
        'trip_type': tripType,
        'payment_method': paymentMethod,
        'sale_percentage': salePercentage,
        'promocode': promocode,
        'promocode_id': promocodeId,
        'status': status,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'customer': customer.toJson(),
      };
}

class Customer {
  final int id;
  final String name;
  final String phone;
  final String address;
  final int districtId;
  final int cityId;
  final String userType;
  final int verified;
  final int captain;
  final String status;
  final int available;
  final String gender;
  final String? rate;
  final String? picture;
  final String? birthday;
  final String? lng;
  final String? lat;
  final String? customerFcm;
  final String? captainFcm;
  final String? lastOtp;
  final DateTime? lastOtpExpire;
  final String? emailVerifiedAt;
  final String balance;
  final DateTime createdAt;
  final DateTime updatedAt;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.districtId,
    required this.cityId,
    required this.userType,
    required this.verified,
    required this.captain,
    required this.status,
    required this.available,
    required this.gender,
    this.rate,
    this.picture,
    this.birthday,
    this.lng,
    this.lat,
    this.customerFcm,
    this.captainFcm,
    this.lastOtp,
    this.lastOtpExpire,
    this.emailVerifiedAt,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        districtId: json['district_id'],
        cityId: json['city_id'],
        userType: json['user_type'],
        verified: json['verified'],
        captain: json['captain'],
        status: json['status'],
        available: json['available'],
        gender: json['gender'],
        rate: json['rate'],
        picture: json['picture'],
        birthday: json['birthday'],
        lng: json['lng'],
        lat: json['lat'],
        customerFcm: json['customer_fcm'],
        captainFcm: json['captain_fcm'],
        lastOtp: json['last_otp'],
        lastOtpExpire: json['last_otp_expire'] != null
            ? DateTime.parse(json['last_otp_expire'])
            : null,
        emailVerifiedAt: json['email_verified_at'],
        balance: json['balance'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'address': address,
        'district_id': districtId,
        'city_id': cityId,
        'user_type': userType,
        'verified': verified,
        'captain': captain,
        'status': status,
        'available': available,
        'gender': gender,
        'rate': rate,
        'picture': picture,
        'birthday': birthday,
        'lng': lng,
        'lat': lat,
        'customer_fcm': customerFcm,
        'captain_fcm': captainFcm,
        'last_otp': lastOtp,
        'last_otp_expire': lastOtpExpire?.toIso8601String(),
        'email_verified_at': emailVerifiedAt,
        'balance': balance,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
