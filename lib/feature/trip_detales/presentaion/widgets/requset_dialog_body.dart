import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_bottuns.dart';

import 'booking_details_accepted.dart';
import 'cancel_button_accepted.dart';
import 'location_details.dart';

class RequestDialogBody extends StatefulWidget {
  const RequestDialogBody({
    super.key,
    required this.width,
  });

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
                child: const BookingDetailsAccepted(),
              ),
              Visibility(
                visible: cubit.isAccepted,
                child: CancelButtonAccepted(
                  onCancel: () {
                    cubit.accept();
                  },
                  width: widget.width,
                  isAccepted: cubit.isAccepted,
                ),
                replacement: const RequestButtons(),
              ),
            ],
          ),
        );
      },
    );
  }
}
