import 'Cities.dart';

class DistrictsData {
  DistrictsData({
      this.cities,});

  DistrictsData.fromJson(dynamic json) {
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(DistricCities.fromJson(v));
      });
    }
  }
  List<DistricCities>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}