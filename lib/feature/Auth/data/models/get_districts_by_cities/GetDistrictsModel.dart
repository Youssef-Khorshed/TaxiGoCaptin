import 'Data.dart';

class GetDistrictsModel {
  GetDistrictsModel({
      this.status, 
      this.message, 
      this.errors, 
      this.data, 
      this.notes,});

  GetDistrictsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
    data = json['data'] != null ? DistrictsData.fromJson(json['data']) : null;
    if (json['notes'] != null) {
      notes = [];
      json['notes'].forEach((v) {
        notes?.add(v);
      });
    }
  }
  bool? status;
  String? message;
  List<dynamic>? errors;
  DistrictsData? data;
  List<dynamic>? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (notes != null) {
      map['notes'] = notes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}