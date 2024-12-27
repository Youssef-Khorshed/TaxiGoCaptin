class CalculateAverageData {
  double? distance;
  double? distancePrice;
  dynamic timePrice;
  int? startingPrice;
  double? finalPrice;

  CalculateAverageData({
    this.distance,
    this.distancePrice,
    this.timePrice,
    this.startingPrice,
    this.finalPrice,
  });

  factory CalculateAverageData.fromJson(Map<String, dynamic> json) =>
      CalculateAverageData(
        distance: (json['distance'] as num?)?.toDouble(),
        distancePrice: (json['distance_price'] as num?)?.toDouble(),
        timePrice: json['time_price'] as dynamic,
        startingPrice: json['starting_price'] as int?,
        finalPrice: (json['final_price'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'distance': distance,
        'distance_price': distancePrice,
        'time_price': timePrice,
        'starting_price': startingPrice,
        'final_price': finalPrice,
      };
}
