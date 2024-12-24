import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/trip_detales/date/model/cash_amount_model/cash_amount_model.dart';

abstract class CashAmountRepo {
  Future<Either<Failure, CashAmountModel>> getAmount(BuildContext context);
}
