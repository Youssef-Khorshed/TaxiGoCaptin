import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_driver/core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/models/send_verification_code_model/send_verification_code_model.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/models/set_password_model/SendPasswordModel.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/models/verify_account/verify_account.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/data/repo/otp_repo.dart';

import '../../../../core/Utils/Network/Services/api_constant.dart';
import '../models/forget_password_model/Forget_password_model.dart';

class OtpRepoImpl extends OtpRepo {
  ApiService apiService;
  OtpRepoImpl(this.apiService);
  @override
  Future<Either<Failure, SendVerificationCodeModel>> SendVerificationCode(
      BuildContext context) async {
    try {
     await apiService.getDio(context);
      var response = await apiService.getRequest(
          Constants.baseUrl + Constants.sendVerification,
          context: context);
      SendVerificationCodeModel data =
          SendVerificationCodeModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, VerifyAccount>> verifyAccount(BuildContext context,int otp) async {
    try {

      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.verifyAccount,
          body: {
            "code": otp
          },
          context: context);
      VerifyAccount data =
      VerifyAccount.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, SendPasswordModel>> setRegisterPassword(BuildContext context, Map<String, dynamic> body) async {
    try {

      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.verifyAccount,
          body: body,
          context: context);
      SendPasswordModel data =
      SendPasswordModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(BuildContext context, String phone) async {
    try {

      var response = await apiService.getRequest(
          Constants.baseUrl + Constants.forgotPassword,

          queryParameters:{"identifier":phone} ,
          context: context);
      ForgetPasswordModel data =
      ForgetPasswordModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data.toString(),
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }   }

  @override
  Future<Either<Failure, SendVerificationCodeModel>> forgotPasswordCheckCode(BuildContext context,{ int? otp, String? phone}) async {
    try {

      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.forgotPasswordCheckCode,
          body: {
            "identifier": phone,
            "code": otp
          },
          context: context);
      SendVerificationCodeModel data =
      SendVerificationCodeModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }  }
}
