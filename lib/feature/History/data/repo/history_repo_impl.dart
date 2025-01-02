import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/exception.dart';
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
      Constants.historyEndPoint,
      context: context,
    );

    try {
      HistoryDataModel historyDataModel = HistoryDataModel.fromJson(response);

      return Right(historyDataModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(message: ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
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
    try {
      AddToSaveToFavTripModel saveTripModel =
          AddToSaveToFavTripModel.fromJson(response);

      return Right(saveTripModel);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
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
    try {
      AddToSaveToFavTripModel favTripModel =
          AddToSaveToFavTripModel.fromJson(response);

      return Right(favTripModel);
    } on NoInternetException {
      return Left(InternetConnectionFailure(message: 'No internet Connection'));
    } on ServerException catch (e) {
      return Left(InternetConnectionFailure(message: e.message.toString()));
    }
  }
}
