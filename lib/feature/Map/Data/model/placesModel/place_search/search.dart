import 'prediction.dart';

class SearchPlace {
  List<Prediction>? predictions;
  String? status;

  SearchPlace({this.predictions, this.status});

  factory SearchPlace.fromJson(Map<String, dynamic> json) => SearchPlace(
        predictions: (json['predictions'] as List<dynamic>?)
            ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'predictions': predictions?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
