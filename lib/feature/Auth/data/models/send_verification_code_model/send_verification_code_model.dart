class SendVerificationCodeModel {
  SendVerificationCodeModel({
      this.status, 
      this.message, 
      this.errors, 
      this.data, 
      this.notes,});

  SendVerificationCodeModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(v);
      });
    }
    data = json['data'] != null ? json['data'].cast<int>() : [];
    notes = json['notes'] != null ? json['notes'].cast<String>() : [];
  }
  bool? status;
  String? message;
  List<dynamic>? errors;
  List<int>? data;
  List<String>? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['data'] = data;
    map['notes'] = notes;
    return map;
  }

}