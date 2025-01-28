// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/map_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

// ignore: must_be_immutable
class DriverAction extends StatefulWidget {
  NearbyRideRequestsData nearbyRideRequest;
  DriverAction({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  State<DriverAction> createState() => _DriverActionState();
}

class _DriverActionState extends State<DriverAction> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is AccpetRideRequestSuccess) {
          Navigator.pop(context);
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (_) => MapScreen(
                    nearbyRideRequest: state.rideRequest,
                  )));
        }

        if (state is AccpetRideRequestFail) {
          Fluttertoast.showToast(
              msg: state.message, backgroundColor: AppColors.redColor);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            // Expanded(
            //   child: CostumeButton(
            //     onPressed: () {
            //       context.read<MapsCubit>().canelRideRequest(context: context);
            //     },
            //     height: 50.h,
            //     text: "Decline",
            //     color: Colors.red.withOpacity(.05),
            //     textColor: Colors.red,
            //     borderColor: Colors.red,
            //   ),
            // ),
            // const SizedBox(width: 12),

            Expanded(
              child: CostumeButton(
                height: 50.h,
                text: AppLocalizations.of(context)!.to_accept,
                textColor: AppColors.kWhite,
                color: AppColors.kblue,
                onPressed: () async {
                  final mapcbuit = context.read<MapsCubit>();
                  await mapcbuit.accpetRideRequest(
                      context: context, rideID: widget.nearbyRideRequest.id!);
                  await mapcbuit.getActiveRideRequest(context: context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
