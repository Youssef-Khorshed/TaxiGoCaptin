import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocode/geocode.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

class BuildAddressRow extends StatelessWidget {
  BuildAddressRow({
    super.key,
    required this.nearbyRideRequestsData,
  });
  final NearbyRideRequestsData nearbyRideRequestsData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _getFormattedAddresses(
        fromLatitude: double.parse(nearbyRideRequestsData.latFrom!),
        fromLongitude: double.parse(nearbyRideRequestsData.lngFrom!),
        toLatitude: double.parse(nearbyRideRequestsData.latTo!),
        toLongitude: double.parse(nearbyRideRequestsData.lngTo!),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: TripDetailsMap(
                    address: " ",
                    location: " ",
                    icon: AppIcons.mapRed,
                  ),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: TripDetailsMap(
                    address: " ",
                    location: " ",
                    icon: AppIcons.mapBlue,
                  ),
                ),
              ],
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return ListTile(
            title: Text("حدث خطأ أثناء جلب البيانات"),
          );
        }

        final fromAddress = snapshot.data!['fromAddress']!;
        final fromCity = snapshot.data!['fromCity']!;
        final toAddress = snapshot.data!['toAddress']!;
        final toCity = snapshot.data!['toCity']!;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripDetailsMap(
                address: fromAddress,
                location: fromCity,
                icon: AppIcons.mapRed,
              ),
              TripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: AppIcons.mapBlue,
              ),
            ],
          ),
          // trailing: Text(
          //   "${nearbyRideRequestsModel.ride!.distance} ${AppLocalizations.of(context)!.km}",
          //   style: TextStyle(fontSize: 15.sp),
          // ),
        );
      },
    );
  }

  Future<Map<String, String>> _getFormattedAddresses({
    required double fromLatitude,
    required double fromLongitude,
    required double toLatitude,
    required double toLongitude,
  }) async {
    try {
      final fromAddress = await _getAddress(fromLatitude, fromLongitude);
      final toAddress = await _getAddress(toLatitude, toLongitude);

      return {
        'fromAddress': fromAddress['address']!,
        'fromCity': fromAddress['city']!,
        'toAddress': toAddress['address']!,
        'toCity': toAddress['city']!,
      };
    } catch (e) {
      throw Exception("فشل في جلب العناوين: $e");
    }
  }

  Future<Map<String, String>> _getAddress(
      double latitude, double longitude) async {
    final address = await GeoCode()
        .reverseGeocoding(latitude: latitude, longitude: longitude);
    String _getCity(String city) {
      if (city.isEmpty) return '';

      List<String> parts = city.split(' ');
      if (parts.length > 2) {
        return '${parts[0]} ${parts[1]}';
      }

      return city;
    }

    return {
      'address': address.streetAddress ?? '',
      'city': _getCity(address.city ?? ''),
    };
  }
}
