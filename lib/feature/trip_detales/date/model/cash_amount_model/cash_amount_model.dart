class CashAmountModel {
  final String cashAmount;
  final int rideId;
  final String customerName;
  final String customerPhone;
  final String paymentMethod;

  CashAmountModel({
    required this.cashAmount,
    required this.rideId,
    required this.customerName,
    required this.customerPhone,
    required this.paymentMethod,
  });

  factory CashAmountModel.fromJson(Map<String, dynamic> json) {
    return CashAmountModel(
      cashAmount: json['cash_amount'] ?? '0.0',
      rideId: json['ride_id'] ?? 0,
      customerName: json['customer_name'] ?? '',
      customerPhone: json['customer_phone'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cash_amount': cashAmount,
      'ride_id': rideId,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'payment_method': paymentMethod,
    };
  }

  bool isCashAmountPositive() {
    final amount = double.tryParse(cashAmount) ?? 0.0;
    return amount > 0;
  }
}
