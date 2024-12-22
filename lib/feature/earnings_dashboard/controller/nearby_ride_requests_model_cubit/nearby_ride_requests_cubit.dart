import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/streanListener.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo_impl.dart';

part 'nearby_ride_requests_state.dart';

class NearbyRideRequestsCubit extends Cubit<NearbyRideRequestsState> {
  NearbyRideRequestsCubit(this.nearbyRideRequestsRepoImpl)
      : super(NearbyRideRequestsInitial());

  final NearbyRideRequestsRepoImpl nearbyRideRequestsRepoImpl;
  DataService<Either<Failure, NearbyRideRequestsModel>>? dataService;
  Timer? _timer;

  Future<void> getNearbyRideRequests(BuildContext context) async {
    emit(NearbyRideRequestsLoading());
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      final res =
          await nearbyRideRequestsRepoImpl.fetchNearbyRideRequests(context);

      res.fold(
        (ifLeft) => emit(NearbyRideRequestsFailure(ifLeft.message)),
        (ifRight) => emit(NearbyRideRequestsSuccess(ifRight)),
      );
    });
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    return super.close();
  }
}
