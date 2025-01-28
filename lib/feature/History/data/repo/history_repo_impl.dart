import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/History/data/history_data_model.dart';
import 'package:taxi_go_driver/feature/History/data/repo/history_repo.dart';
import 'package:taxi_go_driver/feature/History/data/save_trip_model.dart';

class HistoryRepoImpl extends HistoryRepo {
  ApiService apiService;
  HistoryRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, HistoryDataModel>> getData(BuildContext context,
      {String? tripHistory}) async {
    var response = await apiService.getRequest(
      "${Constants.historyEndPoint}$tripHistory",
      context: context,
    );
    ;
    return response.fold((ifLeft) => Left(ServerFailure(message: ifLeft)),
        (response) {
      HistoryDataModel historyDataModel =
          HistoryDataModel.fromJson(response.data);
      return Right(historyDataModel);
    });
  }

  @override
  Future<Either<Failure, AddToSaveToFavTripModel>> saveTrip(
      BuildContext context, int rideId) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.saveTripEndPoint,
        context: context,
        body: {
          "ride_id": rideId,
        });

    return response.fold((ifLeft) => Left(ServerFailure(message: ifLeft)),
        (response) {
      AddToSaveToFavTripModel saveTripModel =
          AddToSaveToFavTripModel.fromJson(response.data);

      return Right(saveTripModel);
    });
  }

  @override
  Future<Either<Failure, AddToSaveToFavTripModel>> addToFavTrip(
      BuildContext context, int rideId) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.addFavTripEndPoint,
        context: context,
        body: {
          "ride_id": rideId,
        });
    return response.fold((ifLeft) => Left(ServerFailure(message: ifLeft)),
        (response) {
      AddToSaveToFavTripModel favTripModel =
          AddToSaveToFavTripModel.fromJson(response.data);
      return Right(favTripModel);
    });
  }
}
