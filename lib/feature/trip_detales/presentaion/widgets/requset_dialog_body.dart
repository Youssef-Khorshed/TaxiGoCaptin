// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/custom_build_adress_row.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_bottuns.dart';

import 'booking_details_accepted.dart';
import 'cancel_button_accepted.dart';

// ignore: must_be_immutable
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
              BuildAddressRow(
                  address: widget.nearbyRideRequest.addressFrom!,
                  iconmap: AppIcons.mapRed),
              BuildAddressRow(
                  address: widget.nearbyRideRequest.addressTo!,
                  iconmap: AppIcons.mapBlue),
              Visibility(
                visible: cubit.isAccepted,
                child: BookingDetailsAccepted(
                  nearbyRideRequest: widget.nearbyRideRequest,
                ),
              ),
              Visibility(
                visible: cubit.isAccepted,
                replacement: RequestButtons(
                  nearbyRideRequest: widget.nearbyRideRequest,
                ),
                child: CancelButtonAccepted(
                  onCancel: () async {
                    Navigator.pop(context);
                    context
                        .read<MapsCubit>()
                        .canelRideRequest(context: context);
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
