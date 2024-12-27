class Districts {
  Districts({
      this.id, 
      this.cityId, 
      this.districtEn, 
      this.districtAr, 
      this.createdAt, 
      this.updatedAt, 
      this.district,});

  Districts.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['city_id'];
    districtEn = json['district_en'];
    districtAr = json['district_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district = json['district'];
  }
  int? id;
  int? cityId;
  String? districtEn;
  String? districtAr;
  String? createdAt;
  String? updatedAt;
  String? district;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_id'] = cityId;
    map['district_en'] = districtEn;
    map['district_ar'] = districtAr;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['district'] = district;
    return map;
  }

}