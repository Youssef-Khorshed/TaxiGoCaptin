import 'package:dartz/dartz.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/ride_complete_repo/ride_complete.dart';

class RideCompleteRepoImpl implements RideCompleteRepo {
  final ApiService apiService;

  RideCompleteRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, RideCompleteDetailsModel>> getRideCompleteDetails(
      context) async {
    try {
      final response =
          await apiService.getRequest(context: context, Constants.completeRide);
      RideCompleteDetailsModel rideDetails =
          RideCompleteDetailsModel.fromJson(response["data"]);
      print("response");
      print(rideDetails.toJson());

      return Right(
        await RideCompleteDetailsModel.fromJson(rideDetails.toJson()),
      );
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    }
  }
}
