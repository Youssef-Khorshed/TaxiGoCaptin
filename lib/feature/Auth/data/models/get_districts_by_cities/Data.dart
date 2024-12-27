import 'Districts.dart';

class DistrictsData {
  DistrictsData({
      this.districts,});

  DistrictsData.fromJson(dynamic json) {
    if (json['districts'] != null) {
      districts = [];
      json['districts'].forEach((v) {
        districts?.add(Districts.fromJson(v));
      });
    }
  }
  List<Districts>? districts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (districts != null) {
      map['districts'] = districts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}