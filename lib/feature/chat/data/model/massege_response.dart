import 'message_data.dart';

class MessagesResponse {
  final bool success;
  final String message;
  final List<Message> data;

  MessagesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MessagesResponse.fromJson(Map<String, dynamic> json) {
    return MessagesResponse(
      success: json['success'],
      message: json['message'],
      data: List<Message>.from(
          json['data'].map((x) => MessagesResponse.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}
