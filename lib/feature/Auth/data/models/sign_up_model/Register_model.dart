import 'Data.dart';

class RegisterModel {
  RegisterModel({
      this.message, 
      this.data,});

  RegisterModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? RegisterDataModel.fromJson(json['data']) : null;
  }
  String? message;
  RegisterDataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}