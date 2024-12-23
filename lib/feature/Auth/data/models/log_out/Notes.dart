class Notes {
  Notes({
      this.onlogout,});

  Notes.fromJson(dynamic json) {
    onlogout = json['On logout'];
  }
  String? onlogout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['On logout'] = onlogout;
    return map;
  }

}