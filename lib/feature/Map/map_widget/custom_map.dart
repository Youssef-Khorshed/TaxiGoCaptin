// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class CustomMap extends StatefulWidget {
  NearbyRideRequestsData nearbyRideRequest;

  CustomMap({
    Key? key,
    required this.nearbyRideRequest,
  }) : super(key: key);

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  String? mapStyle;
  @override
  void initState() {
    // initalStyle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        return Stack(
          children: [
            buildMap(),
          ],
        );
      },
    );
  }

  GoogleMap buildMap() {
    return GoogleMap(
      padding: const EdgeInsets.only(bottom: 50, left: 100),
      markers: context.read<MapsCubit>().markers,
      polylines: context.read<MapsCubit>().polyLines,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) async {
        final cubit = await context.read<MapsCubit>();
        cubit.mapController = controller;

        // await cubit.getCaptinLocation(title: 'Captin');

        final destination = LatLng(
            double.parse(widget.nearbyRideRequest.latFrom!),
            double.parse(widget.nearbyRideRequest.lngFrom!));
        final source = LatLng(double.parse(widget.nearbyRideRequest.latTo!),
            double.parse(widget.nearbyRideRequest.lngTo!));

        await cubit.emitPlaceDirections(
            origin: source,
            destination: destination,
            sessionToken: Uuid().v4(),
            context: context);

        setState(() {});
      },

      initialCameraPosition: const CameraPosition(
          target: LatLng(33.40302561069593, 44.498105563683005), zoom: 8),
    );
  }

  void initalStyle() async {
    mapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/mapstyle/night.json");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
