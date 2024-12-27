class User {
  User({
      this.name, 
      this.phone, 
      this.gender, 
      this.lastOtp, 
      this.lastOtpExpire, 
      this.userType, 
      this.captain, 
      this.status, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    lastOtp = json['last_otp'];
    lastOtpExpire = json['last_otp_expire'];
    userType = json['user_type'];
    captain = json['captain'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? phone;
  String? gender;
  String? lastOtp;
  String? lastOtpExpire;
  String? userType;
  int? captain;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['gender'] = gender;
    map['last_otp'] = lastOtp;
    map['last_otp_expire'] = lastOtpExpire;
    map['user_type'] = userType;
    map['captain'] = captain;
    map['status'] = status;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}