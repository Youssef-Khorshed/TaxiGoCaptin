import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/data/model/Register_model.dart';

import '../../../../core/Utils/Network/Error/failure.dart';
import '../model/Data.dart';

abstract class SignUpRepo {

  Future<Either<Failure,RegisterDataModel>> signUp(
  {required String name,
  required String phone,
  required String gender,
  required BuildContext context});

}