import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:taxi_go_driver/feature/Map/Controller/mapCubit.dart';
import 'package:taxi_go_driver/feature/Map/map_widget/custom_map.dart';
import 'package:taxi_go_driver/feature/Map/screens/custom_map_widgets/custom_OnGoingWayRider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    _initializeMapRenderer();
    super.initState();
  }

  void _initializeMapRenderer() {
    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<MapsCubit>();
    return Scaffold(
        body: ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(children: [
        const CustomMap(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomOngoingwayrider(
            captinName: '',
            captinImage: '',
            captinRating: '',
            originTitle: '',
            originSubTitle: '',
            destinationTitle: '',
            destinationSubTitle: '',
            distance: '',
            time: '',
          ),
        )
      ]),
    ));
  }
}
