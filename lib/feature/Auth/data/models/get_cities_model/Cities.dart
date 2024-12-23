import 'Districts.dart';

class Cities {
  Cities({
      this.id, 
      this.city, 
      this.createdAt, 
      this.updatedAt, 
      this.districts,});

  Cities.fromJson(dynamic json) {
    id = json['id'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['districts'] != null) {
      districts = [];
      json['districts'].forEach((v) {
        districts?.add(Districts.fromJson(v));
      });
    }
  }
  int? id;
  String? city;
  String? createdAt;
  String? updatedAt;
  List<Districts>? districts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['city'] = city;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (districts != null) {
      map['districts'] = districts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}