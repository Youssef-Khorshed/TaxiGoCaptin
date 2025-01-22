import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';

import 'package:taxi_go_driver/feature/earnings_dashboard/data/models/nearby_ride_requests.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/data/repos/captain_documents_repo.dart';

class NearbyRideRequestsRepoImpl extends NearbyRideRequestsRepo {
  final ApiService apiService;
  NearbyRideRequestsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, NearbyRideRequestsModel>> fetchNearbyRideRequests(
      BuildContext context) async {
    final response = await apiService.getRequest(
        context: context, Constants.nearbyRideRequestsEndPoint);
    return response.fold((ifLeft) {
      log(ifLeft);
      return Left(ServerFailure(message: ifLeft));
    }, (response) {
      return Right(NearbyRideRequestsModel.fromJson(response.data));
    });
  }
}
