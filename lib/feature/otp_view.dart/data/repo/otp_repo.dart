import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/models/verify_account/verify_account.dart';

import '../models/forget_password_model/Forget_password_model.dart';
import '../models/send_verification_code_model/send_verification_code_model.dart';
import '../models/set_password_model/SendPasswordModel.dart';

abstract class OtpRepo{

  Future<Either<Failure,SendVerificationCodeModel>>SendVerificationCode(BuildContext context);
  Future<Either<Failure,VerifyAccount>>verifyAccount(BuildContext context,int otp);
  Future<Either<Failure,SendPasswordModel>>setRegisterPassword(BuildContext context,Map<String,dynamic>body);
  Future<Either<Failure,ForgetPasswordModel>>forgetPassword(BuildContext context,String phone);


  Future<Either<Failure,SendVerificationCodeModel>>forgotPasswordCheckCode(BuildContext context,{int otp,String phone});




}