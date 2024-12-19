import 'dart:convert';

class CaptainDocumentsResponseModel {
  bool success;
  String message;

  CaptainDocumentsResponseModel({
    required this.success,
    required this.message,
  });

  factory CaptainDocumentsResponseModel.fromRawJson(String str) =>
      CaptainDocumentsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CaptainDocumentsResponseModel.fromJson(Map<String, dynamic> json) =>
      CaptainDocumentsResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
