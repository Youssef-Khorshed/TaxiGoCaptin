import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/home/Data/model/getride.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Getride>>> getdata(
      {required BuildContext context});
}
