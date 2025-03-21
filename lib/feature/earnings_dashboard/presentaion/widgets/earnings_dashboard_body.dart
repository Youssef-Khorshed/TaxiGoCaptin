import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Firebase/firebase_notification.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/controller/nearby_ride_requests_model_cubit/nearby_ride_requests_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/ride_request_widget.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/walletData.dart';
import 'package:taxi_go_driver/feature/profile/controller/profile_states.dart';
import 'package:taxi_go_driver/feature/profile/controller/profile_view_model.dart';
import 'user_earning_details.dart';

class EarningsDashboardBody extends StatefulWidget {
  final bool status;
  const EarningsDashboardBody({super.key, required this.status});

  @override
  State<EarningsDashboardBody> createState() => _EarningsDashboardBodyState();
}

class _EarningsDashboardBodyState extends State<EarningsDashboardBody> {
  NearbyRideRequestsModel? nearbyRideRequests;
  StreamSubscription<NearbyRideRequestsModel>? _subscription;

  @override
  void initState() {
    super.initState();

    FirebaseNotification.init(context);
    FirebaseNotification.initNotifications();
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
  }

  @override
  void deactivate() {
    _subscription?.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
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
              EarningDetails(),
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
          widget.status == false
              ? Column(
                  children: [
                    verticalSpace(MediaQuery.of(context).size.height / 8),
                    Text(
                      AppLocalizations.of(context)!.you_are_offline,
                      style: AppStyles.style16BlackW600,
                    ),
                  ],
                )
              : nearbyRideRequests == null
                  ? Column(
                      children: [
                        verticalSpace(MediaQuery.of(context).size.height / 8),
                        Text(
                          AppLocalizations.of(context)!
                              .looking_for_nearby_request,
                          style: AppStyles.style16BlackW600,
                        ),
                      ],
                    )
                  : !nearbyRideRequests!.success!
                      ? Column(
                          children: [
                            verticalSpace(
                                MediaQuery.of(context).size.height / 8),
                            Text(
                              AppLocalizations.of(context)!.not_autherized,
                              style: AppStyles.style16BlackW600,
                            ),
                          ],
                        )
                      : nearbyRideRequests!.data!.isEmpty
                          ? Column(
                              children: [
                                verticalSpace(
                                    MediaQuery.of(context).size.height / 8),
                                Text(
                                  AppLocalizations.of(context)!
                                      .no_nearby_ride_requests_found,
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 50.w),
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

class EarningDetails extends StatelessWidget {
  const EarningDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileStates>(
      builder: (context, state) {
        return state is ProfileSuccessStates
            ? Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WalletData(
                        title: AppLocalizations.of(context)!.overall_earning,
                        data: state.profielModel.data!.user!.daily_earnings
                            .toString()),
                    WalletData(
                        title: AppLocalizations.of(context)!.today_booking,
                        data: state.profielModel.data!.user!.daily_rides
                            .toString()),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
