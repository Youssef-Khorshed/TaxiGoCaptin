import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/profile/data/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfielModel>> fetchUserInfo(BuildContext context);
}
