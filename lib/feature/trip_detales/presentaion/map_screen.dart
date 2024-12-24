// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
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
    Constants.subscription?.cancel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is UpdateOriginLocatoin) {
          context.read<MapsCubit>().updateCaptinLoaction(
              context: context,
              location: LatLng(
                  state.locationPosition.lat!, state.locationPosition.lng!));
        } else if (state is UpdateCaptinLocationSuccess) {
          final userlocation = context.read<MapsCubit>().userPosition;
          final captinlocation = LocationPosition(
              lat: state.updateCaptinLocation.data!.lat, //31.22136,29.93796
              lng: state.updateCaptinLocation.data!.lng);
          context.read<MapsCubit>().getdistanceLatLng(
              context: context,
              sessionToken: Uuid().v4(),
              destination: LatLng(userlocation!.lat!, userlocation.lng!),
              origin: LatLng(captinlocation.lat!, captinlocation.lng!));
        } else if (state is PickUpUserSuccess) {
          Fluttertoast.showToast(msg: state.pickupUser.message!);
          context.read<MapsCubit>().accept();
        } else if (state is CompleteRideSuccess) {
          Fluttertoast.showToast(msg: state.completeRide.message!);
        }
        if (state is GetDistanceLatLngSuccess) {
          if (state.leg.distance!.value! < 100) {
            context.read<MapsCubit>().pickCustomer(context: context);
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.kblue,
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

  double calculateDistance(LatLng point1, LatLng point2) {
    const double radius = 6371;

    double lat1 = point1.latitude * pi / 180;
    double lng1 = point1.longitude * pi / 180;
    double lat2 = point2.latitude * pi / 180;
    double lng2 = point2.longitude * pi / 180;

    double dlat = lat2 - lat1;
    double dlng = lng2 - lng1;

    double a = sin(dlat / 2) * sin(dlat / 2) +
        cos(lat1) * cos(lat2) * sin(dlng / 2) * sin(dlng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = radius * c;

    return distance;
  }
}
