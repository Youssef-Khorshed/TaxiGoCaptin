class Message {
  final String senderType;
  final String messageType;
  final String message;
  final double? lat;
  final double? lng;
  final String createdAt;

  Message({
    required this.senderType,
    required this.messageType,
    required this.message,
    this.lat,
    this.lng,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderType:
          json['sender_type'] ?? "", // تعيين قيمة افتراضية إذا كانت null
      messageType:
          json['message_type'] ?? "", // تعيين قيمة افتراضية إذا كانت null
      message: json['message'] ?? "", // تعيين قيمة افتراضية إذا كانت null
      lat: json['lat'] != null
          ? (json['lat'] as num).toDouble()
          : null, // إذا كانت null، تترك null
      lng: json['lng'] != null
          ? (json['lng'] as num).toDouble()
          : null, // إذا كانت null، تترك null
      createdAt: json['created_at'] ?? "", // تعيين قيمة افتراضية إذا كانت null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_type': messageType,
      'message': message,
      'lat': lat,
      'lng': lng,
      'created_at': createdAt,
    };
  }
}
