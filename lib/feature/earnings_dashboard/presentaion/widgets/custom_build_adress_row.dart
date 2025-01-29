import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/custom_parseAddress.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/trip_details_map.dart';

// ignore: must_be_immutable
class BuildAddressRow extends StatelessWidget {
  String fromAddress;
  String fromLoccation;
  String toAddress;
  String toLocation;
  String? distance;
  String? time;
  BuildAddressRow({
    super.key,
    required this.fromAddress,
    required this.fromLoccation,
    required this.toAddress,
    required this.toLocation,
    this.distance,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TripDetailsMap(
              address: fromAddress,
              location:
                  "${parseAddress(fromAddress)['street_number']} ${parseAddress(fromAddress)['street_name']} ${parseAddress(fromAddress)['state']}",
              icon: AppIcons.iconsMapRed),
          TripDetailsMap(
            address: toAddress,
            location:
                "${parseAddress(toAddress)['street_number']} ${parseAddress(fromAddress)['street_name']} ${parseAddress(fromAddress)['state']}",
            icon: AppIcons.iconsMapBlue,
          ),
          distance == null
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.timeImage,
                      width: 15,
                      height: 15,
                    ),
                    horizontalSpace(5.w),
                    distance == null
                        ? const SizedBox()
                        : Text(
                            distance!.split('km')[0],
                            style: AppStyles.style12BlackW700,
                          ),
                    horizontalSpace(5.w),
                    Text(
                      AppLocalizations.of(context)!.km,
                      style: AppStyles.style10DarkgrayW700,
                    ),
                    horizontalSpace(5.w),
                    time == null
                        ? const SizedBox()
                        : Text(
                            ' ${time!.split('mins')[0]}',
                            style: AppStyles.style12BlackW700,
                          ),
                    horizontalSpace(5.w),
                    Text(
                      AppLocalizations.of(context)!.min,
                      style: AppStyles.style10DarkgrayW700,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
