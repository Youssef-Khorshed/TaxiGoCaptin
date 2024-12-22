// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_bottuns.dart';

import 'booking_details_accepted.dart';
import 'cancel_button_accepted.dart';
import 'location_details.dart';

class RequestDialogBody extends StatefulWidget {
  NearbyRideRequestsData nearbyRideRequest;

  RequestDialogBody({
    Key? key,
    required this.nearbyRideRequest,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<RequestDialogBody> createState() => _RequestDialogBodyState();
}

class _RequestDialogBodyState extends State<RequestDialogBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnappingSheetCubit, SnappingSheetState>(
      builder: (context, state) {
        var cubit = context.read<SnappingSheetCubit>();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const LocationDetails(),
              Visibility(
                visible: cubit.isAccepted,
                child: BookingDetailsAccepted(
                  nearbyRideRequest: widget.nearbyRideRequest,
                ),
              ),
              Visibility(
                visible: cubit.isAccepted,
                replacement: const RequestButtons(),
                child: CancelButtonAccepted(
                  onCancel: () {
                    cubit.accept();
                  },
                  width: widget.width,
                  isAccepted: cubit.isAccepted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
