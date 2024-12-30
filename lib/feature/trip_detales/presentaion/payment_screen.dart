import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/tripe_complete_date.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: PaymentsDetailsBlockBuilder(),
    );
  }
}

class PaymentsDetailsBlockBuilder extends StatelessWidget {
  const PaymentsDetailsBlockBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideCompleteDetailsCubit, RideCompleteDetailsState>(
      builder: (context, state) {
        if (state is RideCompleteDetailsInitial) {}
        print("Current state: $state");
        return state is RideCompleteDetailsLoading
            ? CustomLoading()
            : state is RideCompleteDetailsFailure
                ? CustomErroranimation(
                    errormessage: state.message,
                    lottie: AppLottie.errorFailure,
                  )
                : state is RideCompleteDetailsSuccess
                    ? ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        children: [
                          verticalSpace(50),
                          Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.payment,
                              style: AppStyles.style18BlackW500,
                            ),
                          ),
                          verticalSpace(10),
                          TripeCompleteDate(
                            rideCompleteDetailsModel:
                                state.rideCompleteDetailsModel,
                          ),
                          verticalSpace(25.h)
                        ],
                      )
                    : Container();
      },
    );
  }
}
