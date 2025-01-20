import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/cash_amount_model/cash_amount_model.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/repos/cash_amount_repo/cash_amount_repo.dart';

class CashAmountRepoIpm implements CashAmountRepo {
  final ApiService apiService;

  CashAmountRepoIpm({required this.apiService});
  @override
  Future<Either<Failure, CashAmountModel>> getAmount(
      BuildContext context) async {
    final response =
        await apiService.getRequest(context: context, Constants.getAmount);
    return response.fold((l) => Left(ServerFailure(message: l)),
        (response) async {
      CashAmountModel rideDetails =
          CashAmountModel.fromJson(response.data["data"]);

      final value = await CashAmountModel.fromJson(rideDetails.toJson());
      return Right(value);
    });
  }
}
