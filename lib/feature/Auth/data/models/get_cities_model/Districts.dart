class Districts {
  Districts({
      this.id, 
      this.cityId, 
      this.district, 
      this.createdAt, 
      this.updatedAt,});

  Districts.fromJson(dynamic json) {
    id = json['id'];
    cityId = json['city_id'];
    district = json['district'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? cityId;
  String? district;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city_id'] = cityId;
    map['district'] = district;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}