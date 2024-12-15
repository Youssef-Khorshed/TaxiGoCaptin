class DataUserModel {
  DataUserModel({
      this.token,});

  DataUserModel.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}