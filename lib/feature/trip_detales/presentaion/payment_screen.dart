import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/account_screen/presentaion/widgets/costume_bottun.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/tripe_complete_date.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
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
        final cubit = context.read<RideCompleteDetailsCubit>();
        if (state is RideCompleteDetailsInitial) {
          cubit.getRideCompleteDetails(context);
        }
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
                            child: Text(
                              AppLocalizations.of(context)!.payment,
                              style: AppStyles.text16Size500WightBlack,
                            ),
                          ),
                          verticalSpace(10),
                          Divider(color: AppColors.kGrey, height: .7.h),
                          TripeCompleteDate(
                            rideCompleteDetailsModel:
                                state.rideCompleteDetailsModel,
                          ),
                          verticalSpace(
                              MediaQuery.of(context).size.height * .15),
                          CostumeButton(
                            text: "AppLocalizations.of(context)!.confirm",
                            height: MediaQuery.of(context).size.height * 0.01,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.historyRoute);
                            },
                          ),
                        ],
                      )
                    : Container();
      },
    );
  }
}
