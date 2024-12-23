class ForgetPasswordModel {
  ForgetPasswordModel({
      this.status, 
      this.message, 
      this.errors, 
      this.data, 
      this.notes,});

  ForgetPasswordModel.fromJson(dynamic json) {
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
    notes = json['notes'] != null ? json['notes'].cast<String>() : [];
  }
  bool? status;
  String? message;
  List<dynamic>? errors;
  List<dynamic>? data;
  List<String>? notes;

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
    map['notes'] = notes;
    return map;
  }

}