// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/Map/map_widget/custom_map.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/requset_dialog_body.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/snappingSheet_title_request.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/snappinhSheet_title_accsebted.dart';
import '../../../../core/Utils/colors/colors.dart';

// ignore: must_be_immutable
class CustomSnappingSheet extends StatefulWidget {
  AcceptRideRequest nearbyRideRequest;

  CustomSnappingSheet({
    Key? key,
    required this.nearbyRideRequest,
    required this.isAccepted,
  }) : super(key: key);
  final bool isAccepted;
  @override
  _CustomSnappingSheetState createState() => _CustomSnappingSheetState();
}

class _CustomSnappingSheetState extends State<CustomSnappingSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        var cubit = context.read<MapsCubit>();
        return SnappingSheet(
          lockOverflowDrag: false,
          snappingPositions: const [
            SnappingPosition.pixels(
              positionPixels: 400,
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
            ),
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.factor(
              positionFactor: 0.65,
              snappingCurve: Curves.bounceOut,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.bottom,
            ),
          ], // Your main screen content goes here
          grabbingHeight: cubit.isAccepted ? 120 : 90,
          // Start fully closed
          grabbing: Container(
            color: AppColors.kBackgroundColor,
            child: Visibility(
              child: SnappingSheetTitleRequest(width: width),
              visible: cubit.isAccepted,
              replacement: SnappingSheetTitleAccepted(
                customerPhoneNumber:
                    widget.nearbyRideRequest.data!.request!.customer!.phone!,
                cutomerName:
                    widget.nearbyRideRequest.data!.request!.customer!.name!,
                width: width,
              ),
            ),
          ),
          sheetBelow: SnappingSheetContent(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.kBackgroundColor,
              child: RequestDialogBody(
                nearbyRideRequest: widget.nearbyRideRequest,
                width: width,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width,
                  child: CustomMap(
                    nearbyRideRequest: widget.nearbyRideRequest,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
