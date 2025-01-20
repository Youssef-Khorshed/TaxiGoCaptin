import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/paid_after_ride_model/paid_after_ride_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/paid_repo/paid_after_ride_repo.dart';

class PaidAfterRideRepoIpm implements PaidAfterRideRepo {
  final ApiService apiService;

  PaidAfterRideRepoIpm({required this.apiService});

  @override
  Future<Either<Failure, PaidAfterRideModel>> pay(
      BuildContext context, double paid) async {
    final ratStatus = await apiService.postRequest(
      Constants.payAfterRide,
      context: context,
      body: {
        "paid": paid,
      },
    );
    return ratStatus.fold(
        (l) => Left(ServerFailure(message: l)),
        (res) => Right(
              PaidAfterRideModel.fromJson(res.data),
            ));
  }
}
