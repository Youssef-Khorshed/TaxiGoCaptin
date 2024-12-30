import 'Notes.dart';

class LogOutModel {
  LogOutModel({
      this.status, 
      this.message, 
      this.errors, 
      this.data, 
      this.notes,});

  LogOutModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v);
      });
    }
    notes = json['notes'] != null ? Notes.fromJson(json['notes']) : null;
  }
  bool? status;
  String? message;
  List<dynamic>? errors;
  List<dynamic>? data;
  Notes? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (notes != null) {
      map['notes'] = notes?.toJson();
    }
    return map;
  }

}