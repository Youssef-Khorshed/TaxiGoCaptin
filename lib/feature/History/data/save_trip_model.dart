class AddToSaveToFavTripModel {
  bool? success;
  String? message;
  AddToSaveToFavTripData? data;

  AddToSaveToFavTripModel({this.success, this.message, this.data});

  AddToSaveToFavTripModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? AddToSaveToFavTripData.fromJson(json['data'])
        : null;
  }
}

class AddToSaveToFavTripData {
  int? userId;
  int? rideId;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddToSaveToFavTripData(
      {this.userId, this.rideId, this.updatedAt, this.createdAt, this.id});

  AddToSaveToFavTripData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    rideId = json['ride_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
