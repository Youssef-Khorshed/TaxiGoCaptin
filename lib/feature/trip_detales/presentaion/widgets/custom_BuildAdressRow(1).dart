import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/custom_parseAddress.dart';
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
    return FutureBuilder<RideRequest>(
      future: getRideRequest(ride: rideDetails),
      // _getFormattedAddresses(
      //   fromLatitude: double.parse(rideDetails.rideRequest.latFrom),
      //   fromLongitude: double.parse(rideDetails.rideRequest.lngFrom),
      //   toLatitude: double.parse(rideDetails.rideRequest.latTo),
      //   toLongitude: double.parse(rideDetails.rideRequest.lngTo),
      // )

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
                SizedBox(height: 10.h),
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

        final fromAddress = snapshot.data!.addressFrom;
        final fromCity =
            "${parseAddress(fromAddress)['street_number']} ${parseAddress(fromAddress)['street_name']} ${parseAddress(fromAddress)['state']}";
        final toAddress = snapshot.data!.addressTo;
        final toCity =
            "${parseAddress(toAddress)['street_number']} ${parseAddress(fromAddress)['street_name']} ${parseAddress(fromAddress)['state']}";
        ;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TripDetailsMap(
                address: fromAddress,
                location: fromCity,
                icon: AppIcons.iconsMapRed,
              ),
              Text(
                '${rideDetails.distance.toStringAsFixed(1)} ${AppLocalizations.of(context)!.km}',
                style: TextStyle(fontSize: 15.sp),
              ),
              TripDetailsMap(
                address: toAddress,
                location: toCity,
                icon: AppIcons.iconsMapBlue,
              ),
            ],
          ),
        );

        //  ListTile(
        //   title: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       TripDetailsMap(
        //         address: fromAddress,
        //         location: fromCity,
        //         icon: Assets.iconsMapRed,
        //       ),
        //       TripDetailsMap(
        //         address: toAddress,
        //         location: toCity,
        //         icon: Assets.iconsMapBlue,
        //       ),
        //     ],
        //   ),
        //   trailing: RichText(
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //           text: "${rideDetails.distance} ",
        //           style: TextStyle(
        //             fontSize: 15.sp,
        //             color: Colors.black, // اللون الأسود للمسافة
        //           ),
        //         ),
        //         TextSpan(
        //           text: AppLocalizations.of(context)!.km,
        //           style: TextStyle(
        //             fontSize: 15.sp,
        //             color: Colors.grey, // اللون الرمادي لـ "km"
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

  // Future<Map<String, String>> _getFormattedAddresses({
  //   required double fromLatitude,
  //   required double fromLongitude,
  //   required double toLatitude,
  //   required double toLongitude,
  // }) async {
  //   try {
  //     final fromAddress =
  //         await  rideDetails.rideRequest.addressFrom;
  //     final toAddress =
  //         await rideDetails.rideRequest.addressFrom;

  //     return {
  //       'fromAddress': fromAddress['address']!,
  //       'fromCity': fromAddress['city']!,
  //       'toAddress': toAddress['address']!,
  //       'toCity': toAddress['city']!,
  //     };

  //   } catch (e) {
  //     throw Exception("فشل في جلب العناوين: $e");
  //   }
  // }

  // Future<Map<String, String>> _getAddress(
  //     double latitude, double longitude) async {
  //   final address = await GeoCode()
  //       .reverseGeocoding(latitude: latitude, longitude: longitude);
  //   String _getCity(String city) {
  //     if (city.isEmpty) return '';

  //     List<String> parts = city.split(' ');
  //     if (parts.length > 2) {
  //       return '${parts[0]} ${parts[1]}';
  //     }

  //     return city;
  //   }

  //   return {
  //     'address': address.streetAddress ?? 'streetAddress',
  //     'city': _getCity(address.city ?? 'city'),
  //   };
  // }
}

Future<RideRequest> getRideRequest({required RideCompleteDetailsModel ride}) {
  return Future.value(ride.rideRequest);
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
      horizontalSpace(5.w),
    ],
  );
}
