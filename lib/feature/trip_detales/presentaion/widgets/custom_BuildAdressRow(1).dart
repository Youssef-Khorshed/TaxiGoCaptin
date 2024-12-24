import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocode/geocode.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

class BuildAddressRow extends StatelessWidget {
  BuildAddressRow({
    super.key,
    required this.rideDetails,
  });
  final RideCompleteDetailsModel rideDetails;

  @override
  Widget build(BuildContext context) {
    if (rideDetails.rideRequest.latFrom == null ||
        rideDetails.rideRequest.lngFrom == null ||
        rideDetails.rideRequest.latTo == null ||
        rideDetails.rideRequest.lngTo == null) {
      return Center(child: Text("Invalid location data"));
    }

    return FutureBuilder<Map<String, String>>(
      future: _getFormattedAddresses(
        // fromLatitude: double.parse(rideDetails.rideRequest.latFrom),
        // fromLongitude: double.parse(rideDetails.rideRequest.lngFrom),
        // toLatitude: double.parse(rideDetails.rideRequest.latTo),
        // toLongitude: double.parse(rideDetails.rideRequest.lngTo),
        fromLatitude: double.parse("31513360473233"),
        fromLongitude: double.parse("730129688187574"),
        toLatitude: double.parse("347690885526916"),
        toLongitude: double.parse("43.708672016474615"),
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
                  child: simmerWidget(context),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: simmerWidget(context),
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
                icon: Assets.iconsMapRed,
              ),
              TripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: Assets.iconsMapBlue,
              ),
            ],
          ),
          trailing: Text(
            "${rideDetails.distance} ${AppLocalizations.of(context)!.km}",
            style: TextStyle(fontSize: 15.sp),
          ),
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
      final fromAddress =
          await _getAddress(33.347690885526916, 43.708672016474615);
      final toAddress =
          await _getAddress(33.31513360473233, 43.730129688187574);

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

    if (address == null) {
      throw Exception("عنوان غير موجود");
    }
    String _getCity(String city) {
      if (city.isEmpty) return '';

      List<String> parts = city.split(' ');
      if (parts.length > 2) {
        return '${parts[0]} ${parts[1]}';
      }

      return city;
    }

    return {
      'address': address.streetAddress ?? 'streetAddress',
      'city': _getCity(address.city ?? 'city'),
    };
  }
}

Widget simmerWidget(context) {
  return Column(
    children: [
      ListTile(
        title: Container(
          height: 15.h,
          width: 20.w,
          decoration: BoxDecoration(
              color: AppColors.kgrey,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        subtitle: Container(
          height: 15.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: AppColors.kgrey,
              borderRadius: BorderRadius.circular(12.r)),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
              width: MediaQuery.of(context).size.width * .05,
              child: SvgPicture.asset(
                Assets.iconsMapBlue,
              ),
            ),
          ],
        ),
      ),
      horizontalSpace(5),
    ],
  );
}
