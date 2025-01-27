class ProfielModel {
  bool? status;
  String? message;
  List<String?>? errors;
  ProfileData? data;

  ProfielModel({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  ProfielModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'].cast<String>();
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
}

class ProfileData {
  UserInfo? user;

  ProfileData({this.user});

  ProfileData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserInfo.fromJson(json['user']) : null;
  }
}

class UserInfo {
  String? name;
  String? phone;
  String? gender;
  String? picture;
  String? birthday;
  String? address;
  String? rate;
  String? balance;
  String? emailVerifiedAt;
  num? daily_earnings;
  int? daily_rides;

  UserInfo({
    this.daily_earnings,
    this.daily_rides,
    this.name,
    this.phone,
    this.gender,
    this.picture,
    this.birthday,
    this.address,
    this.rate,
    this.balance,
    this.emailVerifiedAt,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    daily_earnings = json['daily_earnings'];
    daily_rides = json['daily_rides'];
    name = json['name'];
    phone = json['phone'];

    gender = json['gender'];

    picture = json['picture'];
    birthday = json['birthday'];
    address = json['address'];
    rate = json['rate'];
    balance = json['balance'];

    emailVerifiedAt = json['email_verified_at'];
  }
}
