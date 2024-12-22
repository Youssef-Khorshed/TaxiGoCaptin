class GetAllNotificationModel {
  final bool success;
  final List<dynamic> data;

  GetAllNotificationModel({required this.success, required this.data});

  factory GetAllNotificationModel.fromJson(Map<String, dynamic> json) {
    return GetAllNotificationModel(
      success: json['success'] as bool,
      data: json['data'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
    };
  }
}
