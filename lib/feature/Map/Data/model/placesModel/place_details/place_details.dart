import 'result.dart';

class PlaceDetails {
  List<dynamic>? htmlAttributions;
  PlaceDetailsResult? result;
  String? status;

  PlaceDetails({this.htmlAttributions, this.result, this.status});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
        htmlAttributions: json['html_attributions'] as List<dynamic>?,
        result: json['result'] == null
            ? null
            : PlaceDetailsResult.fromJson(
                json['result'] as Map<String, dynamic>),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'html_attributions': htmlAttributions,
        'result': result?.toJson(),
        'status': status,
      };
}
