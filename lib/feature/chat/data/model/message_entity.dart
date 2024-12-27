class MessageEntity {
  final int id;
  final int rideId;
  final String senderType;
  final int senderId;
  final String messageType;
  final String? message;
  final String? lat;
  final String? lng;
  final String? voiceMessagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessageEntity({
    required this.id,
    required this.rideId,
    required this.senderType,
    required this.senderId,
    required this.messageType,
    this.message,
    this.lat,
    this.lng,
    this.voiceMessagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a Message instance from JSON
  factory MessageEntity.fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      id: json['id'],
      rideId: json['ride_id'],
      senderType: json['sender_type'],
      senderId: json['sender_id'],
      messageType: json['message_type'],
      message: json['message'],
      lat: json['lat'],
      lng: json['lng'],
      voiceMessagePath: json['voice_message_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert a Message instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ride_id': rideId,
      'sender_type': senderType,
      'sender_id': senderId,
      'message_type': messageType,
      'message': message,
      'lat': lat,
      'lng': lng,
      'voice_message_path': voiceMessagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
