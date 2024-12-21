import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/controller/snapping_sheet_cubit/snapping_sheet_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/map_screen_body.dart';

import '../../../core/Utils/colors/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kblue,
      body: BlocProvider(
        create: (context) => SnappingSheetCubit(),
        child: const LocationScreenBody(),
      ),
    );
  }
}
