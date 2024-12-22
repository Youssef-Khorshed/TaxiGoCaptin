

class WalletModel {
  final bool success;
  final String message;
  final String data;
  final String notes;

  WalletModel({
    required this.success,
    required this.message,
    required this.data,
    required this.notes,
  });
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
      notes: json['notes'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'notes': notes,
    };
  }

}
