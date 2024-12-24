import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/controller/nearby_ride_requests_model_cubit/nearby_ride_requests_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/ride_request_widget.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/walletData.dart';
import 'user_earning_details.dart';

class EarningsDashboardBody extends StatefulWidget {
  const EarningsDashboardBody({super.key});

  @override
  State<EarningsDashboardBody> createState() => _EarningsDashboardBodyState();
}

class _EarningsDashboardBodyState extends State<EarningsDashboardBody> {
  NearbyRideRequestsModel? nearbyRideRequests;
  StreamSubscription<NearbyRideRequestsModel>? _subscription;

  @override
  void initState() {
    debugPrint(
        "---------------------------init---------------------------------------");

    super.initState();
    _startStream();
  }

  void _startStream() {
    _subscription = Stream.periodic(Duration(seconds: 10), (_) {
      return context
          .read<NearbyRideRequestsCubit>()
          .getNearbyRideRequests(context);
    }).asyncExpand((stream) => stream).listen((data) {
      setState(() {
        nearbyRideRequests = data;
      });
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget called");
  }

  @override
  void deactivate() {
    debugPrint(
        "----------------------------Deactivate--------------------------------------");

    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    debugPrint(
        "------------------------------------------------------------------");

    debugPrint("Closed");
  }

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
          nearbyRideRequests == null
              ? Column(
                  children: [
                    verticalSpace(MediaQuery.of(context).size.height / 8),
                    Text(
                      "Looking for nearby request",
                      style: AppStyles.style16BlackW600,
                    ),
                  ],
                )
              : nearbyRideRequests!.data!.isEmpty
                  ? Column(
                      children: [
                        verticalSpace(MediaQuery.of(context).size.height / 8),
                        Text(
                          "No nearby ride requests found",
                          style: AppStyles.style16BlackW600,
                        ),
                      ],
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return RideRequestWidget(
                          nearbyRideRequestsData:
                              nearbyRideRequests!.data![index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Divider(),
                        ),
                      ),
                      itemCount: nearbyRideRequests!.data!.length,
                    ),
        ],
      ),
    );
  }
}
