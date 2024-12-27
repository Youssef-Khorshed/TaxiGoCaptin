import 'plus_code.dart';
import 'result.dart';

class GeocodeAdress {
  PlusCode? plusCode;
  List<GeocodeResult>? results;
  String? status;

  GeocodeAdress({this.plusCode, this.results, this.status});

  factory GeocodeAdress.fromJson(Map<String, dynamic> json) => GeocodeAdress(
        plusCode: json['plus_code'] == null
            ? null
            : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => GeocodeResult.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'plus_code': plusCode?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
