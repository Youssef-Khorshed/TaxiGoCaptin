import 'address_component.dart';
import 'geometry.dart';
import 'navigation_point.dart';
import 'plus_code.dart';

class GeocodeResult {
  List<AddressComponent>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? placeId;
  PlusCode? plusCode;
  List<String>? types;
  List<NavigationPoint>? navigationPoints;

  GeocodeResult({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.placeId,
    this.plusCode,
    this.types,
    this.navigationPoints,
  });

  factory GeocodeResult.fromJson(Map<String, dynamic> json) => GeocodeResult(
        addressComponents: (json['address_components'] as List<dynamic>?)
            ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
        formattedAddress: json['formatted_address'] as String?,
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
        placeId: json['place_id'] as String?,
        plusCode: json['plus_code'] == null
            ? null
            : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
        types:
            (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
        navigationPoints: (json['navigation_points'] as List<dynamic>?)
            ?.map((e) => NavigationPoint.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'address_components':
            addressComponents?.map((e) => e.toJson()).toList(),
        'formatted_address': formattedAddress,
        'geometry': geometry?.toJson(),
        'place_id': placeId,
        'plus_code': plusCode?.toJson(),
        'types': types,
        'navigation_points': navigationPoints?.map((e) => e.toJson()).toList(),
      };
}
