class PaidAfterRideModel {
  final bool status;
  final String message;

  PaidAfterRideModel({required this.status, required this.message});

  factory PaidAfterRideModel.fromJson(Map<String, dynamic> json) {
    return PaidAfterRideModel(
      status: json["success"],
      message: json["message"],
    );
  }
}
