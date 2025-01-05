class GetProfileModel {
  final bool status;
  final String message;
  final List<dynamic> errors;
  final UserData? data;
  final List<dynamic> notes;

  GetProfileModel({
    required this.status,
    required this.message,
    required this.errors,
    this.data,
    required this.notes,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'] ?? [],
      data:
          json['data'] != null ? UserData.fromJson(json['data']['user']) : null,
      notes: json['notes'] ?? [],
    );
  }
}

class UserData {
  final int id;
  final String name;
  final String phone;
  final String address;
  final int districtId;
  final int cityId;
  final String userType;
  final bool verified;
  final bool captain;
  final String status;
  final bool available;
  final String gender;
  final double? rate;
  final String? picture;
  final DateTime? birthday;
  final double? lng;
  final double? lat;
  final String? customerFcm;
  final String? captainFcm;
  final String lastOtp;
  final DateTime lastOtpExpire;
  final DateTime? emailVerifiedAt;
  final double balance;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
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
    required this.lastOtp,
    required this.lastOtpExpire,
    this.emailVerifiedAt,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      address: json['address'] ?? "",
      districtId: json['district_id'] ?? 0,
      cityId: json['city_id'] ?? 0,
      userType: json['user_type'] ?? "",
      verified: json['verified'] == 1,
      captain: json['captain'] == 1,
      status: json['status'] ?? "",
      available: json['available'] == 1,
      gender: json['gender'] ?? "",
      rate: json['rate'] != null
          ? double.tryParse(json['rate'].toString())
          : null,
      picture: json['picture'] ?? "",
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      lng: json['lng'] != null ? double.tryParse(json['lng'].toString()) : null,
      lat: json['lat'] != null ? double.tryParse(json['lat'].toString()) : null,
      customerFcm: json['customer_fcm'],
      captainFcm: json['captain_fcm'],
      lastOtp: json['last_otp'],
      lastOtpExpire: DateTime.parse(json['last_otp_expire']),
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      balance: double.parse(json['balance']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
