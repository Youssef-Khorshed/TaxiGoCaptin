// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_snapping_sheet.dart';
import 'package:uuid/uuid.dart';

import '../../../core/Utils/colors/colors.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  AcceptRideRequest nearbyRideRequest;

  MapScreen({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        checkMapStates(state, context);
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
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

  void checkMapStates(MapsState state, BuildContext context) {
    /// Update the Captin Location continuously
    if (state is UpdateOriginLocatoin) {
      context.read<MapsCubit>().updateCaptinLoaction(
          context: context,
          location:
              LatLng(state.locationPosition.lat!, state.locationPosition.lng!));
    }

    /// After Updating Location in Captin Calculate Distance Between User and Catpin
    else if (state is UpdateCaptinLocationSuccess) {
      final userlocation = context.read<MapsCubit>().userPosition;
      final captinlocation = LocationPosition(
          lat: state.updateCaptinLocation.data!.lat, //31.22136,29.93796
          lng: state.updateCaptinLocation.data!.lng);
      context.read<MapsCubit>().getdistanceLatLng(
          context: context,
          sessionToken: Uuid().v4(),
          destination: LatLng(userlocation!.lat!, userlocation.lng!),
          origin: LatLng(captinlocation.lat!, captinlocation.lng!));
    }

    /// Check if I Rider Pick the user and start The trip
    else if (state is PickUpUserSuccess && !context.read<MapsCubit>().onTrip) {
      Fluttertoast.showToast(msg: state.pickupUser.message!);
      context.read<MapsCubit>().startTrip();

      /// Check if the trip completed
    } else if (state is CompleteRideSuccess) {
      Fluttertoast.showToast(msg: state.completeRide.message!);
      Navigator.of(context).pushReplacementNamed(Routes.paymentDetailsRoute);
    }

    // / check if arrived Nearby User
    if (state is PickUpUserSuccess) {
      context.read<MapsCubit>().accept();
      context.read<MapsCubit>().arrivedToCustomer();
    }
  }
}
