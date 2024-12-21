import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_buildrowdetail_hiring.dart';

class PaymentsDetails extends StatelessWidget {
  const PaymentsDetails({
    super.key,
    required this.size,
    required this.rideDetails,
  });
  final RideCompleteDetailsModel rideDetails;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.payment_details,
          style: AppStyles.text14Size500WightW,
        ),
        verticalSpace(size.height * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.payment_method,
                  style: AppStyles.text14Size500WightW,
                ),
                Spacer(),
                Row(children: [
                  Text(
                    rideDetails.paymentMethod ?? "",
                    style: AppStyles.text14Size500WightW,
                  ),
                  horizontalSpace(5.w),
                  Image.asset(Assets.iconsBankIcon, height: size.height * 0.02),
                ]),
              ],
            ),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.distance,
                value:
                    '${rideDetails.ride!.distance} ${AppLocalizations.of(context)!.km} '),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.time,
                value:
                    '${rideDetails.ride!.time?.round()} ${AppLocalizations.of(context)!.min} '),
            Buildrowdetail(
                label: AppLocalizations.of(context)!.promo_code,
                value:
                    '${rideDetails.promocode ?? AppLocalizations.of(context)!.noPromoCode}  '),
            Buildrowdetail(
              label: AppLocalizations.of(context)!.total,
              value:
                  '${rideDetails.ride!.paid} ${AppLocalizations.of(context)!.currency} ',
              isBold: true,
            ),
          ],
        ),
      ],
    );
  }
}
