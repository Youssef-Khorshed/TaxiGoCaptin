import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/sign_in/data/login_model/set_password_model.dart';
import 'package:taxi_go_driver/feature/sign_in/data/repo/sign_in_repo.dart';

import '../../../../../core/Utils/Network/Services/api_constant.dart';
import '../login_model/login_model.dart';

class SingInRepoImpl extends SignInRepo {
  ApiService apiService;
  SingInRepoImpl(this.apiService);




  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String phone,
      required String password,
      required BuildContext context}) async {
 try{
   var response = await apiService.postRequest(
       Constants.baseUrl + Constants.login,
       body: {"identifier": phone, "password": password},
       context: context);
   return Right(LoginModel.fromJson(response));
 }catch(e){
   if(e is DioException){
     return Left(ServerFailure.fromDioError(e));
   }else{
     return Left(ServerFailure( message: e.toString()));
   }
 }

  }

  @override
  Future<Either<Failure, SetPasswordModel>> setPassword({required String password, required String passwordConfirmation, required BuildContext context}) async {
    try{
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.setPassword,
          body: {"password": password, "password_confirmation": passwordConfirmation},
          context: context);
      return Right(SetPasswordModel.fromJson(response));
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }else{
        return Left(ServerFailure( message: e.toString()));
      }
    }
  }
}
