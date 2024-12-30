class GetAllTransactionsModel {
  bool? success;
  List<TransactionData>? data;

  GetAllTransactionsModel({this.success, this.data});

  factory GetAllTransactionsModel.fromJson(Map<String, dynamic> json) {
    return GetAllTransactionsModel(
      success: json["success"],
      data: json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => TransactionData.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "data": data?.map((e) => e.toJson()).toList(),
    };
  }
}

class TransactionData {
  int? id;
  int? userId;
  int? rideId;
  String? transactionType;
  String? status;
  String? amount;
  String? paymentMethod;
  dynamic description;
  String? createdAt;
  String? updatedAt;

  TransactionData({
    this.id,
    this.userId,
    this.rideId,
    this.transactionType,
    this.status,
    this.amount,
    this.paymentMethod,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json["id"],
      userId: json["user_id"],
      rideId: json["ride_id"],
      transactionType: json["transaction_type"],
      status: json["status"],
      amount: json["amount"],
      paymentMethod: json["payment_method"],
      description: json["description"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "ride_id": rideId,
      "transaction_type": transactionType,
      "status": status,
      "amount": amount,
      "payment_method": paymentMethod,
      "description": description,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
