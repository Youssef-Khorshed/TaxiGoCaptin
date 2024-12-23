import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/feature/sign_in/data/login_model/login_model.dart';

import '../../../../core/Utils/Network/Error/failure.dart';
import '../login_model/data.dart';
import '../login_model/set_password_model.dart';

abstract class SignInRepo {
  Future<Either<Failure, LoginModel>> signIn(
      {required String phone,
      required String password,
      required BuildContext context});

  Future<Either<Failure, SetPasswordModel>>  setPassword(

  {
    required String password, required String passwordConfirmation, required BuildContext context
  }) ;
}
