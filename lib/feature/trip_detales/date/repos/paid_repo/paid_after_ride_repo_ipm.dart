import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
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
    try {
      // استخدام await للحصول على نتيجة postRequest
      final ratStatus = await apiService.postRequest(
        Constants.payAfterRide,
        context: context,
        body: {
          "paid": paid,
        },
      );
      print("**************************${ratStatus}");

      return Right(
        PaidAfterRideModel.fromJson(ratStatus),
      );
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    } catch (e) {
      return Left(InternetConnectionFailure(message: 'Unexpected error: $e'));
    }
  }
}
