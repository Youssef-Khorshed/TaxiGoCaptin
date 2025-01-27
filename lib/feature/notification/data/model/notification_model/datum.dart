class Datum {
  num? id;
  num? userId;
  String? title;
  String? body;
  num? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: num.tryParse(json['id'].toString()),
        userId: num.tryParse(json['user_id'].toString()),
        title: json['title']?.toString(),
        body: json['body']?.toString(),
        isRead: num.tryParse(json['is_read'].toString()),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (userId != null) 'user_id': userId,
        if (title != null) 'title': title,
        if (body != null) 'body': body,
        if (isRead != null) 'is_read': isRead,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      };
}
