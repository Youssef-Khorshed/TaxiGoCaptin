// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../widgets/costume_bottun.dart';

// ignore: must_be_immutable
class RequestButtons extends StatelessWidget {
  NearbyRideRequestsData nearbyRideRequest;

  RequestButtons({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnappingSheetCubit, SnappingSheetState>(
      builder: (context, state) {
        var cubit = context.read<SnappingSheetCubit>();
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: CostumeButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Cancel",
                color: Colors.white,
                textColor: Colors.red,
                borderColor: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: CostumeButton(
                onPressed: () async {
                  final mapcbuit = context.read<MapsCubit>();
                  final mapstate = mapcbuit.state;
                  await mapcbuit.accpetRideRequest(
                      context: context, rideID: nearbyRideRequest.id!);

                  mapcbuit.getUserUpdatedLocation(title: 'captin');
                  cubit.accept();
                  if (mapstate is AccpetRideRequestFail) {
                    Fluttertoast.showToast(
                        msg: mapstate.message,
                        backgroundColor: AppColors.redColor);
                  }
                },
                text: "Accept",
                color: AppColors.kblue,
                textColor: AppColors.kWhite,
              ),
            ),
          ],
        );
      },
    );
  }
}
