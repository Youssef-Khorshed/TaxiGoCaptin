import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';

part 'nearby_ride_requests_state.dart';

class NearbyRideRequestsCubit extends Cubit<NearbyRideRequestsState> {
  final NearbyRideRequestsRepoImpl nearbyRideRequestsRepoImpl;

  NearbyRideRequestsCubit(this.nearbyRideRequestsRepoImpl)
      : super(NearbyRideRequestsInitial());

  Stream<NearbyRideRequestsModel> getNearbyRideRequests(BuildContext context) {
    return Stream.periodic(Duration(seconds: 10), (_) async {
      final res =
          await nearbyRideRequestsRepoImpl.fetchNearbyRideRequests(context);

      return res.fold(
        (failure) => NearbyRideRequestsModel(
            success: false, message: failure.message, data: []),
        (data) => data,
      );
    }).asyncMap((futureData) => futureData);
  }
}
