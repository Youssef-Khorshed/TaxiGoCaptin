// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_snapping_sheet.dart';

import '../../../core/Utils/colors/colors.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  NearbyRideRequestsData nearbyRideRequest;

  MapScreen({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kblue,
      body: BlocProvider(
        create: (context) => SnappingSheetCubit(),
        child: Stack(
          children: [
            CustomSnappingSheet(
              nearbyRideRequest: widget.nearbyRideRequest,
              isAccepted: true,
            ),
          ],
        ),
      ),
    );
  }
}
