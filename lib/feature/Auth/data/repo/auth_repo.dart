import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';

import 'package:dartz/dartz.dart';

import '../models/create_profile_model/create_profile_model.dart';
import '../models/forget_password_model/Forget_password_model.dart';
import '../models/get_cities_model/GetCitiesModel.dart';
import '../models/get_districts_by_cities/GetDistrictsByCities.dart';
import '../models/log_out/Log_out_model.dart';
import '../models/login_model/LoginModel.dart';

import '../models/login_model/set_password_model.dart';
import '../models/send_verification_code_model/send_verification_code_model.dart';
import '../models/set_password_model/SendPasswordModel.dart';
import '../models/sign_up_model/Data.dart';
import '../models/verify_account/verify_account.dart';

abstract class AuthRepo {


  Future<Either<Failure, LoginModel>> signIn(
      {required String phone,
        required String password,
        required BuildContext context});

  Future<Either<Failure, SetPasswordModel>>  setPassword(

      {
        required String password, required String passwordConfirmation, required BuildContext context
      }) ;

  Future<Either<Failure,LogOutModel>>logout(BuildContext context);

  Future<Either<Failure,SendVerificationCodeModel>>sendVerificationCode(BuildContext context);
  Future<Either<Failure,VerifyAccount>>verifyAccount(BuildContext context,int otp);
  Future<Either<Failure,SendPasswordModel>>setRegisterPassword(BuildContext context,Map<String,dynamic>body);
  Future<Either<Failure,ForgetPasswordModel>>forgetPassword(BuildContext context,String phone);
  Future<Either<Failure,SendVerificationCodeModel>>forgotPasswordCheckCode(BuildContext context,{int otp,String phone});


  Future<Either<Failure,RegisterDataModel>> signUp(
      {required String name,
        required String phone,
        required String gender,
        required BuildContext context});

//create profile
Future<Either<Failure, GetCitiesModel>> getCities(BuildContext context);
Future<Either<Failure,GetDistrictsByCitiesModel >> getDistricts(BuildContext context, int cityId);
Future<Either<Failure,CreateProfileModel>> createProfile(BuildContext context,FormData formData);

  Future<Either<Failure, SetPasswordModel>> setNewPassword({required String passwordConfirmation, required String password,      required String phone, required BuildContext context});

}