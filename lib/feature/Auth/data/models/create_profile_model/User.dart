class CreateProfileUser {
  CreateProfileUser({
      this.id, 
      this.name, 
      this.phone, 
      this.address, 
      this.cityId, 
      this.districtId, 
      this.gender, 
      this.picture,});

  CreateProfileUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    gender = json['gender'];
    picture = json['picture'];
  }
  int? id;
  String? name;
  String? phone;
  dynamic address;
  dynamic cityId;
  dynamic districtId;
  String? gender;
  dynamic picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['address'] = address;
    map['city_id'] = cityId;
    map['district_id'] = districtId;
    map['gender'] = gender;
    map['picture'] = picture;
    return map;
  }

}