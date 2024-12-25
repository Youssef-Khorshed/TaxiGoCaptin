import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/cash_amount_cubit/cash_amount_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
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
          "${AppLocalizations.of(context)!.payment_details} :",
          style: AppStyles.style16BlackW600,
        ),
        verticalSpace(size.height * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${AppLocalizations.of(context)!.payment_method} :",
                  style: AppStyles.style14DarkgrayW500,
                ),
                Spacer(),
                Row(children: [
                  Text(
                    rideDetails.rideRequest.paymentMethod ?? "",
                    style: AppStyles.style14DarkgrayW500,
                  ),
                  horizontalSpace(5.w),
                  Image.asset(Assets.cash, height: size.height * 0.02),
                ]),
              ],
            ),
            Buildrowdetail(
                label: "${AppLocalizations.of(context)!.distance} :",
                value:
                    '${rideDetails.distance} ${AppLocalizations.of(context)!.km} '),
            Buildrowdetail(
                label: "${AppLocalizations.of(context)!.time} :",
                value:
                    '${rideDetails.time.round()} ${AppLocalizations.of(context)!.min} '),
            Buildrowdetail(
                label: "${AppLocalizations.of(context)!.promo_code} :",
                value:
                    '${rideDetails.rideRequest.promocode ?? AppLocalizations.of(context)!.noPromoCode}  '),
            Buildrowdetail(
              label: "${AppLocalizations.of(context)!.total} :",
              value:
                  '${rideDetails.total} ${AppLocalizations.of(context)!.currency_iqd} ',
              isBold: true,
            ),
            verticalSpace(10.h),
            BlocBuilder<CashAmountCubit, CashAmountState>(
              builder: (context, state) {
                var cubit = context.read<CashAmountCubit>();
                print(cubit.cashAmount);
                return FeeInput(
                    fareController: cubit.fareController,
                    amount: double.parse(cubit.cashAmount));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class FeeInput extends StatelessWidget {
  final double amount;
  final TextEditingController fareController; // تمرير قيمة `amount`

  const FeeInput({
    super.key,
    required this.amount,
    required this.fareController,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: amount > 0, // عرض الويدجيت إذا كانت `amount` أكبر من 0
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FareInputField(controller: fareController, amount: amount),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class FareInputField extends StatelessWidget {
  final TextEditingController controller;
  final double amount;

  const FareInputField({
    super.key,
    required this.controller,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffix: Text(
          "${amount} ${AppLocalizations.of(context)!.currency_iqd}",
          style: AppStyles.style14DarkgrayW500,
        ),
        labelText: AppLocalizations.of(context)!.enter_the_fare_value,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.please_enter_the_fare_value;
        }
        final enteredValue = double.tryParse(value);
        if (enteredValue == null) {
          return AppLocalizations.of(context)!.please_enter_a_valid_number;
        }
        if (enteredValue < amount) {
          return "${AppLocalizations.of(context)!.please_enter_the_fare_value}${amount.toStringAsFixed(2)}.";
        }
        return null;
      },
    );
  }
}
