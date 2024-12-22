import 'package:flutter/material.dart';
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
      future: parseAddress(
        nearbyRideRequestsData.addressFrom!,
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

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripDetailsMap(
                address: nearbyRideRequestsData.addressFrom!,
                location: snapshot.data!['city'] ?? '',
                icon: AppIcons.mapRed,
              ),
              // TripDetailsMap(
              //   address: nearbyRideRequestsData.addressFrom!,
              //   location: toCity,
              //   icon: AppIcons.mapBlue,
              // ),
            ],
          ),
        );
      },
    );
  }

  Future<Map<String, String>> parseAddress(String address) {
    List<String> addressParts = address.split(' ');
    Map<String, String> parsedAddress = {};

    if (addressParts.isNotEmpty) {
      parsedAddress['street_number'] = addressParts[0];
      parsedAddress['street_name'] =
          addressParts.sublist(1, addressParts.length - 5).join(' ');
      parsedAddress['city'] = addressParts[addressParts.length - 5];
      parsedAddress['county'] = addressParts[addressParts.length - 4];
      parsedAddress['state'] = addressParts[addressParts.length - 3];
      parsedAddress['country'] = addressParts[addressParts.length - 2];
      parsedAddress['postal_code'] = addressParts[addressParts.length - 1];
    }

    return Future.value(parsedAddress);
  }
}
