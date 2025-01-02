class HistoryDataModel {
  bool? success;
  String? message;
  List<HistoryData>? data;

  HistoryDataModel({this.success, this.message, this.data});

  HistoryDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(HistoryData.fromJson(v));
      });
    }
  }
}

class HistoryData {
  int? id;
  String? latFrom;
  String? lngFrom;
  String? latTo;
  String? lngTo;
  bool? isSaved;
  bool? isFavorite;
  List<HistoryRide>? ride;

  HistoryData(
      {this.id,
      this.latFrom,
      this.lngFrom,
      this.latTo,
      this.lngTo,
      this.ride,
      this.isFavorite,
      this.isSaved});

  HistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latFrom = json['lat_from'];
    lngFrom = json['lng_from'];
    latTo = json['lat_to'];
    lngTo = json['lng_to'];
    isSaved = json['is_saved'];
    isFavorite = json['is_favorite'];
    if (json['ride'] != null) {
      ride = <HistoryRide>[];
      json['ride'].forEach((v) {
        ride!.add(HistoryRide.fromJson(v));
      });
    }
  }
}

class HistoryRide {
  int? id;
  dynamic distance;
  String? distancePrice;
  String? total;
  String? rate;
  CaptainData? captainData;

  HistoryRide({
    this.id,
    this.distance,
    this.distancePrice,
    this.total,
    this.rate,
  });

  HistoryRide.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    distance = json['distance'];
    distancePrice = json['distance_price'];

    total = json['total'];
    rate = json['rate'];
    captainData =
        json['captain'] != null ? CaptainData.formJson(json['captain']) : null;
  }
}

class CaptainData {
  String? name;
  String? rate;
  String? picture;
  CaptainData({this.name, this.picture, this.rate});
  CaptainData.formJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = json['rate'];
    picture = json['picture'];
  }
}
