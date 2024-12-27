import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
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
    try {
      final response = await apiService.getRequest(
          context: context, Constants.nearbyRideRequestsEndPoint);
      print('hhhhhhhh ${response["data"]}');

      return Right(NearbyRideRequestsModel.fromJson(response));
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
