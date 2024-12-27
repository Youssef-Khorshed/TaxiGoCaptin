class User {
  User({
      this.id, 
      this.name, 
      this.phone, 
      this.address, 
      this.districtId, 
      this.cityId, 
      this.userType, 
      this.verified, 
      this.captain, 
      this.status, 
      this.available, 
      this.gender, 
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
      this.balance, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    districtId = json['district_id'];
    cityId = json['city_id'];
    userType = json['user_type'];
    verified = json['verified'];
    captain = json['captain'];
    status = json['status'];
    available = json['available'];
    gender = json['gender'];
    rate = json['rate'];
    picture = json['picture'];
    birthday = json['birthday'];
    lng = json['lng'];
    lat = json['lat'];
    customerFcm = json['customer_fcm'];
    captainFcm = json['captain_fcm'];
    lastOtp = json['last_otp'];
    lastOtpExpire = json['last_otp_expire'];
    emailVerifiedAt = json['email_verified_at'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? phone;
  dynamic address;
  dynamic districtId;
  dynamic cityId;
  String? userType;
  int? verified;
  int? captain;
  String? status;
  int? available;
  String? gender;
  dynamic rate;
  String? picture;
  dynamic birthday;
  dynamic lng;
  dynamic lat;
  dynamic customerFcm;
  dynamic captainFcm;
  String? lastOtp;
  String? lastOtpExpire;
  dynamic emailVerifiedAt;
  String? balance;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['address'] = address;
    map['district_id'] = districtId;
    map['city_id'] = cityId;
    map['user_type'] = userType;
    map['verified'] = verified;
    map['captain'] = captain;
    map['status'] = status;
    map['available'] = available;
    map['gender'] = gender;
    map['rate'] = rate;
    map['picture'] = picture;
    map['birthday'] = birthday;
    map['lng'] = lng;
    map['lat'] = lat;
    map['customer_fcm'] = customerFcm;
    map['captain_fcm'] = captainFcm;
    map['last_otp'] = lastOtp;
    map['last_otp_expire'] = lastOtpExpire;
    map['email_verified_at'] = emailVerifiedAt;
    map['balance'] = balance;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}