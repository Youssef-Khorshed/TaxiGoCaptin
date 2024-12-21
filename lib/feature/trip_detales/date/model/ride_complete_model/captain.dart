class Captain {
  int? id;
  String? name;
  String? phone;
  String? status;

  Captain({
    this.id,
    this.name,
    this.phone,
    this.status,
  });

  Captain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}
