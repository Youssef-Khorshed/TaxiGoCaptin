// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/custom_build_adress_row.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_bottuns.dart';

import 'booking_details_accepted.dart';
import 'cancel_button_accepted.dart';

// ignore: must_be_immutable
class RequestDialogBody extends StatefulWidget {
  AcceptRideRequest nearbyRideRequest;

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
    final cubit = context.read<MapsCubit>();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          // BuildAddressRow(
          //     address: widget.nearbyRideRequest.data!.request!.addressFrom!,
          //     iconmap: AppIcons.mapRed),
          // BuildAddressRow(
          //     address: widget.nearbyRideRequest.data!.request!.addressTo!,
          //     iconmap: AppIcons.mapBlue),

          BuildAddressRow(
            fromAddress: widget.nearbyRideRequest.data!.request!.addressFrom!,
            fromLoccation: '',
            toAddress: widget.nearbyRideRequest.data!.request!.addressTo!,
            toLocation: '',
          ),

          Visibility(
            visible: cubit.isAccepted,
            child: BookingDetailsAccepted(),
            replacement: SizedBox(),
          ),
          Visibility(
            visible: cubit.isAccepted,
            replacement: RequestButtons(),
            child: CancelButtonAccepted(
              onCancel: () async {
                Navigator.pop(context);
                context.read<MapsCubit>().canelRideRequest(context: context);
              },
              width: widget.width,
              isAccepted: cubit.isAccepted,
            ),
          ),
        ],
      ),
    );
  }
}
