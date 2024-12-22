import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/controller/nearby_ride_requests_model_cubit/nearby_ride_requests_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/ride_request_widget.dart';
import 'user_earning_details.dart';

class EarningsDashboardBody extends StatelessWidget {
  const EarningsDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserEarningDeails(),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WalletData(
                        title: AppLocalizations.of(context)!.overall_earning,
                        data: "0.00 \$"),
                    WalletData(
                        title: AppLocalizations.of(context)!.today_booking,
                        data: "2"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25.h,
                  right: 20.w,
                  left: 20.w,
                ),
                child: Text(
                  AppLocalizations.of(context)!.new_requests,
                  style: AppStyles.text20Size500WightDarkGray,
                ),
              ),
            ],
          ),
          BlocBuilder<NearbyRideRequestsCubit, NearbyRideRequestsState>(
            builder: (context, state) {
              final cubit = context.read<NearbyRideRequestsCubit>();
              if (state is NearbyRideRequestsInitial) {
                cubit.getNearbyRideRequests(context);
              }
              return state is NearbyRideRequestsLoading
                  ? CustomLoading()
                  : state is NearbyRideRequestsFailure
                      ? CustomErroranimation(
                          errormessage: state.message,
                          lottie: AppLottie.errorFailure,
                        )
                      : state is NearbyRideRequestsSuccess
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return RideRequestWidget(
                                    nearbyRideRequestsData: state
                                        .nearbyRideRequestsModel.data![index]);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50.w),
                                      child: Divider(),
                                    ),
                                  ),
                              itemCount:
                                  state.nearbyRideRequestsModel.data!.length)
                          : Container();
            },
          )
        ],
      ),
    );
  }
}

class WalletData extends StatefulWidget {
  const WalletData({
    super.key,
    required this.title,
    required this.data,
  });
  final String title;
  final String data;
  @override
  State<WalletData> createState() => _WalletDataState();
}

class _WalletDataState extends State<WalletData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 100,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " ${widget.data}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
