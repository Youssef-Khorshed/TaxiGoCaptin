import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/custom_parseAddress.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

class BuildAddressRow extends StatelessWidget {
  BuildAddressRow({
    super.key,
    required this.address,
    required this.iconmap,
  });
  final String address;
  final String iconmap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: parseAddress(
        address,
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

        return TripDetailsMap(
          address: address,
          location:
              "${snapshot.data!['street_number']} ${snapshot.data!['city']} ",
          icon: iconmap,
        );
      },
    );
  }
}
