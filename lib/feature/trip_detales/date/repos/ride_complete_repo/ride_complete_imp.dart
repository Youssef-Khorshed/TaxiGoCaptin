import 'package:dartz/dartz.dart';
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
    final response =
        await apiService.getRequest(context: context, Constants.completeRide);

    return response.fold((ifLeft) => Left(ServerFailure(message: ifLeft)),
        (response) async {
      RideCompleteDetailsModel rideDetails =
          RideCompleteDetailsModel.fromJson(response.data["data"]);
      final res = await RideCompleteDetailsModel.fromJson(rideDetails.toJson());
      return Right(res);
    });
  }
}
