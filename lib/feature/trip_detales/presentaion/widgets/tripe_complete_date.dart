import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/cash_amount_cubit/cash_amount_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/pay_after_ride_controller/pay_after_ride_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_BuildAdressRow(1).dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/fare_input_dialog.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/location_details.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/payments_details.dart';

import '../../../account_screen/presentaion/widgets/costume_bottun.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripeCompleteDate extends StatefulWidget {
  const TripeCompleteDate({
    super.key,
    required this.rideCompleteDetailsModel,
  });
  final RideCompleteDetailsModel rideCompleteDetailsModel;

  @override
  State<TripeCompleteDate> createState() => _TripeCompleteDateState();
}

class _TripeCompleteDateState extends State<TripeCompleteDate> {
  final TextEditingController fareController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<PayAfterRideCubit, PayAfterRideState>(
        listener: (context, state) {
          if (state is PayAfterRideSuccess) {
            Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!
                    .the_trip_was_completed_successfully);
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamed(context, Routes.accountScreen);
            });
          }
        },
        child: Column(
          children: [
            BuildAddressRow(
              rideDetails: widget.rideCompleteDetailsModel,
            ),
            verticalSpace(30.h),
            PaymentsDetails(
                rideDetails: widget.rideCompleteDetailsModel,
                size: MediaQuery.of(context).size),
            verticalSpace(MediaQuery.of(context).size.height * 0.2),
            BlocBuilder<PayAfterRideCubit, PayAfterRideState>(
              builder: (context, state) {
                var cubit = context.read<CashAmountCubit>();
                var cubit2 = context.read<PayAfterRideCubit>();
                return state is PayAfterRideLoading
                    ? SizedBox(height: 40.h, child: CustomLoading())
                    : CostumeButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final enteredAmount = cubit.fareController.text;
                            final parsedAmount = double.tryParse(enteredAmount);

                            if (parsedAmount == null) {
                              Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)!
                                      .please_enter_the_fare_value);
                              return;
                            }

                            await cubit2.pay(context, parsedAmount);
                          }
                        },
                        color: AppColors.kblue,
                        textColor: AppColors.kWhite,
                        text: AppLocalizations.of(context)!.submit,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
