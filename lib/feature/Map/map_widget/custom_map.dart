// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapState.dart';
import 'package:taxi_go_driver/feature/Map/Data/model/accept_ride_request/accept_ride_request.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class CustomMap extends StatefulWidget {
  AcceptRideRequest nearbyRideRequest;

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
    build(context);
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
      markers: context.watch<MapsCubit>().markers,
      polylines: context.watch<MapsCubit>().polyLines,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      //style: mapStyle, // to control theme (Dark/Light)
      onMapCreated: (controller) {
        adterMapCreated(controller);
      },

      initialCameraPosition: const CameraPosition(
          target: LatLng(33.40302561069593, 44.498105563683005), zoom: 8),
    );
  }

  void adterMapCreated(GoogleMapController controller) {
    context.read<MapsCubit>().mapController = controller;
    final source = LatLng(
        double.parse(widget.nearbyRideRequest.data!.request!.latFrom!),
        double.parse(widget.nearbyRideRequest.data!.request!.lngFrom!));
    final des = LatLng(
        double.parse(widget.nearbyRideRequest.data!.request!.latTo!),
        double.parse(widget.nearbyRideRequest.data!.request!.lngTo!));
    context.read<MapsCubit>().emitPlaceDirections(
        origin: source,
        destination: des,
        sessionToken: Uuid().v4(),
        context: context);
    context.read<MapsCubit>().getUserUpdatedLocation(title: 'captin');
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
