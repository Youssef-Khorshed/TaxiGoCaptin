class VerifyAccount {
  VerifyAccount({
      this.status, 
      this.message, 
      this.errors, 
      this.data, 
      this.notes,});

  VerifyAccount.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? json['errors'].cast<String>() : [];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(v);
      });
    }
    if (json['notes'] != null) {
      notes = [];
      json['notes'].forEach((v) {
        notes?.add(v);
      });
    }
  }
  bool? status;
  String? message;
  List<String>? errors;
  List<dynamic>? data;
  List<dynamic>? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['errors'] = errors;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (notes != null) {
      map['notes'] = notes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}